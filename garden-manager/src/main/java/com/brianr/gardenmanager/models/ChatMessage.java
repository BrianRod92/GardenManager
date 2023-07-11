package com.brianr.gardenmanager.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;

@Entity
@Table(name="chatMessages")
public class ChatMessage {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty
	private String message;
	
	private boolean hasNewMessages;
	
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
	
//	RELATIONSHIPS HANDLING
	
	@ManyToOne
    private Event event;
	
	

    @ManyToOne
    private Volunteer sender;
    
    @ManyToOne
    private Manager manager;
    
    

	
//	EMPTY CONSTRUCTOR
	public ChatMessage() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Volunteer getSender() {
		return sender;
	}

	public void setSender(Volunteer sender) {
		this.sender = sender;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void setManager(Long managerId) {
		// TODO Auto-generated method stub
		
	}

	public void setEvent(Long eventId) {
		// TODO Auto-generated method stub
		
	}

	public boolean isHasNewMessages() {
		return hasNewMessages;
	}

	public void setHasNewMessages(boolean hasNewMessages) {
		this.hasNewMessages = hasNewMessages;
	}

	
	
	
	
	

}
