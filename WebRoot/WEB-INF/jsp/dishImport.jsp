<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
    <head>
        <base href="<%=basePath%>">
        
        <title>菜品录入</title>

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
	    	function getRecordDish(){
	    
	    		obj = document.getElementsByName("dishIDList");
	    	    recordDishID = [];
	    	    for(k in obj){
	    	        if(obj[k].checked)
	    	            recordDishID.push(obj[k].value);
	    	    }
	    	}
	    	/* <!-- onClick=getRecordDish() --> */
	    	/* 得到系统格式化的日期 */
	    	function getNowFormatDate(form) {
	    	    var date = new Date();
	    	    var seperator1 = "-";
	    	    var seperator2 = ":";
	    	    var month = date.getMonth() + 1;
	    	    var strDate = date.getDate();
	    	    if (month >= 1 && month <= 9) {
	    	        month = "0" + month;
	    	    }
	    	    if (strDate >= 0 && strDate <= 9) {
	    	        strDate = "0" + strDate;
	    	    }
	    	    /* var currentDate= date.getFullYear() + seperator1 + month + seperator1 + strDate
	    	            + " " + date.getHours() + seperator2 + date.getMinutes()
	    	            + seperator2 + date.getSeconds(); */
	    	    var currentDate= date.getFullYear() + seperator1 + month + seperator1 + strDate;
	    	    document.importDishForm.muserSubmitDate.value=currentDate;
	    	    document.importDishForm.action="importHandle.action";
            	document.importDishForm.submit(); 
	    	}
	    	
	    	//点击导入以前日期已录入的菜品
	    	function getDishInImportDate(){
	    		document.importDishForm.action="getDishInImportDate.action";
            	document.importDishForm.submit(); 
	    	}
	    	
	    	function checkBoxSelect(dishID){
	    		var checkbox = document.getElementById(dishID);	
	    		checkbox.checked=true;
	    	}
	    
	    	var checkflag=false;
    		function getAllDishSelect(name){
    			var allvalue = document.getElementsByName(name);
    			
    			if(checkflag==false){
    				for (var i = 0; i < allvalue.length; i++) {        
    		        	if ((allvalue[i].type == "checkbox"))             
    		            allvalue[i].checked = true;  	                       
        			}  
        			checkflag=true;
    			}else{
    				for (var i = 0; i < allvalue.length; i++) {        
    		        	if ((allvalue[i].type == "checkbox"))             
    		            allvalue[i].checked = false;  	                       
        			}  
        			checkflag=false;
    			}
    		}
	    </script>

	    <script src="././My97DatePicker/WdatePicker.js"></script>
    </head>
  
    <body >
    	<%@ include file="publicjsp/canteenMenu.jsp" %>
    	<div class="container-fluid">	
    		<div class="panel panel-default">
    			<div class="panel panel-heading">
    				<div class="row">
 						<div class="col-sm-1">
					   		<label>所属校区：</label>${muserItems.campusName}
					   	</div>
					   	<div class="col-sm-1">
					   		<label>所属食堂：</label>${muserItems.cantName}
					   	</div>
					   	<div class="col-sm-1">
					   		<label>管理员：</label>${muserItems.muserName}
					   	</div>
					</div>
    			</div>
    			<div class="panel-body">
	    		    <!-- 所有菜品显示列表 -->
                    <form role="form" name="importDishForm" id="importDishForm" method="post" enctype="multipart/form-data" >
    	                <input type="hidden" name = "muserSubmitDate" >

    	                <div class="form-group">
    	                	<b>导入记录：</b><input name ="recordDate" class="Wdate" type="text" onClick="WdatePicker()"> 
    	                	<input type="button" class="btn btn-primary" value="导入" onClick=getDishInImportDate()> 
    	                	<p class="help-block">通过选择日期来导入某一天的菜品录入记录</p>
    	                	<!-- replenishFlag此处用于标记页面是属于录入、补录还是修改页面 -->
    	                	<input type="hidden" name="replenishFlag" value="0"></input>
    	            	</div>

    	                <div class="form-group">
    	                	<div class="col-sm-2">
    	                		<input type="hidden" name="dishdate" id="dishdate" value="${dishDate}">
	                        	<select name="dishDate" id="dishDate" class="form-control">
	                        	    <option value="">请选择时间档</option>
	                        	    <option value="早餐">早餐</option>
	                        	    <option value="中餐">中餐</option>
	                        	    <option value="晚餐">晚餐</option>
	                        	    <option value="全天供应">全天供应</option>
	                        	</select>
    	                	</div>
    	                	<div>
    	                		<input type="text" name="search" id="search">
	                			<input type="button" class="btn btn-primary" value="搜索" name="searchin" id="searchin">
    	                	</div>
    	                </div>  

    	                <table  class="table table-striped table-bordered table-hover table-responsive text-center">
    	                	<thead>
                    			<tr>
                    				<th style='text-align: center;'>
                    					<input type="checkbox" id="selectAll" name="selectAll" onclick="getAllDishSelect('dishIDList')">
                    				</th>
                    				<th style='text-align: center;'>校区名称</th>
                    				<th style='text-align: center;'>食堂名称</th>
                    				<th style='text-align: center;'>档口名称</th>
                    				<th style='text-align: center;'>菜品名称</th>
                    				<th style='text-align: center;'>菜品类型</th>                    				
                    				<th style='text-align: center;'>菜品图片</th>
                    				<th style='text-align: center;'>菜品价格</th>
                    				<th style='text-align: center;'>菜品销售时间</th>
                    				<th style='text-align: center;'>菜品销售状态</th>
                    				<th style='text-align: center;'>菜品录入日期</th>
                    				<th style='text-align: center;'>菜品留样</th>
                    			</tr>
                    		</thead>
                    		<tbody>
		                	    <!-- 传递记录表编号 -->
		                	    <input type="hidden" name="recordID" value="${recordID }">

		                	    <c:forEach items="${dishItemsList }" var="item" varStatus="status">
		                	    	<tr>
		                	    		<td style='vertical-align: middle;text-align: center;'>
		                	    			<input type="checkbox" name="dishIDList" id="${item.dishID }" value="${item.dishID }" />
		                	    		</td>
		                	    		<!-- 导入之前日期的菜品的处理 -->
		                	    		<c:choose >
		                	    			<c:when test="${dishDetailInDateList == null }">
		                	    			</c:when>
		                	    			<c:otherwise>
		                	    				<c:forEach items="${dishDetailInDateList }" var="itemInDate">
		                	    					<c:choose>
		                	    						<c:when test="${itemInDate.detailDishID == item.dishID }">
		                	    							<script> checkBoxSelect("${item.dishID}");</script>		
		                	    						</c:when>
		                	    					</c:choose>
		                	    				</c:forEach>
		                	    			</c:otherwise>
		                	    		</c:choose>
		                	    	 	<td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>		                	    			   	
		                	    	   	<td style='vertical-align: middle;text-align: center;'>
		                	    		   	<c:if test="${item.dishPhoto != null }">
		                	       				<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="120"/>
		                	       			</c:if>
		                   	    		</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
		                	    	   	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>		                	    			   		                	    			   	
		                	    	   	<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>		                	    			   	
		                	    	</tr>	                	    				                	    	
		                	    </c:forEach>
		                	</tbody>
    	            	</table>
    	            	<div class="form-group">
    	                	<input type="button" class="btn btn-primary" value="保存" onClick=getNowFormatDate()>
    	            	</div> 
                    </form>
            	</div>
        	</div>
    	</div>
    </body>
</html>
