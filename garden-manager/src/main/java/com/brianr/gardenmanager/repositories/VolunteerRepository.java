package com.brianr.gardenmanager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.brianr.gardenmanager.models.Volunteer;

@Repository
public interface VolunteerRepository extends CrudRepository<Volunteer, Long> {
	
	Optional<Volunteer> findByEmail(String email);
	
	List<Volunteer> findAll();
	

}
