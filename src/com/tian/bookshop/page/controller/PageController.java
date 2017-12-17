package com.tian.bookshop.page.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tian.bookshop.entity.Book;
import com.tian.bookshop.page.Page;
import com.tian.bookshop.page.service.PageServiceImpl;



@Controller
public class PageController {
	@Resource
	public PageServiceImpl pageservice;
	public PageController(){}
	protected final transient Log log = LogFactory.getLog(PageController.class);

	@RequestMapping("/message.action")
	public String findAll(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {   
	        String pageNo = request.getParameter("pageNo");
	        System.out.println("1111");
	        if (pageNo == null) {
	            pageNo = "1";
	        }
	        Page page = pageservice.queryForPage(Integer.valueOf(pageNo), 2);
	        request.setAttribute("page", page);
	        List<Book> list = page.getList();
	        modelMap.put("list", list);
	    return "list";
	}
	@RequestMapping("/find.action")
	public String find(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) {
		String m_name = request.getParameter("findname");
		String pageNo = request.getParameter("pageNo");
        System.out.println("1111");
        if (pageNo == null) {
            pageNo = "1";
        }
        Page page = pageservice.queryForPageByName(Integer.valueOf(pageNo), 2 , m_name);
        request.setAttribute("page", page);
        List<Book> list = page.getList();
        modelMap.put("list", list);
    return "list";
	}

}
