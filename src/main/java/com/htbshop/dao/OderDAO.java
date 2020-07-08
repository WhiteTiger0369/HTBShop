package com.htbshop.dao;

import java.util.List;

import com.htbshop.entity.Order;

public interface OderDAO {
	Order findById(Integer id);
	List<Order> findAll();
	Order create(Order entity);
	void update(Order entity);
	Order delete(Integer id);

}
