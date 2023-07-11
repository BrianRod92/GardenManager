package com.brianr.gardenmanager.services;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.repositories.EventRepository;

import jakarta.transaction.Transactional;

@Service
public class EventService {
	
	@Autowired
	private EventRepository eventRepo;
	
	@Autowired
	private VolunteerService volunteerService;
	
//	FIND ALL EventS
	public List<Event> allEvents(){
		return eventRepo.findAll();
	}
	
//	ADD/CREATE Event
	@Transactional
	public Event createEvent(Event newEvent) {
		return eventRepo.save(newEvent);	
	}
	
//	FIND Event BY ID
	public Event findEvent(Long id) {
		Optional<Event> optionalEvent = eventRepo.findById(id);
		if(optionalEvent.isPresent()) {
			return optionalEvent.get();
		} else {
		return null;
		}
	}
	
//	FIND EVENTS BY CITY
	public List<Event> findEventsByCity(String city) {
	   
	    return eventRepo.findByCity(city);
	}
	
	// Retrieves events for a given manager
    public List<Event> getEventsByManager(Long managerId) {
        
        return eventRepo.findByManagerId(managerId);
    }
    
 

    
 // Retrieves events for a given manager and a date range
    public List<Event> getEventsByManagerAndDateRange(Long managerId, Date start, Date end) {
        return eventRepo.findByManagerIdAndStartBetween(managerId, start, end);
    }
    
    public List<Event> getEventsWithNewMessages() {
        return eventRepo.findByChatMessagesHasNewMessagesTrue();
    }
    
    public List<Event> findEventsWithNewMessagesByManagerId(Long managerId) {
        return eventRepo.findEventsWithNewMessagesByManagerId(managerId);
    }
    
    public List<Event> findEventsWithNewMessagesByVolunteerId(Long volunteerId) {
        Volunteer volunteer = volunteerService.findVolunteer(volunteerId);
        return eventRepo.findEventsWithNewMessagesByVolunteers(volunteer);
    }



	
//	UPDATE Event
	public Event updateEvent(Event oneEvent) {
		return eventRepo.save(oneEvent);
	}
	
//	DELETE Event
	public void deleteEvent(Long id) {
		eventRepo.deleteById(id);
		
	}

	 public Event findEvent(Volunteer volunteer) {
	        // Retrieve the list of events associated with the volunteer
	        List<Event> volunteerEvents = volunteer.getEvents();
	        
	        
	        if (!volunteerEvents.isEmpty()) {
	            return volunteerEvents.get(0);
	        }

	        // Return null if no event is found
	        return null;
	    }

}
