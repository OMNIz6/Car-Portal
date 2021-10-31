package com.rst.carportal.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="cars")
public class Car {
	
	@Id
	@Column(name="car_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name="car_make")
	private String make;
	
	@Column(name="car_model")
	private String model;
	
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Car(String make, String model, String registeration, String kilo, String fueltype, String color,
			String price, String engine, String power, User user) {
		super();
		this.make = make;
		this.model = model;
		this.registeration = registeration;
		this.kilo = kilo;
		this.fueltype = fueltype;
		this.color = color;
		this.price = price;
		this.engine = engine;
		this.power = power;
		this.user = user;
	}
	
	public void editCar(String make, String model, String registeration, String kilo, String fueltype, String color,
			String price, String engine, String power) {
		this.make = make;
		this.model = model;
		this.registeration = registeration;
		this.kilo = kilo;
		this.fueltype = fueltype;
		this.color = color;
		this.price = price;
		this.engine = engine;
		this.power = power;
	}

	@Column(name="register_date")
	private String registeration;
	
	@Column(name="mileage")
	private String kilo;

	@Column(name="fuel_type")
	private String fueltype;

	@Column(name="color")
	private String color;
	
	@Column(name="minimum_price")
	private String price;
	
	@Column(name="engine")
	private String engine;
	
	@Column(name="power")
	private String power;
	
	@Column(name="img_url", insertable = false)
	private String img;
	
	@Column(name="status")
	private String status;
	
	@Column(name="start_date", insertable = false)
	private Date Start_date;
	
	@Column(name="end_date")
	private Date end_date;

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy = "car",fetch = FetchType.EAGER, orphanRemoval = true)
	private List<Bids> bid;
	
	@OneToMany(mappedBy = "car", orphanRemoval = true)
	private List<Appointment> app;
	
	public List<Appointment> getApp() {
		return app;
	}

	public void setApp(List<Appointment> app) {
		this.app = app;
	}

	public List<Bids> getBid() {
		return bid;
	}

	public void setBid(List<Bids> bid) {
		this.bid = bid;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRegisteration() {
		return registeration;
	}

	public void setRegisteration(String registeration) {
		this.registeration = registeration;
	}

	public String getFueltype() {
		return fueltype;
	}

	public void setFueltype(String fueltype) {
		this.fueltype = fueltype;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getEngine() {
		return engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStart_date() {
		return Start_date;
	}

	public void setStart_date(Date start_date) {
		Start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public String getKilo() {
		return kilo;
	}

	public void setKilo(String kilo) {
		this.kilo = kilo;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		String s = "";
		if(bid!= null) {
			s = bid.toString();
		}
		return "Car [id=" + id + ", make=" + make + ", model=" + model + ", registeration=" + registeration
				+ ", fueltype=" + fueltype + ", color=" + color + ", price=" + price + ", engine=" + engine
				+ ", Status=" + status + ", Start_date=" + Start_date + ", end_date=" + end_date + ", user=" + user
				+ ", bid=" + s + "]";
	}
}
