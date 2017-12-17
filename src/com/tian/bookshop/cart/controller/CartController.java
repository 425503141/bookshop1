package com.tian.bookshop.cart.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tian.bookshop.cart.service.CartServiceImpl;
import com.tian.bookshop.book.service.BookServiceImpl;
import com.tian.bookshop.user.service.UserServiceImpl;
import com.tian.bookshop.entity.Book;
import com.tian.bookshop.entity.Shoppingcart;
import com.tian.bookshop.entity.User;

@Controller
@RequestMapping("cart")
public class CartController {
	@Resource
	private CartServiceImpl CartServiceImpl;
	@Autowired
	private BookServiceImpl bookServiceImpl;
	private UserServiceImpl UserServiceImpl;
	
	@RequestMapping("/addincart")
	public String addincart(@RequestParam("name") String bookid,
			                HttpServletRequest request,
			                Model model) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int Id = Integer.parseInt(bookid);
		if(this.CartServiceImpl.findByRecord(user.getId(), Id) == null) {
			this.CartServiceImpl.insert(user.getId(),Id,bookServiceImpl.findId(Id).getName(),bookServiceImpl.findId(Id).getAuthor(),bookServiceImpl.findId(Id).getPrice(),bookServiceImpl.findId(Id).getimageFile());
		}else {
			this.CartServiceImpl.updateQuantity(user.getId(), Id);
		}
		List<Shoppingcart> list=this.CartServiceImpl.listAll();
		model.addAttribute("user", user);
		model.addAttribute("book", bookServiceImpl.findId(Id));
		model.addAttribute("list", list);
		return "cart";
	}
	
	@RequestMapping("/cartlist")
	public String listcart(Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Shoppingcart> list=this.CartServiceImpl.findByUser(user.getId());
		model.addAttribute("list", list);
		return "cart";
	}
	@RequestMapping("/delete")
	public String delete(Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String bookid = request.getParameter("bookid");
		int Id = Integer.parseInt(bookid);
		this.CartServiceImpl.delete(user.getId(), Id);
		List<Shoppingcart> list=this.CartServiceImpl.findByUser(user.getId());
		model.addAttribute("list", list);
		return "cart";
	}
	
	@RequestMapping("/addorincrese")
	public String addorincrese(Model model,
			HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String bookid = request.getParameter("bookid");
		int Id = Integer.parseInt(bookid);
		this.CartServiceImpl.freshQuantity(user.getId(),Id,num);
		List<Shoppingcart> list=this.CartServiceImpl.findByUser(user.getId());
		model.addAttribute("list", list);
		return "cart";
	}
	@RequestMapping("/jiezhang")
	public String jieZhang(Model model,
			HttpServletRequest request) {
		int count = 0;
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Shoppingcart> list=this.CartServiceImpl.findByUser(user.getId());
		for(Shoppingcart cart:list) {
			int temp = cart.getQuantity()*cart.getBookprice();
			count += temp;
		}
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return "order";
	}
}
