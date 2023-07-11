package com.brianr.gardenmanager.models;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="events")
public class Event {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty(message= "Event Name is required!")
    @Size(min=5, max=30, message="Event Name must be between 5 and 30 characters")
    private String eventName;
	
	@NotEmpty(message="Adress is required!")
    private String address;
	
	@NotEmpty(message="City is required!")
    private String city;
	
	@NotNull(message="Zipcode is required!")
	@Min(value=5)
    private Integer zipCode;
	
	@NotNull
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start;
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end;
	
	@NotNull
	@DateTimeFormat(pattern="HH:mm")
	private LocalTime time;
	
	
	private String details;
	
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
    
//    RELATIONSHIPS HANDLING
    
    @ManyToOne
    private Manager manager;

    @ManyToMany
    @JoinTable(
        name = "event_volunteers",
        joinColumns = @JoinColumn(name = "event_id"),
        inverseJoinColumns = @JoinColumn(name = "volunteer_id")
    )
    private List<Volunteer> volunteers;

    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL)
    private List<ChatMessage> chatMessages;
    
//    EMPTY CONSTRUCTOR
    public Event() {}

    
//    GETTERS AND SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getZipCode() {
		return zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}

	

	public LocalTime getTime() {
		return time;
	}

	public void setTime(LocalTime time) {
		this.time = time;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
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

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public List<Volunteer> getVolunteers() {
		return volunteers;
	}

	public void setVolunteers(List<Volunteer> volunteers) {
		this.volunteers = volunteers;
	}

	public List<ChatMessage> getChatMessages() {
		return chatMessages;
	}

	public void setChatMessages(List<ChatMessage> chatMessages) {
		this.chatMessages = chatMessages;
		updateHasNewMessages();
	}
	
	private void updateHasNewMessages() {
	    boolean hasNewMessages = chatMessages.stream()
	            .anyMatch(message -> message.getCreatedAt().after(this.updatedAt));
	    this.hasNewMessages = hasNewMessages;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}
	
	@Transient
	public boolean isHasNewMessages() {
		return hasNewMessages;
	}

	public void setHasNewMessages(boolean hasNewMessages) {
		this.hasNewMessages = hasNewMessages;
	}

	
    
    
    
    
    
	

}
