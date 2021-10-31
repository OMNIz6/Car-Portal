package com.rst.carportal.controller;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rst.carportal.auth.Account;
import com.rst.carportal.entities.Appointment;
import com.rst.carportal.entities.Bids;
import com.rst.carportal.entities.Car;
import com.rst.carportal.entities.Role;
import com.rst.carportal.entities.User;
import com.rst.carportal.service.UserService;

@Controller
public class MainController {
	
	User user = new User();//	To store the user id as soon as after the login session succeed
	
//	Calling the user service function from the services
	@Autowired
	UserService uservice;
	
	
	@GetMapping("/")
	public String start(@AuthenticationPrincipal Account auth) {
		user.setId(uservice.getUserId(auth.getUsername()));
		return "redirect:home";
	}
	
	@GetMapping("/home")
	public String home(Model model) {
		Car car = new Car();
		model.addAttribute("Car",car);
		model.addAttribute("Cars",uservice.getCars());
		return "carlist";
	}
	
	
	
	@GetMapping("/login")
	public String login(Model model) {
		if(user.getPassword()!=null) {
			PasswordEncoder en = new BCryptPasswordEncoder();
			user.setPassword(en.encode(user.getPassword()));
			model.addAttribute("User", user);
		}
		
		user = new User();
		return"login";
	}
	
	@GetMapping("/login_error1")
	public String loginError(Model model) {
		String msg = "Email or Password is inorrect";
		model.addAttribute("msg",msg);
		return"login";
	}
	@GetMapping("/login_error2")
	public String banHandler(Model model) {
		String msg = "This account is banned";
		model.addAttribute("msg",msg);
		return"login";
	}
	
	
	
	@GetMapping("/register")
	public String registerForm(Model model) {
		User user= new User();
		Role role= new Role();
		user.setRole(role);
		model.addAttribute("Reg", user);
		return"register";
	}
	
	@PostMapping("/register")
	public String registerProcess(Model model, User reg) {
		String msg;
		Boolean temp = uservice.registerUser(reg);
		user = reg;
		if(temp) {
			return "redirect:login";
		}else {
			msg = "Email already exist";
			model.addAttribute("msg",msg);
			return "register";
		}
	}
	
	@GetMapping("/about_us")
	public String about_us() {
		return"about_us";
	}
	@GetMapping("/contact_us")
	public String contact_us() {
		return"contact_us";
	}
	
	@GetMapping("/terms_and_condition")
	public String t_a_c() {
		return"t_a_c";
	}
	
	
	
	@PostMapping("/addcar")
	public String addCar(Car car) {
		car.setUser(user);
		car.setStatus("Unpublished");
		uservice.postCar(car);
		return "redirect:getDetail?id=" + car.getId();
	}
	
	@PostMapping("/editcar")
	public String editCar(Car tempcar) {
		Car car = uservice.getCarDetail(tempcar.getId());
		car.editCar(tempcar.getMake(), tempcar.getModel(), tempcar.getRegisteration(), tempcar.getKilo(), tempcar.getFueltype(), tempcar.getColor(), tempcar.getPrice(), tempcar.getEngine(), tempcar.getPower());
		uservice.postCar(car);
		return "redirect:getDetail?id=" + car.getId();
	}
	
	@PostMapping("/deletecar")
	public String deleteCar(@RequestParam long cid) {
		uservice.deleteCar(cid);
		return "redirect:myCars";
	}
	
	@GetMapping("/getDetail")
	public String getCarDetail(Model model, @RequestParam long id) {
		
		Bids bid  = new Bids();
		
		
		Car car = uservice.getCarDetail(id);
		Appointment app = uservice.findAppointment(car);
		int temp = 0;
		if (app != null) {
			temp = app.getBid().getUser().getId();
		}
		
		System.out.println(car.getBid().toString());
		System.out.println(car.toString());
		
		model.addAttribute("detail", car);
		model.addAttribute("Car", new Car());
		model.addAttribute("Uid", user.getId());
		
		
		if(car.getUser().getId() == user.getId() ||  temp == user.getId()) {
			
			if(car.getStatus().equals("Appointed")) {
				model.addAttribute("Appointment", app);
				
			}else{
				model.addAttribute("blist",uservice.getAllBidsByCar(car));
			}
			
			model.addAttribute("owner",true);
			
		}else{
			model.addAttribute("Bids",bid);
			model.addAttribute("owner",false);
		}
		
		return "cardetail";
	}
	
	@GetMapping("/myCars")
	public String getMyCar(Model model) {
		Car car = new Car();
		model.addAttribute("Car",car);
		model.addAttribute("Cars", uservice.getCarsByUserId(user.getId()));
		List<Car> appCars = new ArrayList<Car>();
		
		for(Appointment app : uservice.findAllAppointment(user)) {
			appCars.add(app.getCar());
			model.addAttribute("Apps", appCars);
		}
		
		return "carlist";
		
	}
	
	@PostMapping("/searchCars")
	public String searchCar(Model model, @RequestParam String keyword) {
		Car car = new Car();
		model.addAttribute("Car",car);
		model.addAttribute("Cars", uservice.searchCars(keyword));
		return "carlist";
		
	}
	
	
	
	@PostMapping("/makeBids")
	public String makeBids(@RequestParam String cid, @RequestParam String amount) {
		
		System.out.println("..............."+cid+amount);
		Car car = new Car();
		Bids bids = new Bids();
		
		car.setId(Long.parseLong(cid));
		bids.setAmount(Integer.parseInt(amount));
		bids.setCar(car);
		bids.setUser(user);
		
		System.out.println(bids.toString());
		uservice.makeBid(bids);
		return "redirect:home";
	}
	
	
	@PostMapping("/makeAppointment")
	public String makeApp(@RequestParam String bid,@RequestParam String cid, @RequestParam String date, @RequestParam String time) {
		
		LocalDateTime appdate = LocalDateTime.parse(date+"T"+time);
		System.out.println(appdate);
		
		Appointment app = new Appointment();
		Bids bids = new Bids();
		
		bids.setId(Long.parseLong(bid));
		
		Car car = uservice.getCarDetail(Long.parseLong(cid));
		car.setStatus("Appointed");
		
		app.setBid(bids);
		app.setUser(user);
		app.setDate(appdate);
		app.setStatus("active");
		app.setCar(car);
		
		uservice.makeAppointment(app);
		uservice.postCar(car);
		
		return "redirect:getDetail?id="+cid;
	}
	
	@PostMapping("/changeStatus")
	public String chgStatus(@RequestParam String cid) {
		Car car = uservice.getCarDetail(Long.parseLong(cid));
		if (car.getStatus().equals("Active")) {
			car.setStatus("Unpublished");
			uservice.deletBidByCar(Long.parseLong(cid));
			car.setBid(null);
		}else {
			car.setStatus("Active");
		}
		uservice.postCar(car);
		return "redirect:getDetail?id="+cid;
	}
	
}
