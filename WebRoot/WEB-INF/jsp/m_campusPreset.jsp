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
    <title>预置校区信息</title>
    <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0">   
 	<meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
 
	<script src="js/modernizr.custom.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />    
</head>  
<body>

<div class="container">
    <div class="mp-pusher" id="mp-pusher">
    <%@ include file="publicjsp/index.jsp" %>               
        <div class="scroller" style="background:#f3efe0">
        	<div class="scroller-inner">
        	    <header class="codrops-header" style="width:100%">
        	    	<div class="row">
        	         <div id="trigger" class="burger-container">
						<span class="burger-bun-top"></span>
						<span class="burger-filling"></span>
						<span class="burger-bun-bot"></span>
					 </div>					
					<h1>预置校区</h1>
					</div>
				</header>
				
                <div class="content clearfix">                                       							
					<form action="insertCampus.action" method="post">
					<!-- 添加校区 -->							
						<div class="form-group" >
						    <div> <input name="campusName" class="form-control " type="text" placeholder="请输入预置校区"  style="border:0;border-bottom:1px solid #a0dbbe;"> </div>
							<br>
						    <div align="center"><input  type="submit" value="添加校区"  class="btn btn-primary btn-wide" data-role="none"></div>
						</div>
																
					<!-- 列举所有已录入校区 -->
						<table   class="table table-striped table-bordered table-condensed">
							<thead>
						    <tr style="background:#7acfa6;text-align:center;color:white;font-size:15px">
						   	 	<td >校区名称</td>
						        <td colspan="2">编辑</td>
						    </tr>
							</thead>
							<c:forEach items="${campusList }" var="item" >
						    <tr align="center" style="color:black;font-size:15px">
						        <td>${item.campusName }</td>
						        <td><a href="modifyCampus.action?campusID=${item.campusID}">修改</a></td>
						        <td><a href="deleteCampusById.action?campusID=${item.campusID}">删除</a></td>
						    </tr>
							</c:forEach>
						</table>								
					</form>
			    </div>
			</div>
        </div>
    </div>
</div>
<script src="js/classie.js"></script>
<script src="js/mlpushmenu.js"></script>
<script>
   new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
</script>
<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
</body>
</html>
