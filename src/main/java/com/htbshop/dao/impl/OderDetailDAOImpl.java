package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.OrderDetailDAO;
import com.htbshop.entity.OrderDetail;

@Transactional
public class OderDetailDAOImpl implements OrderDetailDAO {
	@Autowired
	SessionFactory fatory;

	@Override
	public OrderDetail findById(Integer id) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		OrderDetail entity = session.find(OrderDetail.class, id);
		return entity;
	}

	@Override
	public List<OrderDetail> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Catygory";
		Session session = fatory.getCurrentSession();
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		List<OrderDetail> list = query.getResultList();
		return list;
	}

	@Override
	public OrderDetail create(OrderDetail entity) {
		
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(OrderDetail entity) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public OrderDetail delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		OrderDetail entity = session.find(OrderDetail.class, id);
		session.delete(entity);
		return entity;
	}

}