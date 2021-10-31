package com.rst.carportal.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	
	@Id
	@Column(name="user_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="email" , unique = true)
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="status", insertable=false)
	private String status;

	@Column(name="first_name")
	private String fname;
	
	@Column(name="last_name")
	private String lname;
	
	@Column(name="phone_number")
	private String phno;
	
	@Column(name="location")
	private String location;
	
	@Column(name="job_position")
	private String position;
	
	
	@Column(name="date", insertable=false)
	private Date date;
	
	@ManyToOne
	@JoinColumn(name="role_id", insertable=false)
	private Role role;
	
	@OneToMany(mappedBy = "user",cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<Car> cars;
	
	public Set<Car> getCars() {
		return cars;
	}

	public void setCars(Set<Car> cars) {
		this.cars = cars;
	}
	@OneToMany(mappedBy = "user", orphanRemoval = true)
	private Set<Bids> bid;
	
	@OneToMany(mappedBy = "user", orphanRemoval = true)
	private Set<Appointment> appointments;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User(int id) {
		super();
		this.id = id;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	public String getRoleName() {
		return role.getName();
	}
	@Override
	public String toString() {
		String t = "";
		if(role != null) {
			t= role.getName();
		}
		return "User [id=" + id + ", email=" + email + ", password=" + password + ", status=" + status + ", fname="
				+ fname + ", lname=" + lname + ", phno=" + phno + ", location=" + location + ", position=" + position
				+ ", date=" + date + ", role=" + t  + "]";
	}
	
	
	
	
}
