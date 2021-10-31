package com.rst.carportal.repo;


import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.rst.carportal.entities.Appointment;

public interface AppointmentRepo extends CrudRepository <Appointment, Integer> {
	public Appointment findByCar_idAndStatus(Long car_id, String status);
	public List<Appointment> findAllByBid_user_idAndStatus(int User_id, String status);
}
