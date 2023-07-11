package com.brianr.gardenmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.brianr.gardenmanager.models.ChatMessage;
import com.brianr.gardenmanager.models.Volunteer;

@Repository
public interface ChatMessageRepository extends CrudRepository<ChatMessage, Long>{
	
	List<ChatMessage> findAll();
	
	List<ChatMessage> findByEventId(Long eventId);
	
	List<ChatMessage> findBySender(Volunteer volunteer);

}
