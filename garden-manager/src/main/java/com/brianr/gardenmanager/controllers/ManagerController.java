package com.brianr.gardenmanager.controllers;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brianr.gardenmanager.models.ChatMessage;
import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.Manager;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.repositories.ManagerRepository;
import com.brianr.gardenmanager.repositories.VolunteerRepository;
import com.brianr.gardenmanager.services.ChatMessageService;
import com.brianr.gardenmanager.services.EventService;
import com.brianr.gardenmanager.services.ManagerService;
import com.brianr.gardenmanager.services.VolunteerService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private VolunteerService volunteerService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private ChatMessageService messageService;
	
	@Autowired
	private ManagerRepository managerRepo;
	
	@Autowired
	private VolunteerRepository volunteerRepo;
	
//	RENDERS MANAGERS DASHBOARD PAGE
	@GetMapping("/manager-dashboard")
	public String renderManagerDashboard(Model model, HttpSession session) {
	    if (session.getAttribute("ManagerId") == null) {
	        return "redirect:/login";
	    }

	    Object managerIdObj = session.getAttribute("ManagerId");
	    if (managerIdObj != null && managerIdObj instanceof Long) {
	        Long managerId = (Long) managerIdObj;
	        Manager manager = managerService.findManager(managerId);
	        List<Event> eventsList = eventService.findEventsByCity(manager.getLocation());
	        List<ChatMessage> messageList = new ArrayList<>();
	        
	        List<Event> managerEventsList = eventService.getEventsByManager(managerId);
	       
			
			
			 
	        model.addAttribute("Manager", manager);
			
	        model.addAttribute("managersEventsList", managerEventsList);
	        
	        model.addAttribute("eventsList", eventsList);
	        model.addAttribute("messageList", messageList);
	        model.addAttribute("newMessage", new ChatMessage());
	        
	    } else {
	        
	        
	    }

	    return "managerDashboard.jsp";
	}
	
//	RENDERS CREATE NEW EVENT
	@GetMapping("/create-Event")
	public String renderNewEventsPage(HttpSession session, Model model) {
		if(session.getAttribute("ManagerId") == null) {
			return "redirect:/login";
		}
		if(session.getAttribute("ManagerId") != null) {
			Object managerIdObj = session.getAttribute("ManagerId");
		    Long managerId = (Long) managerIdObj;
		    Manager manager = managerService.findManager(managerId);
			 // Fetch the new message count
	        int newMessageCount = manager.getNewMessageCount();
	        System.out.println(newMessageCount);
	        model.addAttribute("newMessageCount", newMessageCount);
			}
		model.addAttribute("newEvent", new Event());
		return "createEvent.jsp";
	}
	
//	PROCESSES CREATING NEW Event
	@PostMapping("/create-Event")
	public String processNewEvent(@Valid @ModelAttribute("newEvent")Event newEvent,
			BindingResult result) {
		if(result.hasErrors()) {
			return "createEvent.jsp";
		}
		eventService.createEvent(newEvent);
		return "redirect:/manager-dashboard";
	}
	
	@GetMapping("/events")
	@ResponseBody
	public ResponseEntity<?> getEventsData(HttpSession session,
	    @RequestParam("start") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date start,
	    @RequestParam("end") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date end) {
	  Long managerId = (Long) session.getAttribute("ManagerId");
	  if (managerId != null) {
	    List<Event> managerEventsList = eventService.getEventsByManager(managerId);
	    JSONArray eventsJson = new JSONArray();
	    for (Event event : managerEventsList) {
	      JSONObject eventJson = new JSONObject();
	      eventJson.put("title", event.getEventName()); 
	      eventJson.put("start", event.getStart()); 
	      eventJson.put("end", event.getEnd()); 
	      eventsJson.put(eventJson);
	    }
//	    System.out.println(eventsJson);
	    return ResponseEntity.ok(eventsJson.toString());
	  }

	  // Return a custom JSON object with an error message
	  JSONObject errorJson = new JSONObject();
	  errorJson.put("error", "Manager ID not found");
	  return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorJson.toString());
	}
	
	//	Handles Notifications update page
	@GetMapping("/notifications")
	public String showNotificationsPage(Model model, HttpSession session) {
	    if (session.getAttribute("ManagerId") == null && session.getAttribute("VolunteerId") == null) {
	        return "redirect:/login";
	    }

	    if (session.getAttribute("ManagerId") != null ) {
	        Long managerId = (Long) session.getAttribute("ManagerId");
	        Manager manager = managerService.findManager(managerId);

	        // Fetch the new message count
	        int newMessageCount = manager.getNewMessageCount();

	        // Reset the new message count to 0
	        manager.setNewMessageCount(0);

	        // Update the manager attributes
	        Manager existingManager = managerRepo.findById(manager.getId()).orElse(null);
	        if (existingManager != null) {
	            existingManager.setCommunityName(manager.getCommunityName());
	            existingManager.setLocation(manager.getLocation());
	            existingManager.setManagerName(manager.getManagerName());
	            existingManager.setEmail(manager.getEmail());
	            existingManager.setPhoneNumber(manager.getPhoneNumber());
	            existingManager.setPassword(manager.getPassword());
	            existingManager.setConfirm(existingManager.getPassword());
	            managerRepo.save(existingManager);
	        }

	     // Filter events by manager ID
	        List<Event> eventsWithNewMessages = filterEventsByManager(eventService.findEventsWithNewMessagesByManagerId(managerId), managerId);
	        model.addAttribute("events", eventsWithNewMessages);
	        model.addAttribute("newMessageCount", newMessageCount);
	    } else if (session.getAttribute("VolunteerId") != null) {
	        Long volunteerId = (Long) session.getAttribute("VolunteerId");
	        Volunteer volunteer = volunteerService.findVolunteer(volunteerId);

	        // Fetch the new message count
	        int newMessageCount = volunteer.getNewMessageCount();

	     // Reset the new message count to 0
            volunteer.setNewMessageCount(0);

	        // Update the volunteer attributes
	        Volunteer existingVolunteer = volunteerRepo.findById(volunteer.getId()).orElse(null);
	        if (existingVolunteer != null) {
	            existingVolunteer.setFirstName(volunteer.getFirstName());
	            existingVolunteer.setLastName(volunteer.getLastName());
	            existingVolunteer.setLocation(volunteer.getLocation());
	            existingVolunteer.setVolunteerType(volunteer.getVolunteerType());
	            existingVolunteer.setEmail(volunteer.getEmail());
	            existingVolunteer.setPassword(volunteer.getPassword());
	            existingVolunteer.setConfirm(existingVolunteer.getPassword());
	            volunteerRepo.save(existingVolunteer);
	        }

			
	        Event event = eventService.findEvent(existingVolunteer);

	        if (event != null) {
	            // Retrieve the manager ID from the event
	            Long managerId = event.getManager().getId();
	            Manager manager = managerService.findManager(managerId);

	            // Check if newMessageCount is within the bounds of the eventsWithNewMessages list
	            List<Event> eventsWithNewMessages = filterEventsByManager(eventService.findEventsWithNewMessagesByManagerId(managerId), managerId);
	            model.addAttribute("events", eventsWithNewMessages);
	            model.addAttribute("newMessageCount", newMessageCount);
	        }
	    }

	    return "notifications.jsp";
	}
	
	// Helper method to filter events by manager ID
		private List<Event> filterEventsByManager(List<Event> events, Long Id) {
		    List<Event> filteredEvents = new ArrayList<>();
		    for (Event event : events) {
		        if (event.getManager().getId().equals(Id)) {
		            filteredEvents.add(event);
		        }
		        else if(event.getVolunteers().get(0).getId().equals(Id)) {
		        	filteredEvents.add(event);
		        }
		    }
		    return filteredEvents;
		}




//	 Renders Event Details
	 @GetMapping("/event-details-{eventId}")
	    public String getEventDetails(HttpSession session, @PathVariable("eventId") Long eventId, Model model) {
		 if(session.getAttribute("ManagerId") == null && session.getAttribute("VolunteerId") == null ) {
				return "redirect:/login";
			}
		 if(session.getAttribute("VolunteerId") != null) {
		 Object volunteerIdObj = session.getAttribute("VolunteerId");
		    Long volunteerId = (Long) volunteerIdObj;
		    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
		 
		    Event event = eventService.findEvent(eventId);

		    if (!volunteer.getEvents().contains(event)) {
		    	
		    	 messageService.deleteChatMessageByVolunteer(volunteer);
		        return "redirect:/volunteer-dashboard";
		    }
		 }
		 
		 if(session.getAttribute("ManagerId") != null) {
		    Object managerIdObj = session.getAttribute("ManagerId");
		    Long managerId = (Long) managerIdObj;
		    Manager manager = managerService.findManager(managerId);
		 	List<ChatMessage> messageList = messageService.getMessagesByEventId(eventId);
	        
	        
	        
	        // Fetch the new message count
	        int newMessageCount = manager.getNewMessageCount();
			/* System.out.println(newMessageCount); */
	        model.addAttribute("newMessageCount", newMessageCount);
	        Event event = eventService.findEvent(eventId);
	        // Add the event to the model
	        model.addAttribute("event", event);
	        model.addAttribute("newMessage", new ChatMessage());
	        model.addAttribute("manager", manager);
	        model.addAttribute("messageList", messageList);
		 }
		 else if(session.getAttribute("VolunteerId") != null) {
			 Object volunteerIdObj = session.getAttribute("VolunteerId");
			    Long volunteerId = (Long) volunteerIdObj;
			    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
			    
				 // Fetch the new message count
		        int newMessageCount = volunteer.getNewMessageCount();
		        System.out.println(newMessageCount);
		        model.addAttribute("newMessageCount", newMessageCount);
		        List<ChatMessage> messageList = messageService.getMessagesByEventId(eventId);
		        Event event = eventService.findEvent(eventId);
		        model.addAttribute("messageList", messageList);
		        model.addAttribute("event", event);
		        model.addAttribute("newMessage", new ChatMessage());
		        model.addAttribute("volunteer", volunteer);
		 }
	        // Return the view name for event details page
	        return "eventDetails.jsp";
	    }

//		DELETES AN EVENT
		@DeleteMapping("/deleteEvent-{id}")
		public String deleteEvent(@PathVariable("id")Long id) {
			eventService.deleteEvent(id);
		return "redirect:/manager-dashboard";	
		}
	 
}
