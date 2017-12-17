package com.tian.bookshop.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tian.bookshop.entity.User;
import com.tian.bookshop.user.dao.UserDaoImpl;
@Service
@Transactional(readOnly=true)

public class UserServiceImpl {

	@Resource
	private UserDaoImpl UserDaoImpl;
	
	public List<User> listAll(){
		return this.UserDaoImpl.findAll();
	}
	public void add(User user) {
		UserDaoImpl.addUser(user);
	}
	public User findUsername(String username) {
		return UserDaoImpl.findByUsername(username);
	}
}
