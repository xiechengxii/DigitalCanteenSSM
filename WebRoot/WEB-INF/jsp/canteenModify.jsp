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
        
        <title>修改食堂信息</title>
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
                        <h3 class="panel-title">修改预置食堂</h3>
                    </div>

                    <div class="panel-body">
    					<form class="form-horizontal" role="form" name="updateCanteen" method="post" action="modifyCanteenSave.action">
    						<input name="cantID" type="hidden" value="${canteenItems.cantID }">
    						<div class="form-group">                                                                   
                                <label class="col-sm-2 control-label">食堂所属校区</label>
                                <div class="col-sm-9">    
    								<!-- 选择食堂所属校区 -->
    					 			<select class="form-control" name="cantCampusID">
    					 				<!-- 显示之前食堂所属校区 -->	
    					 				<option value="${canteenItems.campusID }" selected="selected">${canteenItems.campusName }</option>
    					 				<c:forEach items="${campusList }" var="item" >		
    					 					<!-- 显示所有校区选项 -->					   						  
    										<option value="${item.campusID }">${item.campusName }</option>
    									</c:forEach>
    								</select>
    							</div>    							
    						</div>
                            <div class="form-group">                                                                   
                                <label class="col-sm-2 control-label">食堂类型</label>
                                <div class="col-sm-9">    
                                    <select class="form-control" name="cantTypeID">
                                        <c:forEach items="${canteenTypeList }" var="item" > 
                                            <c:choose>
                                                <c:when test="${canteenItems.cantTypeID==item.cantTypeID}">
                                                    <option value="${canteenItems.cantTypeID }" selected="selected">${canteenItems.cantTypeName }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.cantTypeID }">${item.cantTypeName }</option>
                                                </c:otherwise>
                                            </c:choose>     
                                        </c:forEach>
                                    </select>
                                </div>                                
                            </div>
    						<div class="form-group">    							    								
    							<label class="col-sm-2 control-label">食堂名称</label>
                                <div class="col-sm-9">    
    								<input name="cantName" class="form-control" type="text" value="${canteenItems.cantName }">
    							</div>    							
    						</div>
    						<div class="form-group">
                                <div class="col-sm-2 col-sm-offset-5">
    							    <input type="submit" class="btn btn-primary" value="保存">
                                </div>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    	</div>
    </body>
</html>
