package com.rst.carportal.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rst.carportal.entities.Car;
import com.rst.carportal.entities.User;
import com.rst.carportal.repo.CarRepo;
import com.rst.carportal.repo.UserRepo;

@Service
@Transactional
public class AdminService {
	@Autowired
	CarRepo crepo;
	@Autowired
	UserRepo urepo;
	
	public void deleteUser(int id) {
		urepo.delete(urepo.findById(id).get());
	}
	
	public void banUser(int id) {
		User user = urepo.findById(id).get();
		if(user.getStatus().equals("active")) {
		user.setStatus("banned");
			for(Car car : user.getCars()) {
				if(car.getStatus().equals("Active")) {
					car.setStatus("Unpublished");
				}
			}
		}else {
			user.setStatus("active");
		}
		urepo.save(user);
	}
	
	public List <User> getAllUsers(){
		
		for(User user: urepo.findAll()) {
			System.out.println(user.toString());
		}
		
		return (List<User>) urepo.findAll();
	}
}
