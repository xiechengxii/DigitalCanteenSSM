<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
        
        <title>管理员账户管理</title>
        
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
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h3 class="panel-title">管理员账户管理</h3>
                </div>

                <div class="panel-body">
                    <form role="form" name="muserForm" enctype="multipart/form-data">
                    	<table class="table table-striped table-bordered table-hover table-responsive text-center">
                    		<thead>
                    		    <tr>
                    		    	<th style='text-align: center;'>管理员类型</th>
                    		    	<th style='text-align: center;'>管理员用户名</th>
                    		    	<th style='text-align: center;'>电话</th>
                    		    	<th style='text-align: center;'>照片</th>
                    		    	<th style='text-align: center;'>Email</th>
                    		    	<!-- <th style='text-align: center;'>状态</th> -->
                    		    	<th style='text-align: center;'>注册时间</th>
                    		    	<!-- <th style='text-align: center;'>上次登录时间</th> -->		
                    		    	<th style='text-align: center;'>编辑</th>
                    		    </tr>
                    		</thead>
                    		<tbody>
                    		    <c:forEach items="${muserItemsList }" var="item" >
	                    	    	<tr>
	                    	    		<td style='vertical-align: middle;text-align: center;'>${item.roleName }</td>
	                    	    		<td style='vertical-align: middle;text-align: center;'>${item.muserName }</td>
	                	        		<td style='vertical-align: middle;text-align: center;'>${item.muserTel }</td>
	                	        		<td style='vertical-align: middle;text-align: center;'>
	                		    			<c:if test="${item.muserPhoto != null }">
	                		    				<img src="/upload/pic/${item.muserPhoto }" class="center-block" height="80" width="80"/>
	                		    			</c:if>
	                		    		</td>
	                	        		<td style='vertical-align: middle;text-align: center;'>${item.muserEmail }</td>
	                	        		<%-- <td style='vertical-align: middle;text-align: center;'>${item.muserState }</td> --%>
	                	        		<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.muserRegDate}" pattern="yyyy-MM-dd" /></td>
	                	        		<%-- <td style='vertical-align: middle;text-align: center;'>${item.muserLastDate }</td> --%>
	                	        		<td style='vertical-align: middle;text-align: center;'>
	                	        			<div class="form-group btn-group btn-group-sm">
	                		    		    	<a href="modifyMUser.action?muserID=${item.muserID}" class="btn btn-info">修改</a>
	                		    		    	<a href="deleteMUserById.action?muserID=${item.muserID}" class="btn btn-danger">删除</a>
	                		    			</div>
	                		    	    </td>
	                    	    	</tr>
	                		    </c:forEach>
	                		</tbody>
                    	</table>
                    </form>
                </div>
    		</div>
		</div>
    </body>
</html>
