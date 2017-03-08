<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="digitalCanteenSSM.po.Dish" %>
<%@ page import="java.util.*"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  	<head>
    	<base href="<%=basePath%>">
    	
    	<title>登录</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
		-->
  	</head>
  
  	<body>
  		<div>${message_login}</div>
    	<form action="${pageContext.request.contextPath}/login.action" method="post">
    		账号：
    		<input type="text" name="userName">
    		<br><br>
    		密码：
    		<input type="password" name="password">
    		<br><br>
    		<input type="submit" value="登录">
    	</form>
  	</body>
</html>
