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
		  <meta http-equiv="pragma" content="no-cache" />
      <meta http-equiv="cache-control" content="no-cache" />
      <meta http-equiv="expires" content="0">   
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
      <meta name="apple-mobile-web-app-capable" content="yes">
      <meta name="apple-mobile-web-app-status-bar-style" content="black">
      <meta name="format-detection" content="telephone=no">
    
      <link rel="stylesheet" type="text/css" href="css/dtfknormalize.css"/>
      <link rel="stylesheet" type="text/css" href="css/dtfkdefault.css">
      <link rel="stylesheet" type="text/css" href="css/dtfkstyles.css">   
  	</head>
  
  	<body>
  		<div>${message_login}</div>
          <div class="htmleaf-container">
            <div class="wrapper">
              <div class="container">
                <h1>Welcome</h1>        
    	          <form action="${pageContext.request.contextPath}/login.action" method="post">
                  <input type="text" placeholder="Username" name="userName">
                  <input type="password" placeholder="Password" name="password">
                  <button type="submit" id="login-button">Login</button>
    	          </form>
              </div>
              <ul class="bg-bubbles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
              </ul>
            </div>
          </div>
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
</body>
</html>
