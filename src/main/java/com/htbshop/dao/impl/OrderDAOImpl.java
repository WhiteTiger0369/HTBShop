package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.OrderDAO;
import com.htbshop.entity.Customer;
import com.htbshop.entity.Order;
import com.htbshop.entity.OrderDetail;
import com.htbshop.entity.Product;

@Transactional
@Repository
public class OrderDAOImpl implements OrderDAO {
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
		String hql = "FROM Order";
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

	@Override
	public void create(Order order, List<OrderDetail> details) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.save(order);
		for(OrderDetail detail : details) {
			session.save(detail);
		}
	}

	@Override
	public List<Order> findByUser(Customer user) {
		// TODO Auto-generated method stub
		String hql = "FROM Order o WHERE o.customer.id=:uid ORDER BY o.orderDate DESC";
		Session session = fatory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		query.setParameter("uid", user.getId());
		List<Order> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findItemsByUser(Customer user) {
		// TODO Auto-generated method stub
		String hql = "SELECT DISTINCT d.product FROM OrderDetail d WHERE d.order.customer.id=:uid";
		Session session = fatory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("uid", user.getId());
		List<Product> list = query.getResultList();
		return list;
	}

}
