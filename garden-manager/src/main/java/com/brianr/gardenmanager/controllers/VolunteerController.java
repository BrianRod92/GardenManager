package com.brianr.gardenmanager.controllers;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brianr.gardenmanager.models.ChatMessage;
import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.services.EventService;
import com.brianr.gardenmanager.services.VolunteerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class VolunteerController {
	
	@Autowired
	private VolunteerService volunteerService;
	
	@Autowired
	private EventService eventService;
	
//	RENDERS VOLUNTEERS DASHBOARD PAGE
	@GetMapping("/volunteer-dashboard")
	public String renderVolunteerDashboard(Model model, HttpSession session) {
		if(session.getAttribute("VolunteerId") == null) {
			
			return "redirect:/login";
		}
		
		if(session.getAttribute("VolunteerId") != null) {
			Object volunteerIdObj = session.getAttribute("VolunteerId");
		    Long volunteerId = (Long) volunteerIdObj;
		    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
		    
		 // Fetch the joined events for the volunteer
	        List<Event> joinedEvents = volunteer.getEvents();
	        
			 // Fetch the new message count
	        int newMessageCount = volunteer.getNewMessageCount();
	        System.out.println(newMessageCount);
	        model.addAttribute("newMessageCount", newMessageCount);
	        List<Event> eventsList = eventService.findEventsByCity(volunteer.getLocation());
	        System.out.println(volunteer.getLocation());
	        model.addAttribute("volunteer", volunteer);
	        model.addAttribute("joinedEvents", joinedEvents);
	        model.addAttribute("eventsList", eventsList);
	        model.addAttribute("newMessage", new ChatMessage());
			}
		
		return "volunteerDashboard.jsp";
	}
	
	

	
	 // Endpoint for joining an event
	@GetMapping("/join-{eventId}")
	public String joinEvent(@PathVariable("eventId") Long eventId, HttpSession session) {
	    Object volunteerIdObj = session.getAttribute("VolunteerId");
	    Long volunteerId = (Long) volunteerIdObj;
	    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
	    Event event = eventService.findEvent(eventId);

	    if (event != null && volunteer != null) {
	        if (!event.getVolunteers().contains(volunteer)) {
	            event.getVolunteers().add(volunteer);
				eventService.updateEvent(event); 
	        }
	    }

	    return "redirect:/volunteer-dashboard";
	}


    // Endpoint for canceling an event
	@GetMapping("/cancel-{eventId}")
	public String cancelEvent(@PathVariable("eventId") Long eventId, HttpSession session) {
	    Object volunteerIdObj = session.getAttribute("VolunteerId");
	    Long volunteerId = (Long) volunteerIdObj;
	    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
	    Event event = eventService.findEvent(eventId);

	    if (event != null && volunteer != null) {
	        if (event.getVolunteers().contains(volunteer)) {
	            event.getVolunteers().remove(volunteer);
	            eventService.updateEvent(event);
	        }
	    }

	    return "redirect:/volunteer-dashboard";
	}

	

}
