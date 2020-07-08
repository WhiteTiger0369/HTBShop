package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.OderDAO;
import com.htbshop.entity.Order;

@Transactional
public class OrderDAOImpl implements OderDAO {
	@Autowired
	SessionFactory fatory;

	@Override
	public Order findById(Integer id) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		Order entity = session.find(Order.class, id);
		return entity;
	}

	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Catygory";
		Session session = fatory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		List<Order> list = query.getResultList();
		return list;
	}

	@Override
	public Order create(Order entity) {
		
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Order entity) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Order delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		Order entity = session.find(Order.class, id);
		session.delete(entity);
		return entity;
	}

}
