<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
table{  border-collapse:collapse;  }   
td{  border:2px solid blue;  }   
</style>  
<script type="text/javascript">
function add(){   
     window.location.href="<%=request.getContextPath() %>/message.action?method=add";   
}   
function del(id){  
     window.location.href="<%=request.getContextPath()%>/message.action?method=del&id=" + id;  
}   
function edit(id){  
     url="<%=request.getContextPath()%>/message.action?method=edit&id=" + id;
     window.location.href=url;
} 
</script> 
</head>
<body>
<center>
<form name="form">
  <table > 
    <tr>  
        <td>Id</td>  
        <td>Name</td>  
        <td>Title</td>  
        <td>phone</td> 
        <td>content</td> 
        <td>do</td>
    </tr>  
    <c:forEach items="${list }" var="Book" varStatus="status">  
    <tr id="<c:out  value="${Book.id}"/>"> 
        <td><input  value="${Book.id}" readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].name"      value="${Book.name}"    readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].price"     value="${Book.price}"   readonly="readonly"/></td>  
        <td> 
            <input type="button" onclick="edit('<c:out value="${Book.id}"/>')" value="修改"/>        
            <input type="button" onclick="del('<c:out value="${Book.id}"/>')" value="删除"/>  
        </td>        
    </tr> 
    </c:forEach>  
 </table>
</form>
   <br>
   <table>
       <tr>
            <td colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页<br>            
                <a href="message.action?pageNo=${page.topPageNo}"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${page.pageNo!=1}">             
                      <a href="message.action?pageNo=${page.previousPageNo }"><input type="button" name="previousPage" value="上一页" /></a>                
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
</center>
</body>
</html>