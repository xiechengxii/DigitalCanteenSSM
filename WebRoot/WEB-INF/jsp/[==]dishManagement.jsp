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

		<script type="text/javascript">
		function addDish(){
			document.dishManagementForm.action="addDish.action";
    	    document.dishManagementForm.submit();
		}
		function applyDish(){
			document.dishManagementForm.action="applyDish.action";
    	    document.dishManagementForm.submit();
		}
		function importDish(){
			document.dishManagementForm.action="importDish.action";
    	    document.dishManagementForm.submit();
		}
		function findDishInCanteen(){
			document.dishManagementForm.action="findDishInCanteen.action";
    	    document.dishManagementForm.submit();
		}
		function findDishInCampus(){
			document.dishManagementForm.action="findDishInCampus.action";
    	    document.dishManagementForm.submit();
		}
		</script>
    </head>
  
    <body>  
    	<%@ include file="publicjsp/canteenMenu.jsp" %>
    	<!-- 菜品管理页面 -->
    	<form  name="dishManagementForm" method="post" >   
    		<!-- 食堂管理员信息 -->
    		所属校区：<input type="text" name = "campusName" value="${muserItems.campusName }" readonly="readonly">
    		所属食堂：<input type="text" name = "cantName" value="${muserItems.cantName }" readonly="readonly">
    		管理员：<input type="text" name = "muserName" value="${muserItems.muserName }" readonly="readonly">
    		<br/><br/>
	
		   	<input type="button" value="添加已预置菜品" onClick=addDish()>
		    <input type="button" value="申请新菜品" onClick=applyDish()>
		    <input type="button" value="今日菜品录入" onClick=importDish()>
		    <input type="button" value="查看本食堂所有菜品" onClick=findDishInCanteen()>
		    <input type="button" value="查看本校区所有菜品" onClick=findDishInCampus()>
		    <br/><br/>
		</form>
    </body>
</html>
