package com.brianr.gardenmanager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.brianr.gardenmanager.models.LoginManager;
import com.brianr.gardenmanager.models.LoginVolunteer;
import com.brianr.gardenmanager.models.Manager;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.services.ManagerService;
import com.brianr.gardenmanager.services.VolunteerService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@Controller
public class RegisterAndLoginController {
	

	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private VolunteerService volunteerService;
	
	
	
	
    
	
//	RENDERS MANAGERS REGISTER PAGE
	@GetMapping("/manage-garden")
	public String renderManagerReg(Model model, HttpSession session) {
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
		model.addAttribute("newManager", new Manager());
		
		return "managerReg.jsp";
	}
	
	
	private boolean validatePhoneNumber(String phoneNumber) {
        String pattern = "\\d{3}-\\d{3}-\\d{4}"; // Example pattern for format XXX-XXX-XXXX
        return phoneNumber.matches(pattern);
    }
	
//	PROCESS MANAGER REGISTRATION
	@PostMapping("/manage-garden")
	@Transactional
	public String processManagerRegistration(@Valid @ModelAttribute("newManager")Manager newManager, BindingResult result, Model model, HttpSession session) {
		Manager registeredManager = managerService.register(newManager, result);
		if(result.hasErrors()) {
			model.addAttribute("newManagerLogin", new LoginManager());
			return "managerReg.jsp";
		} else {
			
			String phoneNumber = newManager.getPhoneNumber(); 
            
            if (!validatePhoneNumber(phoneNumber)) {
                result.rejectValue("phoneNumber", "invalid.phoneNumber", "Invalid phone number");
                return "managerReg.jsp";
            }
	       

	        // Register manager
	        
	        session.setAttribute("managerId", registeredManager.getId());
	        session.setAttribute("managerName", registeredManager.getManagerName());
	        return "redirect:/manager-dashboard";
	    }
		
	}
	
	
	
//	RENDERS Volunteer REGISTER PAGE
	@GetMapping("/garden-volunteer")
	public String renderVolunteerReg(Model model, HttpSession session) {
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
		model.addAttribute("newVolunteer", new Volunteer());
		model.addAttribute("gardensList", managerService.allManagers());
		
		return "volunteerReg.jsp";
	}
	
	
//	PROCESS Volunteer REGISTRATION
	@PostMapping("/garden-volunteer")
	public String processVolunteerRegistration(@Valid @ModelAttribute("newVolunteer")Volunteer newVolunteer, BindingResult result, Model model, HttpSession session) {
		Volunteer registeredVolunteer = volunteerService.register(newVolunteer, result);
		if(result.hasErrors()) {
			model.addAttribute("newVolunteerLogin", new LoginVolunteer());
			model.addAttribute("gardensList", managerService.allManagers());
			return "volunteerReg.jsp";
		} else {
			session.setAttribute("volunteerId", registeredVolunteer.getId());
			session.setAttribute("volunteerName", registeredVolunteer.getFirstName());
			return "redirect:/volunteer-dashboard";
		}
	}
		
//		RENDERS MANAGERS/VOLUNTEERS LOGIN PAGE
		@GetMapping("/login")
		public String renderLoginPage(Model model) {
			model.addAttribute("newVolunteerLogin", new LoginVolunteer());
			model.addAttribute("newManagerLogin", new LoginManager());
			
			
			return "loginpage.jsp";
		}
		
		
//		PROCESS LOGIN MANAGER
		@PostMapping("/login_manager")
		public String processManagerLogin(@Valid @ModelAttribute("newManagerLogin")LoginManager newManagerLogin, BindingResult result, Model model, HttpSession session) {
			Manager loginManager = managerService.login(newManagerLogin, result);
			if(result.hasErrors()) {
				model.addAttribute("newManager", new Manager());
				model.addAttribute("newVolunteerLogin", new LoginVolunteer());
				
				return "loginpage.jsp";
			} else {
				session.setAttribute("ManagerId", loginManager.getId());
				session.setAttribute("ManagerName", loginManager.getManagerName());
				return "redirect:/manager-dashboard";
			}
			
		}
		
	
//		PROCESS LOGIN VOLUNTEER
		@PostMapping("/login_volunteer")
		public String processVolunteerLogin(@Valid @ModelAttribute("newVolunteerLogin")LoginVolunteer newVolunteerLogin, BindingResult result, Model model, HttpSession session) {
			Volunteer loginVolunteer = volunteerService.login(newVolunteerLogin, result);
			if(result.hasErrors()) {
				model.addAttribute("newVolunteer", new Volunteer());
				/* model.addAttribute("newVolunteerLogin", new LoginVolunteer()); */
				model.addAttribute("newManagerLogin", new LoginManager());
				System.out.println(result.getAllErrors());
				return "loginpage.jsp";
			} else {
				session.setAttribute("VolunteerId", loginVolunteer.getId());
				session.setAttribute("VolunteerName", loginVolunteer.getFirstName());
				return "redirect:/volunteer-dashboard";
			}
			
		}
		
		@GetMapping("/logout")
		public String logOut(HttpSession session) {
			session.invalidate();
			return "redirect:/login";
		}
		
	
	
	

}
