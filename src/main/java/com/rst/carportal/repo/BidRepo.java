package com.rst.carportal.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.rst.carportal.entities.Bids;

public interface BidRepo extends CrudRepository<Bids, Long> {
	public List<Bids> findAllByCar_id(Long car_id);
	
	public List<Bids> findAllByUser_id(int user_id);
	
	public void deleteAllByCar_id(Long car_id);
	
}
