package com.tian.bookshop.admin.dao;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tian.bookshop.entity.Admin;

@Repository
public class AdminDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Admin> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Admin");
		return q.list();
	}
	public Admin findByAdminname(String name) {
		Query q=this.sessionFactory.getCurrentSession().createQuery("from Admin where name = ?").setParameter(0, name);
		return (Admin)q.uniqueResult();
	}
	public void addAdmin(Admin admin) {
		sessionFactory.getCurrentSession().save(admin);
	}
}
