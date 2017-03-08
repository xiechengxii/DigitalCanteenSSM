<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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

  </head>
  
  <body>  
    <!-- 显示在同一个校区中的所有菜品 -->
    <form enctype="multipart/form-data">
    	<!-- 食堂管理员 -->
	   	所属校区：<input type="text" name = "campusName" value="${muserItems.campusName }" readonly="readonly">
	   	所属食堂：<input type="text" name = "cantName" value="${muserItems.cantName }" readonly="readonly">
	   	管理员：<input type="text" name = "muserName" value="${muserItems.muserName }" readonly="readonly">
	    <br/><br/>
    	<table  border="1">
    		<tr>
    			<td>校区名称</td>
    			<td>食堂名称</td>
    			<td>档口名称</td>
    			<td>菜品类型</td>
    			<td>菜品名称</td>
    			<td>菜品图片</td>
    			<td>菜品价格</td>
    			<td>菜品销售时间</td>
    			<td>菜品销售状态</td>			
    			<td>菜品录入日期</td>
    			<td>菜品录入状态</td>
    			<td>菜品推荐</td>
    			<td>菜品留样</td>
    			<td>菜品合格</td> 			
    			<td>编辑</td>
    		</tr>
    		
    		<c:forEach items="${dishItemsList }" var="item" >
	    		 <c:choose>
			    	<c:when test="${item.dishInState == '新菜申请'}">
						<tr>
						 	<td>${item.campusName }</td>
						   	<td>${item.cantName }</td>
						   	<td>${item.wndName }</td>
						   	<td>${item.dishTypeName }</td>
						   	<td>${item.dishName }</td>
						   	<td>
							   	<c:if test="${item.dishPhoto != null }">
			   						<img src="/upload/pic/${item.dishPhoto }" width=120 height=90/>
			   					</c:if>
		   					</td>
						   	<td>${item.dishPrice }</td>
						   	<td>${item.dishDate }</td>
						   	<td>${item.dishSale }</td>
						   	<td><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td> 
						   	<td>${item.dishInState }</td>
						   	<td>${item.dishRecmd }</td>
						   	<td>${item.dishKeep }</td>
						   	<td>${item.dishQuality }</td>			   	
						    <td>
							    <a href="deleteDishById.action?dishID=${item.dishID}">删除</a>
						    </td>
						</tr>
			    	</c:when>
				</c:choose>
			</c:forEach>
			
			<c:forEach items="${dishItemsList }" var="item" >
	    		 <c:choose>
			    	<c:when test="${item.dishInState == '新菜申请'}">
			    	</c:when>
					<c:otherwise>
						<tr>
					 	<td>${item.campusName }</td>
					   	<td>${item.cantName }</td>
					   	<td>${item.wndName }</td>
					   	<td>${item.dishTypeName }</td>
					   	<td>${item.dishName }</td>
					   	<td>
						   	<c:if test="${item.dishPhoto != null }">
		   						<img src="/upload/pic/${item.dishPhoto }" width=120 height=90/>
		   					</c:if>
	   					</td>
					   	<td>${item.dishPrice }</td>
					   	<td>${item.dishDate }</td>
					   	<td>${item.dishSale }</td>
					   	<td><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
					   	<td>${item.dishInState }</td>
					   	<td>${item.dishRecmd }</td>
					   	<td>${item.dishKeep }</td>
					   	<td>${item.dishQuality }</td>	
					    <td>
						    <a href="modifyDish.action?dishID=${item.dishID}&dishWndID=${item.dishWndID}
							    	&wndCantID=${item.wndCantID}&cantCampusID=${item.cantCampusID}">修改</a>
						    <a href="deleteDishById.action?dishID=${item.dishID}">删除</a>
					    </td>
					</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
    	</table>
    </form>
  </body>
</html>
