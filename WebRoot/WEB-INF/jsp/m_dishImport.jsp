<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="digitalCanteenSSM.po.Dish" %>
<%@ page import="java.util.*"%>
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
        <meta charset="utf-8">       
        <title>菜品录入</title>
    	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
         
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
    	<script src="js/jquery.mobile-1.4.3.min.js"></script>
        <!--日历控件-->	
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
	    <script src="js/moment.js"></script>
	    <script src="js/daterangepicker-1.3.7.js"></script>
	    
    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" />
    	<link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
    	
    	<!-- 日期控件导入 -->
        <script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script>      
       

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
        <div class="container">
		     <div class="mp-pusher" id="mp-pusher">
		      <%@ include file="publicjsp/canteennavindex.jsp" %> 
		      	<div class="scroller" style="background:#f3efe0">
		            <div class="scroller-inner">
		           		<header class="codrops-header" style="background:#7acfa6">
		        	         <div class="row">
			        	         <div id="trigger" class="burger-container">
									<span class="burger-bun-top"></span>
									<span class="burger-filling"></span>
									<span class="burger-bun-bot"></span>
								 </div>					
								<h1>食堂管理系统</h1>
							 </div>
						</header> 
				    	<div class="container-fluid">	
				    		
				    				<div class="row">
				 						<div class="col-xs-4">
									   		<label>所属校区：</label>${muserItems.campusName}
									   	</div>
									   	<div class="col-xs-4">
									   		<label>所属食堂：</label>${muserItems.cantName}
									   	</div>
									   	<div class="col-xs-4">
									   		<label>管理员：</label>${muserItems.muserName}
									   	</div>
									</div>
				    			
				    			
					    		    <!-- 所有菜品显示列表 -->
				                    <form role="form" name="importDishForm" method="post" enctype="multipart/form-data" >
				    	                <input type="hidden" name = "muserSubmitDate" >
				    	     
				    	                <div class="form-group" style="position:relative;top:2px;">
				    	                	<b>导入记录：</b><input name ="recordDate" class="Wdate" type="text" onClick="WdatePicker()"> 
				    	                	<input type="button" class="btn btn-primary" value="导入" onClick=getDishInImportDate()> 
				    	                	<p class="help-block">通过选择日期来导入某一天的菜品录入记录</p>
				    	            	</div>
				    	                <div class="row" style="padding:0 0px;"> 
					                         <div class="form-group">
					                              <div class="item-wrap">
					                                  <c:forEach items="${dishItemsList }" var="item" varStatus="status">
							                    	    	<c:choose>
								                	        	<c:when test="${item.dishInState == '待审核'}"></c:when>
								                	    		<c:otherwise>
								                	    		   <table>							               	    		   
								                	    			<tr>
								                	    				<td style='vertical-align: middle;text-align: center;'>
								                	    					<input type="checkbox" name="dishIDList" id="${item.dishID }" value="${item.dishID }" />
								                	    				</td>
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
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
								                	    			   	
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishInState }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>
								                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishQuality }</td>	
								                	    			</tr>
								                	    			</table>
								                	    		</c:otherwise>
								                	    	</c:choose>
								                	    </c:forEach>
						                              <c:forEach items="${pagehelper.list }" var="item" >
						                                    <div class="item clearfix">
															    <div class="img-item">
															      <img src="/upload/pic/user-default.jpg">
															    </div>
														    
															    <div class="txt-item">
															      <table border=1>
															          <tr><td colspan=2></td><td></td></tr>
															          <tr><td colspan=2></td><td></td></tr>
															          <tr><td></td><td></td><td></td></tr> 
															      </table>
															      <p class="name">小黄人</p>
															      <p class="txt">小黄人小黄人小黄人小黄人</p>
															    </div>
														    
														        <a class="delect-btn">删除</a>
														  	</div>
														  	<div  id="view" class="item clearfix">										    									        									        
															    <div class="txt-item">
															      <table>
															           <tr><td style="width:80%"><p class="name">${item.recordCampusName } ${item.recordCantName }</p></td><td style="width:80%"><p class="name">${item.recordMUserName }</p></td></tr>
															           <tr><td><p class="txt"><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></p></td><td><p class="txt"> ${item.recordSubmitState }</p></td></tr>
															      </table>										      
															    </div>									    									        								  	
														  	    <a class="delect-btn">删除</a>
														  	</div>
													  </c:forEach>										  	
											       </div>
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
				                    				<th style='text-align: center;'>菜品类型</th>
				                    				<th style='text-align: center;'>菜品名称</th>
				                    				<th style='text-align: center;'>菜品图片</th>
				                    				<th style='text-align: center;'>菜品价格</th>
				                    				<th style='text-align: center;'>菜品销售时间</th>
				                    				<th style='text-align: center;'>菜品销售状态</th>			
				                    				<th style='text-align: center;'>菜品录入日期</th>
				                    				<th style='text-align: center;'>菜品录入状态</th>
				                    				<th style='text-align: center;'>菜品推荐</th>
				                    				<th style='text-align: center;'>菜品留样</th>
				                    				<th style='text-align: center;'>菜品合格</th> 			
				                    			</tr>
				                    		</thead>
				                    		<tbody>
						                	    <!-- dishDetailInDateList -->
						                	    <c:forEach items="${dishItemsList }" var="item" varStatus="status">
					                    	    	<c:choose>
						                	        	<c:when test="${item.dishInState == '待审核'}"></c:when>
						                	    		<c:otherwise>
						                	    			<tr>
						                	    				<td style='vertical-align: middle;text-align: center;'>
						                	    					<input type="checkbox" name="dishIDList" id="${item.dishID }" value="${item.dishID }" />
						                	    				</td>
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
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>
						                	    				   	<c:if test="${item.dishPhoto != null }">
						                	       						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="120"/>
						                	       					</c:if>
						                   	    				</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishInState }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>
						                	    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishQuality }</td>	
						                	    			</tr>
						                	    		</c:otherwise>
						                	    	</c:choose>
						                	    </c:forEach>
						                	</tbody>
				    	            	</table>
				    	            	<div class="form-group">
				    	                	<input type="button" class="btn btn-primary" value="提交" onClick=getNowFormatDate()> 
				    	            	</div> 
				                    </form>
				            	
				        	
				    	</div>
    </body>
</html>
