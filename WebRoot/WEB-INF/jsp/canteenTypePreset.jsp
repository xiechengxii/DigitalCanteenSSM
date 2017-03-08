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
	    
	    <title>预置食堂类型信息</title>
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
						<h3 class="panel-title">预置食堂类型</h3>
					</div>

					<div class="panel-body">
						<form class="form-horizontal" role="form" action="insertCanteenType.action" method="post">
							<div class="form-group">																	
								<label class="col-sm-2 control-label">食堂类型：</label>	
								<div class="col-sm-9">									
									<!-- 添加食堂类型 -->
									<input type="text" class="form-control" placeholder="请在此处输入预置食堂类型" name="cantTypeName">	
								</div>									
							</div>
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">								
									<input type="submit" class="btn btn-primary" value="添加食堂类型">	
								</div>							
							</div>
						</form>	
					</div>
				</div>
				
				<div class="panel panel-default">	

					<div class="panel-heading">
						<h3 class="panel-title">已录入食堂类型</h3>
					</div>	

					<div class="panel-body">
						<!-- 列举所有已录入食堂类型 -->
						<table class="table table-striped table-bordered table-hover table-responsive text-center">
							<thead>
						    	<tr>
						   		 	<th style='text-align: center;'><b>食堂类型名称</b></th>
						    	    <th style='text-align: center;'><b>编辑</b></th>
						    	</tr>
							</thead>
							<tbody>
								<c:forEach items="${canteenTypeList }" var="item" >
						    		<tr>
						    		    <td style='vertical-align: middle;text-align: center;'>${item.cantTypeName }</td>
						    		    <td style='vertical-align: middle;text-align: center;'>
						    		    	<div class="form-group btn-group btn-group-sm">
						    		    		<a href="modifyCanteenType.action?cantTypeID=${item.cantTypeID}" class="btn btn-default">修改</a>
						    		    		<a href="deleteCanteenTypeById.action?cantTypeID=${item.cantTypeID}" class="btn btn-default">删除</a>
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
