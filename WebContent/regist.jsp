<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>注册页面</title>  
</head>  
<body>  
    <h3>注册页面</h3>  
    <br>  
    <form action="register" method="post">  
        <table>  
        <tr>  
                <td><label>ID：</label></td>  
                <td><input type="text" id="id" name="id"></td>  
            </tr>  
            <tr>  
                <td><label>登录名：</label></td>  
                <td><input type="text" id="username" name="username"></td>  
            </tr>  
            <tr>  
                <td><label>密码：</label></td>  
                <td><input type="password" id="password" name="password"></td>  
            </tr>  
            <tr>  
                <td><label>性别：</label></td>  
                <td><input type="text" id="sex" name="sex"></td>  
            </tr>  
            <tr>  
                <td><label>地址：</label></td>  
                <td><input type="text" id="address" name="address"></td>  
            </tr> 
            <tr>  
                <td><input id="submit" type="submit" value="注册"></td>  
            </tr>  
        </table>  
    </form>  
</body>  
</html>  