package com.tian.bookshop.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tian.bookshop.admin.service.AdminServiceImpl;
import com.tian.bookshop.entity.Admin;
import com.tian.bookshop.entity.Shoppingcart;
import com.tian.bookshop.cart.service.CartServiceImpl;
import com.tian.bookshop.book.service.BookServiceImpl;
import com.tian.bookshop.user.service.UserServiceImpl;
import com.tian.bookshop.entity.Book;
import com.tian.bookshop.entity.Shoppingcart;
import com.tian.bookshop.entity.User;



@Controller
@RequestMapping("back")
public class AdminController {
	@Resource
	private AdminServiceImpl AdminServiceImpl;
	@Autowired
	private CartServiceImpl CartServiceImpl;
	private UserServiceImpl UserServiceImpl;
	@Autowired
	private BookServiceImpl BookServiceImpl;
	@RequestMapping("/adminlogin")
	public String login(HttpServletRequest request,@RequestParam("user") String username, @RequestParam("password") String password,
	            Model model) {
		List<Admin> list=this.AdminServiceImpl.listAll();
		for(Admin admin:list) {
			if (username.equals(admin.getName()) && password.equals(admin.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);
	            return "backstage"; 
	        }
		}
		return "error1";
	    }
	@RequestMapping("/bookmessage.action")
	public String backstage(Model model){
		List<Book> booklist=this.BookServiceImpl.listAll();
		model.addAttribute("booklist", booklist);
		return "backstage";
	}
	
	@RequestMapping("/deletecart")
	public String delete(Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		String cartid = request.getParameter("bookid");
		int Id = Integer.parseInt(cartid);
		this.CartServiceImpl.deleteByid(Id);
		List<Book> booklist=this.BookServiceImpl.listAll();
		model.addAttribute("booklist", booklist);
		return "backstage";
	}
}
