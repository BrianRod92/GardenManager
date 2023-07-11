package com.brianr.gardenmanager.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.brianr.gardenmanager.models.Event;
import com.brianr.gardenmanager.models.Volunteer;



@Repository
public interface EventRepository extends CrudRepository<Event, Long>{
	
	List<Event> findAll();
	
	List<Event> findByManagerIdAndStartBetween(Long managerId, Date start, Date end);
	
	List<Event> findByCity(String city);
	
	List<Event> findByManagerId(Long managerId);
	
	List<Event> findByChatMessagesHasNewMessagesTrue();
	
	 List<Event> findAllByManagerId(Long managerId);

	 List<Event> findEventsWithNewMessagesByManagerId(Long managerId);
	 
	 List<Event> findEventsWithNewMessagesByVolunteers(Volunteer volunteer);

	

}
