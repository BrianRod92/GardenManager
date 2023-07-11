package com.brianr.gardenmanager.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.brianr.gardenmanager.models.LoginManager;
import com.brianr.gardenmanager.models.Manager;
import com.brianr.gardenmanager.repositories.ManagerRepository;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerRepository managerRepo;
	
	
//	EMAIL VALIDATIONS FOR REGISTER & LOGIN
	public Manager register(Manager newManager, BindingResult result) {
		Optional<Manager> optionalManager = managerRepo.findByEmail(newManager.getEmail());
		if(optionalManager.isPresent()) {
			result.rejectValue("email", "registered", "Email is already registered.");	
		}
		if(!newManager.getPassword().equals(newManager.getConfirm())) {
			result.rejectValue("confirm", "matches", "Passwords do not match! Try again.");	
		}
		if(result.hasErrors()) {
			return null;
			
		}
		
		String hashedPW = BCrypt.hashpw(newManager.getPassword(), BCrypt.gensalt());
		newManager.setPassword(hashedPW);
		return managerRepo.save(newManager);
	}
	
	public Manager login(LoginManager newLogin, BindingResult result) {
		Optional<Manager> optionalManager = managerRepo.findByEmail(newLogin.getEmail());
		if(!optionalManager.isPresent()) {
			result.rejectValue("email", "notRegistered", "Email is not registered.");
			return null;
		} 
		Manager manager = optionalManager.get();
			if(!BCrypt.checkpw(newLogin.getPassword(), manager.getPassword())) {
				result.rejectValue("password", "matches", "Invalid password. Try again.");
			}
		
		
		return manager;
	}

	
//	FIND ALL MANAGERS
	public List<Manager> allManagers(){
		return managerRepo.findAll();
	}
	
//	ADD/CREATE MANAGERS
	public Manager createManager(Manager newManager) {
		return managerRepo.save(newManager);	
	}
	
//	FIND MANAGER BY ID
	public Manager findManager(Long id) {
		Optional<Manager> optionalManager = managerRepo.findById(id);
		if(optionalManager.isPresent()) {
			return optionalManager.get();
		} else {
		return null;
		}
	}
	
//	UPDATE MANAGER
	public Manager updateManager(Manager oneManager) {
		return managerRepo.save(oneManager);
	}
	
//	DELETE MANAGER
	public void deleteManager(Long id) {
		managerRepo.deleteById(id);
		
	}

}
