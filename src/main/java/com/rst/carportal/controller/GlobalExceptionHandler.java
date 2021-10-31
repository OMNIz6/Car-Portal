//package com.rst.carportal.controller;
//
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.LockedException;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//
//
//@ControllerAdvice
//public class GlobalExceptionHandler{
//
//	@ExceptionHandler(LockedException.class)
//	public String handleStoreExpection(Model model, Exception e) {
//		System.out.println("expection throw!!!");
//		String msg = "This account is banned";
//		model.addAttribute("msg",msg);
//		return"login";
//	}
//	
//	@ExceptionHandler({BadCredentialsException.class, UsernameNotFoundException.class})
//	public String handleBadCredentialsException(Model model, Exception e) {
//		System.out.println("expection throw!!!");
//		String msg = "Email or Password is inorrect";
//		model.addAttribute("msg",msg);
//		return"login";
//	}
//}
