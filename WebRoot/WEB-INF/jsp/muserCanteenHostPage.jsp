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
    	
    	<title>食堂管理首页</title>

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
    	<%@ include file="publicjsp/canteenMenu.jsp" %>
        <div class="container-fluid">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h3 class="panel-title">${muserItems.cantName }  菜品录入记录</h3>
                </div>

                <div class="panel-body">
                    <form role="form" name="muserCanteenForm" method="post">
	                    <!-- 食堂管理员 -->
	                    <input type="hidden" name = "campusID" value="${muserItems.campusID }" >
	                    <input type="hidden" name = "cantID" value="${muserItems.cantID }" >
	                    <input type="hidden" name = "muserID" value="${muserItems.cantID }" >
                        <div class="form-group">                            
	                        <%@ include file="recordInCanteen.jsp" %>
                        </div>
                    </form> 
                </div>

            </div>
        </div> 
    </body>
</html>
