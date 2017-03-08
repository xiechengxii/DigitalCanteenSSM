<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function addMUser(){
			
			document.UserManagementForm.action="addMUser.action";
			document.UserManagementForm.submit();
		}
		function findAllMUser(){
			document.UserManagementForm.action="findAllMUser.action";
			document.UserManagementForm.submit();
		}
  	</script>
  </head>
  
  <body>  
  <!-- 后台管理用户用于用户管理的页面 -->
  	<form name="UserManagementForm" method="post">
		<input type="button" value="添加用户" onClick=addMUser()>
		<br><br>
		<input type="button" value="查看用户信息" onClick=findAllMUser()>
	</form>
  </body>
</html>
