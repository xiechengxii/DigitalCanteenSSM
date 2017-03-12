<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	    <base href="<%=basePath%>">
	    <title>预置校区信息</title>
	    <meta name="viewport" content="width=device-width, 
	                                     initial-scale=0.3, 
	                                     maximum-scale=1.0, 
	                                     user-scalable=true">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
        
        <!--bootstrap-->    
        <script src="js/jquery-1.10.1.min.js"></script>       
        
        <!--bootstrap-->    
        <script src="js/bootstrap.min.js"></script>	
	</head>
	  
	<body>
		<%@ include file="publicjsp/backgroundMenu.jsp" %>
		<div class="container-fluid">
			<div class="container col-sm-6 col-sm-offset-3">
				<div class="panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">预置校区</h3>
					</div>

					<div class="panel-body">						
						<form class="form-horizontal" role="form" action="insertCampus.action" method="post">	
							<div class="form-group">
								
									
									<label class="col-sm-2 control-label">校区名称：</label>
									<div class="col-sm-9">	
										<input type="text" class="form-control" placeholder="预置校区名称" name="campusName"> 
									</div>
								
							</div>
						
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<input type="submit" class="btn btn-primary" value="添加校区">
								</div>
							</div>
						</form>							
					</div>

				</div>

				<div class="panel panel-default">

					<div class="panel-heading">
						<h3 class="panel-title">已有校区</h3>
					</div>

					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover table-responsive text-center">
							<thead>
								<tr>
									<th style='text-align: center;'><b>校区名称</b></th>
									<th style='text-align: center;'><b>操作</b></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${campusList }" var="item" >
									<tr>
									    <td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
									    <td style='vertical-align: middle;text-align: center;'>
									    	<div class="form-group btn-group btn-group-sm">
									    		<a href="modifyCampus.action?campusID=${item.campusID}" class="btn btn-info" >修改</a>
									    		<a href="deleteCampusById.action?campusID=${item.campusID}" class="btn btn-danger">删除</a>
									    	</div>
									    </td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>				
			</div>
		</div>
	</body>
</html>
