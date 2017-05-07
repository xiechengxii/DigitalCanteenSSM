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

        <!-- jQuery支撑 -->
        <script src="js/jquery.form.js"></script>
	    <script src="js/custom.jquery.form.js"></script>
	    <script src="js/jquery.validate.js"></script>

        <script>
        	function getCanteen(objValue){
        		var objForm = document.forms["windowForm"];

        		if(objValue != ""){
        			objForm.cantID.disabled = false;
        			objForm.cantID.options.length = 0;

        			<c:forEach items="${canteenItemsList}" var="item">
        				var campusID = ${item.campusID};
        				var optionObj = document.createElement("option");

        				if(campusID == Number(objValue)){
        					optionObj.text  = "${item.cantName}";
        					optionObj.value = "${item.cantID}";
        					objForm.cantID.add(optionObj);
        				}
        			</c:forEach>
        			getWindow(objForm.cantID.options[0].value);
        		}
        	}

        	function getWindow(objValue){
        		var objForm = document.forms["windowForm"];

        		if(objValue != ""){
        			objForm.wndID.disabled = false;
        			objForm.wndID.options.length = 0;

        			<c:forEach items="${windowItemsList}" var="item">
        				var wndCantID = "${item.wndCantID}";
        				var optionObj = document.createElement("option");

        				if(wndCantID == Number(objValue)){
        					optionObj.text  = "${item.wndName}";
        					optionObj.value = "${item.wndID}";
        					objForm.wndID.add(optionObj);
        				}
        			</c:forEach>
        		}
        	}

        	$(document).ready(function(){
        		$("#searchin").click(function(){
        			var txt = $("#search").val();

        			if($.trim(txt) != ""){
        				$("table tr:not('#theader')").hide().filter(":contains('"+txt+"')").show();
        			}else{
        				$("table tr:not('#theader')").css("background", "#fff").show();
        			}
        		});
        	});
        </script>
    </head>
  
    <body>
    	<%@ include file="publicjsp/companyMenu.jsp" %>
    	<div class="container-fluid">
            <div class="panel panel-default">

            	<div class="panel-heading">
            		<div class="row">
                    	<div class="col-sm-1">
                    		<label>校区：</label>${windowItems.campusName}
                    	</div>
	
                    	<div class="col-sm-1">
                    		<label>食堂：</label>${windowItems.cantName}
                    	</div>
	
                    	<div class="col-sm-1">
                    		<label>档口：</label>${windowItems.wndName}
                    	</div>
                    </div>                
                </div>

                <div class="panel-body">
                	<form class="form-horizontal" role="form" name="windowForm" action="takeOffShelfPage.action" method="post">
    		        	<div class="form-group">
    		        		<div class="col-sm-2">
    		        			<select name="campusID" class="form-control" onchange="getCanteen(this.value)">
    		        				<c:forEach items="${campusList}" var="item">
    		        					<c:if test="${item.campusID == windowItems.campusID}">
    		        						<option value="${item.campusID}" selected="selected">${item.campusName}</option>
    		        					</c:if>
    		        					<c:if test="${item.campusID != windowItems.campusID}">
    		        						<option value="${item.campusID}">${item.campusName}</option>
    		        					</c:if>
    		        				</c:forEach>
    		        			</select>
    		        		</div>
    		        		<div class="col-sm-2">
    		        			<select name="cantID" class="form-control" onchange="getWindow(this.value)">
    		        				<c:forEach items="${canteenItemsList}" var="item">
    		        					<c:if test="${item.cantCampusID == windowItems.campusID}">
    		        						<c:if test="${item.cantID == windowItems.wndCantID}">
    		        							<option value="${item.cantID}" selected="selected">${item.cantName}</option>
    		        						</c:if>
    		        						<c:if test="${item.cantID != windowItems.wndCantID}">
    		        							<option value="${item.cantID}">${item.cantName}</option>
    		        						</c:if>
    		        					</c:if>
    		        				</c:forEach>
    		        			</select>
	    	        		</div>
	    	        		<div class="col-sm-2">
    		        			<select name="wndID" class="form-control">
    		        				<c:forEach items="${windowItemsList}" var="item">
    		        					<c:if test="${item.wndCantID == windowItems.wndCantID}">
    		        						<c:if test="${item.wndID == windowItems.wndID}">
    		        							<option value="${item.wndID}" selected="selected">${item.wndName}</option>
    		        						</c:if>
    		        						<c:if test="${item.wndID != windowItems.wndID}">
    		        							<option value="${item.wndID}">${item.wndName}</option>
    		        						</c:if>
    		        					</c:if>
    		        				</c:forEach>
    		        			</select>
    		        		</div>
    		        		<div class="col-sm-1">
    		        			<input type="submit" class="btn btn-primary" value="查询">
    		        		</div>
    		        	</div>
    		        	<div class="form-group">
    		        		<div class="col-sm-2">
    		        			<input type="text" class="form-control" name="search" id="search" placeholder="可输入菜名搜索">
    		        		</div>
    		        		<div class="col-sm-1">
    		        			<input type="button" class="btn btn-warning" value="搜索" name="searchin" id="searchin">
    		        		</div>
    		        	</div>

    		        	<table class="table table-striped table-bordered table-hover table-responsive text-center">
    		        		<thead>
    		        			<tr id="theader">
    		        				<th style='text-align: center;'>档口名称</th>
    		        				<th style='text-align: center;'>菜品销售时间</th>
    		        				<th style='text-align: center;'>菜品名称</th>
    		        				<th style='text-align: center;'>菜品价格</th>
    								<th style='text-align: center;'>菜品类型</th>
    								
    								
    								
    										
    								<th style='text-align: center;'>菜品录入日期</th>				
    								<th style='text-align: center;'>菜品推荐</th>
    								<th style='text-align: center;'>菜品留样</th>
    								<th style='text-align: center;'>菜品销售状态</th>	
    								<th style='text-align: center;'>编辑</th>
    		        			</tr>
    		        		</thead>
    		        		<tbody>
    		        			<c:forEach items="${dishItemsList }" var="item" >
    		        				<tr>
    		        					<td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
    		        					<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
    		        					<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
    		        					<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
    							   		
    							   		
    							   		
    							   		
    							   		<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td> 
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
    							   		<td style='vertical-align: middle;text-align: center;'>
    							   			<c:if test="${item.dishSale == '在售'}">
    							   				<a href="takeOffShelf.action?dishID=${item.dishID}" class="btn btn-primary">下架</a>
    							   			</c:if>
    							   			<c:if test="${item.dishSale == '已下架'}">
    							   				<a href="takeOnShelf.action?dishID=${item.dishID}" class="btn btn-danger">上架</a>
    							   			</c:if>
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
