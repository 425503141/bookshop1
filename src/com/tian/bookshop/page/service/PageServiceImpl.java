package com.tian.bookshop.page.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tian.bookshop.entity.Book;
import com.tian.bookshop.page.Page;
import com.tian.bookshop.page.dao.PageDaoImpl;

@Service
@Transactional

public class PageServiceImpl {
	@Resource
    public PageDaoImpl pagedao;
    /**
     * 分页查询 
     * @param currentPage 当前页号：现在显示的页数
     * @param pageSize 每页显示的记录条数
     * @return 封闭了分页信息(包括记录集list)的Bean
     * */
    public Page queryForPage(int currentPage,int pageSize) {
        Page page = new Page();       
        //总记录数
        int allRow = pagedao.getAllRowCount();
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);  
        //分页查询结果集
        List<Book> list = pagedao.queryForPage(offset, pageSize); 
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);    
        return page;
    }
     public void Servicesave(Book st){
    	 pagedao.save(st);
     }
    public void Serviceupdate(Book st){
    	pagedao.update(st);
    }
    public void Servicedelete(Book st){
    	pagedao.delete(st);
    }
    public int ServicegetCount(){
        return pagedao.getAllRowCount();
    }
    public  Book QueryById(int id){
        return pagedao.QueryById(id);
    }
    public Page queryForPageByName(int currentPage,int pageSize,String m_name) {
        Page page = new Page();       
        //总记录数
        int allRow = pagedao.getFindRowCount(m_name);
        //当前页开始记录
        int offset = page.countOffset(currentPage,pageSize);  
        //分页查询结果集
        List<Book> list = pagedao.QueryByName(offset, pageSize,m_name); 
        page.setPageNo(currentPage);
        page.setPageSize(pageSize);
        page.setTotalRecords(allRow);
        page.setList(list);    
        return page;
    }
}
