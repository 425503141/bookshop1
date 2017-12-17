package com.tian.bookshop.page.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tian.bookshop.entity.Book;

@Repository

public class PageDaoImpl {
	@Resource
    private SessionFactory sessionFactory;
    /**
  * 分页查询
  * @param hql 查询的条件
  * @param offset 开始记录
  * @param length 一次查询几条记录
  * @return 返回查询记录集合
  */
@SuppressWarnings("unchecked")
     public List<Book> queryForPage(int offset, int length) {
       //查询所有的记录数
       Query query= (Query) sessionFactory.getCurrentSession().createQuery("from Book");    
        query.setFirstResult(offset);
        query.setMaxResults(length);            
        return query.list(); 
       }

     public void save(Book st){
     sessionFactory.getCurrentSession().save(st);
       }
     public void update(Book st) {   
            sessionFactory.getCurrentSession().update(st);
       }
     public void delete(Book st) {      
            sessionFactory.getCurrentSession().delete(st);
       }
     //查询记录总数
     public int getAllRowCount(){
         int count=((Long) sessionFactory.getCurrentSession()
                .createQuery( "select count(*) from Book").iterate().next()).intValue();
         return count;  
     }
     //查询据名称记录总数
     public int getFindRowCount(String m_name){
         int count=((Long) sessionFactory.getCurrentSession()
                .createQuery( "select count(*) from Book where name like '%" + m_name + "%'").iterate().next()).intValue();
         return count;  
     }
     //根据id查询记录
    public  Book QueryById(int id) {
    	Book st =(Book) sessionFactory.getCurrentSession().get(Book.class, id);
       return st;
     }
    @SuppressWarnings("unchecked")
	public List<Book> QueryByName(int offset, int length,String m_name){
    	Query query= (Query) sessionFactory.getCurrentSession().createQuery("from Book where name like '%" + m_name + "%'");
    	query.setFirstResult(offset);
        query.setMaxResults(length); 
    	return query.list();
    }
}
