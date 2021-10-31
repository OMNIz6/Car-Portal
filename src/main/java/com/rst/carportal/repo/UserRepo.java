package com.rst.carportal.repo;

import org.springframework.data.repository.CrudRepository;

import com.rst.carportal.entities.User;

public interface UserRepo extends CrudRepository<User, Integer> {
	
	public Boolean existsByEmail(String email);
	public User findByEmail(String email);
	public Boolean existsByPhno(String phno);
}