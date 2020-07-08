package com.htbshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Product;

@Transactional
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SessionFactory fatory;

	@Override
	public Product findById(Integer id) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		Product entity = session.find(Product.class, id);
		return entity;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Catygory";
		Session session = fatory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public Product create(Product entity) {
		
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Product entity) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Product delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = fatory.getCurrentSession();
		Product entity = session.find(Product.class, id);
		session.delete(entity);
		return entity;
	}

}
