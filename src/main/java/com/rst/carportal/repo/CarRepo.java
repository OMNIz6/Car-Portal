package com.rst.carportal.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.rst.carportal.entities.Car;

public interface CarRepo extends JpaRepository<Car, Long> {
	@Query(value ="SELECT c FROM Car c WHERE c.make LIKE '%' || :keyword || '%'"+" OR c.model LIKE '%' || :keyword || '%'"+" OR c.registeration LIKE '%' || :keyword || '%'"+" OR c.price LIKE '%' || :keyword || '%'")
	public List<Car> searchCars(@Param("keyword") String keyword);
	
	public List<Car> findAllByUser_id(int user_id);
	
	public List<Car> findAllByStatus(String status);
	
	public void deleteById(Long id);
	
}