package com.brianr.gardenmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brianr.gardenmanager.models.ChatMessage;
import com.brianr.gardenmanager.models.Manager;
import com.brianr.gardenmanager.models.Volunteer;
import com.brianr.gardenmanager.repositories.ChatMessageRepository;
import com.brianr.gardenmanager.repositories.ManagerRepository;
import com.brianr.gardenmanager.repositories.VolunteerRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class ChatMessageService {
	
	@Autowired
	private ChatMessageRepository chatMessageRepo;
	
	@Autowired
	private ManagerRepository managerRepo;
	
	@Autowired
	private VolunteerRepository volunteerRepo;
	
	@Autowired
	private HttpSession session;
	
//	FIND ALL ChatMessages
	public List<ChatMessage> allChatMessages(){
		return chatMessageRepo.findAll();
	}
	
	@Transactional
	public Manager updateManager(Manager manager) {
	    Manager existingManager = managerRepo.findById(manager.getId()).orElse(null);
	    if (existingManager != null) {
	        // Update the relevant fields
	        existingManager.setCommunityName(manager.getCommunityName());
	        existingManager.setLocation(manager.getLocation());
	        existingManager.setManagerName(manager.getManagerName());
	        existingManager.setEmail(manager.getEmail());
	        existingManager.setPhoneNumber(manager.getPhoneNumber());
	        existingManager.setPassword(manager.getPassword());

	        // Provide a default value for the confirm field
	        existingManager.setConfirm(existingManager.getPassword());

	        return managerRepo.save(existingManager);
	    } else {
	        // Handle the case when manager with given ID is not found
	        
	    	return null;
	    }
	}
	
	@Transactional
	public Volunteer updateVolunteer(Volunteer volunteer) {
		Volunteer existingVolunteer = volunteerRepo.findById(volunteer.getId()).orElse(null);
	    if (existingVolunteer != null) {
	        // Update the relevant fields
	    	existingVolunteer.setFirstName(volunteer.getFirstName());
	    	existingVolunteer.setLastName(volunteer.getLastName());
	    	existingVolunteer.setLocation(volunteer.getLocation());
	    	existingVolunteer.setVolunteerType(volunteer.getVolunteerType());
	    	existingVolunteer.setEmail(volunteer.getEmail());
	    	existingVolunteer.setPassword(volunteer.getPassword());
	    	existingVolunteer.setConfirm(existingVolunteer.getPassword());

	        return volunteerRepo.save(existingVolunteer);
	    } else {
	        // Handle the case when manager with given ID is not found
	        
	    	return null;
	    }
	}


	
	// ADD/CREATE ChatMessage
	@Transactional
	public ChatMessage createChatMessage(ChatMessage newChatMessage) {
	    // Increment new message count for the manager or volunteer
	    
	    if (newChatMessage.getSender() instanceof Volunteer) {
	        Volunteer volunteer = (Volunteer) newChatMessage.getSender();
	        int previousCount = volunteer.getNewMessageCount();
	        int newCount = previousCount + 1;
	        volunteer.setNewMessageCount(newCount);
	        volunteer = updateVolunteer(volunteer);
	        newChatMessage.setSender(volunteer);
	    }
	    
	    if (newChatMessage.getManager() instanceof Manager) {
	        Manager manager = (Manager) newChatMessage.getManager();
	        int previousCount = manager.getNewMessageCount();
	        int newCount = previousCount + 1;
	        manager.setNewMessageCount(newCount);

	        // Update the manager using the updateManager method
	        manager = updateManager(manager);

	        // Set the updated manager back to the newChatMessage
	        newChatMessage.setManager(manager);
	    } 

	    return chatMessageRepo.save(newChatMessage);
	}





	
//	FIND ChatMessage BY ID
	public ChatMessage findChatMessage(Long id) {
		Optional<ChatMessage> optionalChatMessage = chatMessageRepo.findById(id);
		if(optionalChatMessage.isPresent()) {
			return optionalChatMessage.get();
		} else {
		return null;
		}
	}
	
//	FIND MESSAGES BY EVENT ID
	public List<ChatMessage> getMessagesByEventId(Long eventId) {
        return chatMessageRepo.findByEventId(eventId);
    }
	
//	UPDATE ChatMessage
	public ChatMessage updateChatMessage(ChatMessage oneChatMessage) {
		return chatMessageRepo.save(oneChatMessage);
	}
	
//	DELETE ChatMessage
	public void deleteChatMessage(Long id) {
		chatMessageRepo.deleteById(id);
		
	}
	
	@Transactional
	public void deleteChatMessageByVolunteer(Volunteer volunteer) {
	    List<ChatMessage> messages = chatMessageRepo.findBySender(volunteer);
	    for (ChatMessage message : messages) {
	        chatMessageRepo.delete(message);
	    }
	}


}
