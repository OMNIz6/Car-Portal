package com.rst.carportal.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="appointment")
public class Appointment {
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", date=" + date + ", status=" + status + ", user=" + user + ", bid=" + bid
				+ ", car=" + car + ", buyername=" + buyername + ", ownername=" + ownername + ", amount=" + amount + "]";
	}

	@Id
	@Column(name="appointment_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="appointment_date")
	private LocalDateTime date;
	
	@Column(name="status")
	private String status;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="bidding_id")
	private Bids bid;
	
	@ManyToOne
	@JoinColumn(name="car_id")
	private Car car;

	private String buyername;
	private String ownername;
	private int amount;
	
	public String getBuyername() {
		return this.bid.getUser().getFname();
	}

	public void setUsername(String buyername) {
		this.bid.getUser().setFname(buyername);
	}

	public int getAmount() {
		return this.bid.getAmount();
	}

	public void setAmount(int amount) {
		this.bid.setAmount(amount);
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Bids getBid() {
		return bid;
	}

	public void setBid(Bids bid) {
		this.bid = bid;
	}

	public String getOwnername() {
		return this.car.getUser().getFname();
	}

	public void setOwnername(String ownername) {
		this.car.getUser().setFname(ownername);
	}
	
	
}
