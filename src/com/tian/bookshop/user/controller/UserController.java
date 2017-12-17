package com.tian.bookshop.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tian.bookshop.user.service.UserServiceImpl;
import com.tian.bookshop.entity.User;

@Controller
public class UserController {
	@Resource
	private UserServiceImpl UserServiceImpl;
	@RequestMapping("/login")
	public String login(HttpServletRequest request,@RequestParam("username") String username, @RequestParam("password") String password,
	            Model model) {
		List<User> list=this.UserServiceImpl.listAll();
		for(User user:list) {
			if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				model.addAttribute("user", user);
	            return "list"; 
	        }
		}
		return "error1";
	    }
	
	@RequestMapping("/register")
	public String regist(@RequestParam("id") int id,
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("sex") String sex,
			@RequestParam("address") String address,
            Model model) {
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setAddress(address);
		UserServiceImpl.add(user);
		return "login";
	}
	
}
