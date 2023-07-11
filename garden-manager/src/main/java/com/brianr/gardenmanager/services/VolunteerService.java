package com.brianr.gardenmanager.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.LoginVolunteer;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.repositories.VolunteerRepository;

import jakarta.transaction.Transactional;



@Service
@Transactional
public class VolunteerService {
	
	@Autowired
	private VolunteerRepository volunteerRepo;
	
//	EMAIL VALIDATIONS FOR REGISTER & LOGIN
	public Volunteer register(Volunteer newVolunteer, BindingResult result) {
		Optional<Volunteer> optionalVolunteer = volunteerRepo.findByEmail(newVolunteer.getEmail());
		if(optionalVolunteer.isPresent()) {
			result.rejectValue("email", "registered", "Email is already registered.");	
		}
		if(!newVolunteer.getPassword().equals(newVolunteer.getConfirm())) {
			result.rejectValue("confirm", "matches", "Passwords do not match! Try again.");	
		}
		if(result.hasErrors()) {
			return null;
			
		}
		
		String hashedPW = BCrypt.hashpw(newVolunteer.getPassword(), BCrypt.gensalt());
		newVolunteer.setPassword(hashedPW);
		return volunteerRepo.save(newVolunteer);
	}
	
	public Volunteer login(LoginVolunteer newLogin, BindingResult result) {
		Optional<Volunteer> optionalVolunteer = volunteerRepo.findByEmail(newLogin.getEmail());
		if(!optionalVolunteer.isPresent()) {
			result.rejectValue("email", "notRegistered", "Email is not registered.");
			return null;
		} 
		Volunteer volunteer = optionalVolunteer.get();
			if(!BCrypt.checkpw(newLogin.getPassword(), volunteer.getPassword())) {
				result.rejectValue("password", "matches", "Invalid password. Try again.");
			}
		
		
		return volunteer;
	}

	
//	FIND ALL Volunteers
	public List<Volunteer> allVolunteers(){
		return volunteerRepo.findAll();
	}
	
//	ADD/CREATE Volunteer
	public Volunteer createVolunteer(Volunteer newVolunteer) {
		return volunteerRepo.save(newVolunteer);	
	}
	
//	FIND Volunteer BY ID
	public Volunteer findVolunteer(Long id) {
		Optional<Volunteer> optionalVolunteer = volunteerRepo.findById(id);
		if(optionalVolunteer.isPresent()) {
			return optionalVolunteer.get();
		} else {
		return null;
		}
	}
	
//	UPDATE Volunteer
	public Volunteer updateVolunteer(Volunteer oneVolunteer) {
		return volunteerRepo.save(oneVolunteer);
	}
	
	@Transactional
	public Volunteer joinEvent(Volunteer volunteer, Event event) {
        List<Event> events = volunteer.getEvents();
		 events.add(event); 
		volunteer.setEvents(events); 
        return volunteerRepo.save(volunteer);
    }
	
//	DELETE Volunteer
	public void deleteVolunteer(Long id) {
		volunteerRepo.deleteById(id);
		
	}

}
