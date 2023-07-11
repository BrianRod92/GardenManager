package com.brianr.gardenmanager.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.brianr.gardenmanager.models.Manager;

@Repository
public interface ManagerRepository extends CrudRepository<Manager, Long> {
	
	List<Manager> findAll();
	
	Optional<Manager> findByEmail(String email);
	

}
