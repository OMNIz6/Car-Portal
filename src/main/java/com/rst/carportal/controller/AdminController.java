package com.rst.carportal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rst.carportal.service.AdminService;

//For all the admin functionalities in the portal
@Controller
public class AdminController {
	
//	Calling the Admin Service Bean for the services
	@Autowired
	AdminService aservice;
	
//	For displaying the User management page
	@GetMapping("/users")
	public String getUsers(Model model) {
		model.addAttribute("Users", aservice.getAllUsers());
		return "userdisplay";
	}
	
//	For deleting the users from the management page
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam int id) {
		aservice.deleteUser(id);
		return "redirect:users";
	}
	
//	Fo ban user from the portal
	@GetMapping("/banUser")
	public String banUser(@RequestParam int id) {
		aservice.banUser(id);
		return "redirect:users";
	}
}
