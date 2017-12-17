package com.tian.bookshop.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tian.bookshop.admin.dao.AdminDaoImpl;
import com.tian.bookshop.entity.Admin;

@Service
@Transactional(readOnly=true)
public class AdminServiceImpl {
	@Resource
	private AdminDaoImpl AdminDaoImpl;
	
	public List<Admin> listAll(){
		return this.AdminDaoImpl.findAll();
	}
	public void add(Admin admin) {
		AdminDaoImpl.addAdmin(admin);
	}
	public Admin findUsername(String name) {
		return AdminDaoImpl.findByAdminname(name);
	}
}
