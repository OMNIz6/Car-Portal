package com.rst.carportal.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;

import com.rst.carportal.entities.Appointment;
import com.rst.carportal.entities.Bids;
import com.rst.carportal.entities.Car;
import com.rst.carportal.entities.User;
import com.rst.carportal.repo.AppointmentRepo;
import com.rst.carportal.repo.BidRepo;
import com.rst.carportal.repo.CarRepo;
import com.rst.carportal.repo.UserRepo;

@Service
@Transactional
public class UserService {
	
	@Autowired
	CarRepo crepo;
	@Autowired
	UserRepo urepo;
	@Autowired
	BidRepo brepo;
	@Autowired
	AppointmentRepo apprepo;
	
	public int getUserId(String email) {
		return urepo.findByEmail(email).getId();
	}
	
//	for user registration to the portal
	public Boolean registerUser(User user) {
		Boolean condition; 
		
//		for checking the email is already registered or not
		if(urepo.existsByEmail(user.getEmail())) {
			
//			if existed the function will return false
			condition = false;
		}else {
			
//			if the email is valid the user will register with the encrypted password
			
			PasswordEncoder en = new BCryptPasswordEncoder();//this is the password encoder for encryption
			
			user.setPassword(en.encode(user.getPassword()));//password is encrypted and saved in the object
			
			System.out.println(user.toString());//to check the user object
			
			urepo.save(user);//save the user in the database
			
			condition = true;//return true
		}
		return condition;
	}
	
//	for viewing user profile (not yet implemented)
	public User getProfile(int id) {
		return urepo.findById(
				id
				).get();
	}
	
//	for updating user profile (not yet implemented)
	public Boolean updateProfile(User user) {
		Boolean condition;

		if(urepo.existsByPhno(user.getPhno())) {
			condition = false;
		}else{
			urepo.save(user);
			condition = true;
		}

		return condition;
	}
	
//	for the user to post car for sell to the portal
	public Car postCar(Car car) {
		return crepo.save(car);
	}
	
//	for displaying selling cars on the home page 
	public List<Car> getCars(){
		List<Car> Cars = (List<Car>) crepo.findAllByStatus("Active");
		return Cars;
	}
	
//	for displaying the car that is own by the current user
	public List<Car> getCarsByUserId(int id){
		List<Car> Cars = (List<Car>) crepo.findAllByUser_id(id);
		return Cars;
	}
	
//	for showing the car detail page 
	public Car getCarDetail(long id) {
		return crepo.findById(id).get();
	}
	
//	for displaying bidding list to the car owner
	public List<Bids> getAllBidsByCar(Car car){
		List<Bids> list = brepo.findAllByCar_id(car.getId());
		Collections.sort(list, new Comparator<Bids>() {
		    @Override
		    public int compare(Bids a1, Bids a2) {
		        return a2.getAmount() - a1.getAmount();
		    }
		});
		return list;
	}
	
//	for making bids in the portal
	public Bids makeBid(Bids bid) {
		return brepo.save(bid);
	}
	
//	for searching car in the portal
	public List <Car> searchCars(String keyword){
		return crepo.searchCars(keyword);
	}
	
//	for making appointment
	public Appointment makeAppointment(Appointment app) {
		return apprepo.save(app);
	}
	
//	for displaying appoint to the owner
	public Appointment findAppointment(Car car) {
		return apprepo.findByCar_idAndStatus(car.getId(),"active");
	}
//	for displaying appointed car to the buyer
	public List<Appointment> findAllAppointment(User user) {
		return apprepo.findAllByBid_user_idAndStatus(user.getId(),"active");
	}
	
//	For deleting the bids from a car
	public void deletBidByCar(Long id) {
		brepo.deleteAllByCar_id(id);
	}
	
	public void deleteCar(Long id) {
		crepo.deleteById(id);
	}
	
}
