<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>list</title>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/reset.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/1024_768.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="${ctx}/static/css/pad_heng.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:601px) and (max-width:860px)" href="${ctx}/static/css/pad.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:481px) and (max-width:600px)" href="${ctx}/static/css/tel_heng.css" />
<link type="text/css" rel="stylesheet" media="screen and (max-width:480px)" href="${ctx}/static/css/tel.css" />
</head>
<body>
<a href="${ctx}/message.action">跳转</a>

<c:choose>
   <c:when test="${user.username== null}">  
       <p><a href="login.jsp">欢迎您，请登陆</a></p>      
   </c:when>
   <c:otherwise> 
     <p>欢迎您，${user.username }</p>
   </c:otherwise>
</c:choose>

<div class="w_100_l top_title">
	<div class="main">
    	<p><a href="#">Buy more than one book and save big! </a><a href="#">Read more</a></p>
    </div>
</div>

<div class="w_100_l">
	<div class="main">
      <div class="top_banner">
            <div class="top_logo"><img src="${ctx}/static/image/top_logo.jpg" alt="A BOOK APART LOGO" /></div>
            <div class="top_menu">
            	<ul>
                	<li class="sel"><a href="#">HOME</a></li>
                	<li><a href="#">STORE</a></li>
                	<li><a href="#">PRESS</a></li>
                	<li><a href="#">ABOUT</a></li>
                	<li><a href="#">HELP</a></li>
                </ul>
            </div>
            <div class="top_shop_cur"><a href="${ctx}/cart/cartlist?username=${user.username }"><img src="${ctx}/static/image/top_shop_cur.jpg" alt="shopping car" /></a></div>
        </div>
 <form id="search_form" method="post" action="find"> 
<input type="text" name="findname" id="s" value="Search" class="swap_value" /> 
<input type="submit"  width="27" height="24" id="go" alt="Search" title="Search" /> 
</form> 
        <p class="index_hr"></p>
      <div class="content">
            <h1 class="h1_book_title">Also from A Book Apart</h1>
            <c:forEach items="${list }" var="Book" varStatus="status">
        	<ul id="<c:out  value="${Book.id}"/>">  
            	<li>
                	<dl>
                    	<dd><a href="#"><img src="${ctx}/static/image/${Book.imageFile}" alt="book" /></a></dd>
                        <dt>
                        	<p class="book_title"><a href="detiels.jsp?name=${Book.name}&price=${Book.price}&image=${Book.imageFile}&id=${Book.id}" target="_blank">${Book.name }</a></p>
                            <p class="book_inline">${Book.price }</p>
                            <a class="book_buy" href="detiels.jsp?name=${Book.name}&price=${Book.price}&image=${Book.imageFile}&id=${Book.id}" >BUY</a>
                        </dt>
                    </dl>
                </li>
                </ul>
             </c:forEach> 
        </div>           	
            
    <table>
       <tr>
            <td colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页<br>            
                <a href="message.action?pageNo=${page.topPageNo}"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${page.pageNo!=1}">             
                      <a href="message.action?pageNo=${page.previousPageNo}"><input type="button" name="previousPage" value="上一页" /></a>                
                  </c:when>
                  <c:otherwise>  
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />       
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${page.pageNo != page.totalPages}">
                    <a href="message.action?pageNo=${page.nextPageNo}"><input type="button" name="nextPage" value="下一页" /></a>
                  </c:when>
                  <c:otherwise>    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                  </c:otherwise>
                </c:choose>
                <a href="message.action?pageNo=${page.bottomPageNo}"><input type="button" name="lastPage" value="尾页" /></a>
            </td> 
         </tr>
     </table>
      </div>
    </div>
</body>
</html>