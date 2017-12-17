package com.tian.bookshop.book.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tian.bookshop.book.service.BookServiceImpl;
import com.tian.bookshop.entity.Book;


@Controller
@RequestMapping("book")
public class BookController {
	
	@Resource
	private BookServiceImpl BookServiceImpl;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Book> list=this.BookServiceImpl.listAll();
		model.addAttribute("list", list);
		return "list";
	}
}
