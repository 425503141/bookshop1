package com.tian.bookshop.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tian.bookshop.entity.User;

@Repository
public class UserDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<User> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from User");
		return q.list();
	}
	public User findByUsername(String username) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from User where username = ?").setParameter(0, username);
		return (User)q.uniqueResult();
	}
	public void addUser(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

}
