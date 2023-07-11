package com.brianr.gardenmanager.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brianr.gardenmanager.models.ChatMessage;
import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.Manager;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.services.ChatMessageService;
import com.brianr.gardenmanager.services.EventService;
import com.brianr.gardenmanager.services.ManagerService;
import com.brianr.gardenmanager.services.VolunteerService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class ChatMessageController {
	
	@Autowired
	private ChatMessageService messageService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private VolunteerService volunteerService;
	
	@Autowired
	private EventService eventService;
	
//	PROCESSES CREATING NEW MESSAGE
	@Transactional
	@PostMapping("/create-Message")
	public String processNewChatMessage(HttpSession session, @Valid @ModelAttribute("newMessage")ChatMessage newMessage,
			BindingResult result) {
		if(result.hasErrors() && session.getAttribute("ManagerId") != null) {
//			
			
			System.out.println(result.getFieldError(null));
			return "redirect:/home";
		}
		
		if(result.hasErrors() && session.getAttribute("VolunteerId") != null) {
//			
			
			System.out.println(result.getFieldError(null));
			return "redirect:/home";
		}
		
		if(session.getAttribute("ManagerId") != null) {
		messageService.createChatMessage(newMessage);
		
//		 Set hasNewMessages to true for the associated event
		Event event = eventService.findEvent(newMessage.getEvent().getId());
		event.setHasNewMessages(true);
		eventService.createEvent(event);
		
		Long eventId = newMessage.getEvent().getId(); // Retrieve the event ID
	    
	    return "redirect:/event-details-" + eventId; // Redirect to the event details page
		
		}else if (session.getAttribute("VolunteerId") != null) {
			messageService.createChatMessage(newMessage);
			
//			 Set hasNewMessages to true for the associated event
			Event event = eventService.findEvent(newMessage.getEvent().getId());
			event.setHasNewMessages(true);
			eventService.createEvent(event);
			
			Long eventId = newMessage.getEvent().getId(); // Retrieve the event ID
		    
		    return "redirect:/event-details-" + eventId; // Redirect to the event details page
			}
		
		return "redirect:/login";
	}
	
	
	
	@GetMapping("/new-message-count")
	@ResponseBody
	public Map<String, Integer> getNewMessageCount(HttpSession session) {
		if(session.getAttribute("ManagerId") != null || session.getAttribute("volunteerId") != null) {
		Long managerId = (Long) session.getAttribute("ManagerId"); // Retrieve the manager based on the current user or session
		Manager manager = managerService.findManager(managerId);
	    int newMessageCount = manager.getNewMessageCount();
	    Map<String, Integer> response = new HashMap<>();
	    response.put("newMessageCount", newMessageCount);
	    System.out.println(newMessageCount);
	    
	    return response;
		}

		return null;
	}
	
	

	


}
