package com.brianr.gardenmanager.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.brianr.gardenmanager.models.ChatMessage;
import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.Manager;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.services.ManagerService;
import com.brianr.gardenmanager.services.VolunteerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class IndexController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private VolunteerService volunteerService;
	
//	RENDERS HOME PAGE
	@GetMapping("/home")
	public String renderHomePage(Model model, HttpSession session) {
	    

		if(session.getAttribute("ManagerId") != null) {
			Object managerIdObj = session.getAttribute("ManagerId");
		    Long managerId = (Long) managerIdObj;
		    Manager manager = managerService.findManager(managerId);
			 // Fetch the new message count
	        int newMessageCount = manager.getNewMessageCount();
	        System.out.println(newMessageCount);
	        model.addAttribute("newMessageCount", newMessageCount);
			}
		if(session.getAttribute("VolunteerId") != null) {
			Object volunteerIdObj = session.getAttribute("VolunteerId");
		    Long volunteerId = (Long) volunteerIdObj;
		    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
		    int newMessageCount = volunteer.getNewMessageCount();
		    model.addAttribute("newMessageCount", newMessageCount);
			model.addAttribute("VolunteerId", volunteerId);
		}

	    return "Home.jsp";
	}
	
//	RENDERS ABOUT US PAGE
	@GetMapping("/about")
	public String renderHomeAboutUs(Model model, HttpSession session) {
	    

		if(session.getAttribute("ManagerId") != null) {
			Object managerIdObj = session.getAttribute("ManagerId");
		    Long managerId = (Long) managerIdObj;
		    Manager manager = managerService.findManager(managerId);
			 // Fetch the new message count
	        int newMessageCount = manager.getNewMessageCount();
	        System.out.println(newMessageCount);
	        model.addAttribute("newMessageCount", newMessageCount);
			}
		if(session.getAttribute("VolunteerId") != null) {
			Object volunteerIdObj = session.getAttribute("VolunteerId");
		    Long volunteerId = (Long) volunteerIdObj;
		    Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
		    int newMessageCount = volunteer.getNewMessageCount();
		    model.addAttribute("newMessageCount", newMessageCount);
			model.addAttribute("VolunteerId", volunteerId);
		}

	    return "aboutUs.jsp";
	}
	
	
}
