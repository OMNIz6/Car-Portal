package com.rst.carportal.auth;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.rst.carportal.entities.User;
import com.rst.carportal.repo.UserRepo;


// this class is to locate the user data from the database and make a UserDetail for the authentication

@Transactional
public class AccountSecurity implements UserDetailsService {
	@Autowired
	UserRepo urepo;
	
	public AccountSecurity() {
		// TODO Auto-generated constructor stub
	}
	
	@Transactional
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("a\na\na\na\na\na\na\na\na\na\na\na\na\n"+ email);
		User user = urepo.findByEmail(email);
		// if user doesn't exist throw exception
		if(user==null) {
			throw new UsernameNotFoundException("user " + email + " is not valid. Please re-enter.");
		}
		
		System.out.println(user.toString());
		// if user exist pass the information to the count class and make a new UserDetail for the authentication
		Account acc = new Account(user);
		System.out.println(acc.toString());
		return acc;
	}
	
}
