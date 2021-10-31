package com.rst.carportal.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.rst.carportal.entities.User;



// this class is to make a security model from the user data of the database to use in authentication process
@Transactional
public class Account implements UserDetails {
	
	private static final long serialVersionUID = 5768423292182202562L;

	String prefix = "ROLE_";

	private User user;

	public Account(User user) {
		super();
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();


		list.add(new SimpleGrantedAuthority(user.getRole().getName()));
		
		return list;
	}
	
	public long getId() {
		// TODO Auto-generated method stub
		return this.user.getId();
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.user.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		boolean temp = true;
		if(user.getStatus().equals("banned")) {
			temp = false;
		}
		return temp;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
