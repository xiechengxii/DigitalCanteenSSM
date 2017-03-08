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
        
        <title>修改预置档口信息</title>
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
        <script>
        /* 在校区选择之后得到该校区之下的食堂选择框
        	objValue：校区的ID值
        	windowUpdateForm：档口更新表单
        	canteenItemsList：所有食堂信息列表
        	wndCantID：食堂select标签的选择值
        */
  	 	function getCanteen(objValue)
	   	{	
	   		var objForm = document.forms["windowUpdateForm"];
	   	
        	if(objValue == ""){
        		objForm.wndCantID.disabled = true;
        	}else{   			 	
        		objForm.wndCantID.disabled = false; 
        		objForm.wndCantID.options.length = 0; 
        		<c:forEach items="${canteenItemsList }" var="item" >  	
        	 		 var cantCampusID = ${item.cantCampusID };   	 			 
        	 		if( cantCampusID == Number(objValue)){	
        	 			/* 把var optionObj = document.createElement("option")放在循环外，则只出现一次值 */
        	 			var optionObj = document.createElement("option"); 				
	                    optionObj.text = "${item.cantName }";
	                    optionObj.value = "${item.cantID }";
	                    objForm.wndCantID.add(optionObj);
        	        }  
	   		    </c:forEach>
        	}
	   	}
    
        function check(form){
        	if(form.cantCampusID.value == ""){
        		alert("请先选择档口所在校区！");
        		return false;
        	}
        	if(form.wndCantID.value == ""){
        		alert("请先选择档口所在食堂！");
        		return false;
        	}
        	if(form.wndName.value == ""){
        		alert("请填写档口名称！");
        		form.wndName.focus();
        		return false;
        	}
        } 
  	    </script>

  	    <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">修改预置窗口</h3>
                    </div>

                    <div class="panel-body">
                        <form class="form-horizontal" role="form" name = "windowUpdateForm" action="modifyWindowSave.action" method="post">
                        	<div class="form-group">
                                <input name="wndID" type="hidden" value="${windowItems.wndID }">
                        	    <!-- 选择食堂所属校区 -->
                                <label class="col-sm-2 control-label">所属校区</label>
                                <div class="col-sm-9"> 
   	                    	        <select name="cantCampusID" class="form-control" onchange="getCanteen(this.value)">	
   	                    	            <c:forEach items="${campusList }" var="item" >
   	                    	                <c:choose>
	                   		                    <c:when test="${windowItems.campusID == item.campusID }">
	                   		                        <option value="${windowItems.campusID }" selected="selected">${windowItems.campusName }</option>
	                   		                    </c:when>
	                   		                    <c:otherwise>
	                   		                         <option value="${item.campusID }">${item.campusName }</option>
	                   		                    </c:otherwise>
	                   		                </c:choose>
	                   		            </c:forEach>
   	                    	        </select>
                                </div>
                            </div>
                            <div class="form-group">
   	                    	    <!-- 选择档口所属食堂 -->
                                <label class="col-sm-2 control-label">所属食堂</label>
                                <div class="col-sm-9"> 
   	                    	        <select name="wndCantID" class="form-control" >
	                      	        	<c:forEach items="${canteenItemsInCampus }" var="item" >
	                      	        		<c:choose>
	                   		        	        <c:when test="${wndCantID == item.cantID }">
	                   		        	            <option value="${windowItems.cantID }" selected="selected">${windowItems.cantName }</option>
	                   		        	        </c:when>
	                   		        	        <c:otherwise>
	                   		        	            <option value="${item.cantID }">${item.cantName }</option>
	                   		        	        </c:otherwise>
	                   		        	    </c:choose>
	                   		        	</c:forEach>
   	                    	        </select>
                                </div>
                            </div>
                            <div class="form-group">
   	                    	    <!-- 输入档口名称 -->
                                <label class="col-sm-2 control-label">档口名称</label>
                                <div class="col-sm-9"> 
                        	        <input type="text" class="form-control" name="wndName" value="${windowItems.wndName }">
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-2 control-label">档口位置</label>
                                <div class="col-sm-9"> 
                                    <input type="text" class="form-control" placeholder="请在此输入档口位置" name="wndAddr" value="${windowItems.wndAddr }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">价格范围</label>
                                <div class="col-sm-9"> 
                                    <input type="text" class="form-control" placeholder="请在此输入档口价格范围"   name="wndPriceRange" value="${windowItems.wndPriceRange }">
                                </div>
                            </div>
                            <div class="form-group">  
                                <label class="col-sm-2 control-label">营业时间段</label> 
                                <div class="col-sm-9"> 
                                    <input type="text" class="form-control" placeholder="请在此输入档口营业时间段" name="wndSaleHours" value="${windowItems.wndSaleHours }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">支付方式</label>
                                <div class="col-sm-9"> 
                                    <input type="text" class="form-control" placeholder="请在此输入档口支付方式"   name="wndPayment" value="${windowItems.wndPayment }">
                                </div>
                            </div>
                            <div class="form-group"> 
                                <label class="col-sm-2 control-label">档口描述</label>
                                <div class="col-sm-9"> 
                                    <input type="text" class="form-control" placeholder="请在此输入档口描述"  name="wndDescription" value="${windowItems.wndDescription }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">档口备注</label>
                                <div class="col-sm-9"> 
                                    <input type="text" class="form-control" placeholder="请在此输入档口备注"       name="wndNote" value="${windowItems.wndNote }">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 col-sm-offset-5">
                        	        <input type="submit" class="btn btn-primary" value="保存" onClick="return check(windowUpdateForm)">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
