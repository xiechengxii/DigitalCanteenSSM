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
    
    	<title>菜品下架</title>
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
    	<%@ include file="publicjsp/companyMenu.jsp" %>
    	<div class="container-fluid">

    		<form class="form-horizontal" role="form">
    			<div class="form-group">
    				<select name="campusID" class="form-control" onchange="getCanteen(this.value)">
    					<c:forEach items="${campusList}" var="item">
    						<c:if test="${item.campusID == canteenItems.cantCampusID}">
    							<option value="${item.campusID}" selected="selected">${item.campusName}</option>
    						</c:if>
    						<c:if test="${item.campusID != canteenItems.cantCampusID}">
    							<option value="${item.campusID}">${item.campusName}</option>
    						</c:if>
    					</c:forEach>
    				</select>
    				<select name="cantID" class="form-control">
    					<c:forEach items="${canteenItemsList}" var="item">
    						<c:if test="${item.cantCampusID == canteenItems.cantCampusID}">
    							<c:if test="${item.cantID == canteenItems.cantID}">
    								<option value="${item.cantID}" selected="selected">${item.cantName}</option>
    							</c:if>
    							<c:if test="${item.cantID != canteenItems.cantID}">
    								<option value="${item.cantID}">${item.cantName}</option>
    							</c:if>
    						</c:if>
    					</c:forEach>
    				</select>
    				<input type="submit" class="btn btn-primary" value="查询">
    			</div>
    		</form>

            <div class="panel panel-default">

            	<div class="panel panel-heading">
                    <div class="col-sm-1">
                    	<label>校区：</label>${canteenItems.campusName}
                    </div>

                    <div class="col-sm-1">
                    	<label>食堂：</label>${canteenItems.cantName}
                    </div>                    
                </div>

                <div class="panel-body">
                </div>
            </div>
        </div>
    </body>
</html>
