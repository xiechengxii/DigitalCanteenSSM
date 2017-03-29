<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="digitalCanteenSSM.po.Dish" %>
<%@ page import="java.util.*"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">    	
    	<title>菜品录入</title>
        <meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0">   
 		<meta charset="utf-8">
 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
        
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
    	<!--  <script src="js/jquery.mobile-1.4.3.min.js"></script>  -->
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
           $(document).ready(function(){
                $("#view").click(function(){
                  /*  alert("beidianji"); */
                   window.location.href="findRecordDetailDish.action?recordID=${item.recordID}";
                });
            });  
        </script>  	       
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
				    	<div class="container-fluid" style="color:#000; ">	
				    		
				    				<div class="row" style="padding-top:16px">
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
				    	                <div class="row" style="padding-top:16px">
				    	                <div class="form-group" style="position:relative;top:2px;">
				    	                   <div class="col-xs-3" style="padding-top:12px;padding-right:0px;">
				    	                     <b>导入记录：</b>
				    	                   </div>
				    	                   <div class="col-xs-6" style="padding-left:0px;padding-right:0px">
				    	                     <input name ="recordDate" class="Wdate" type="text" onClick="WdatePicker()"> 
				    	                   </div>
				    	                	<div class="col-xs-3" >
				    	                	<input type="button" class="btn btn-primary" value="导入" onClick="getDishInImportDate()"> 
				    	                	</div>			    	                	
				    	            	</div>
				    	            	</div>
				    	            	<div style="padding-top:10px">
				    	            	    <p class="help-block">通过选择日期来导入某一天的菜品录入记录</p>
				    	            	</div>
				    	                <div class="row" style="padding:0 0px;"> 
					                         <div class="form-group">
					                              <div class="item-wrap">
					                                  <c:forEach items="${dishItemsList }" var="item" varStatus="status">
					                                     <div class="item clearfix">
							                    	    	<c:choose>
								                	        	<c:when test="${item.dishInState == '待审核'}"></c:when>
								                	    		<c:otherwise>
								                	    		  <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
								                	    		   <table  width=100%>							               	    		   
								                	    			<tr>
								                	    				<td style='vertical-align: middle;text-align: center;' rowspan=3>
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
								                	    				<td style='vertical-align: middle;text-align: center;' rowspan=3>
								                	    				   	<c:if test="${item.dishPhoto != null }">
								                	       						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="100"/>
								                	       					</c:if>
								                   	    				</td>						               	    			 	
								                	    			   	<td style='vertical-align: middle;font-size:1.5em' colspan=2>${item.dishName }</td>
								                	    			   	<td style='vertical-align: middle;'>${item.dishTypeName }</td>						                	   	
								                	    			</tr>
								                	    			<tr>							               	    		   
								                	    			   	<td style='vertical-align: middle;font-size:0.8em' colspan=2>[${item.wndName }]</td>
								                	    			   	<td style='vertical-align: middle;'>${item.dishDate } ${item.dishSale }</td> 
								                	    			</tr>
								                	    			<tr>						  
								                	    			   	<td style='vertical-align: middle;color:#7ACFA6;font-size:1.5em'>￥${item.dishPrice }</td>
								                	    			   	<td style='vertical-align: middle;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
								                	    			   	<td style='vertical-align: middle;'>${item.dishInState }</td> 
								                	    			</tr>
								                	    			</table>
								                	    		  </div>
								                	    		  <a class="delect-btn">删除</a>
								                	    		</c:otherwise>
								                	    	</c:choose>
								                	      </div>
								                	    </c:forEach>						                              							  	
											       </div>
								              </div>  
								        </div> 
								        <div class="form-group" style="padding-top:5px">
				    	                	<input type="button" class="btn btn-primary" value="提交" onClick=getNowFormatDate()> 
				    	            	</div> 					  				    	                	 				   	            	
				                    </form>				            					        	
				    	</div>
		<script src="js/classie.js"></script>
	    <script src="js/mlpushmenu.js"></script>
	    <script>
	        new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
	    </script>
	    <script>
	  		$(".item").on('swipeleft', function(event) {
	    		event.preventDefault();
	    		
	    		$(this).addClass('selected').siblings('.item').removeClass('selected');
	    		$(this).find('.delect-btn').on('click', function(event) {
	      			event.preventDefault();
	      	    /* Act on the event */
	      			$(this).parent(".item").animate({
	        		height: 0,
	        		width: 0},
	        		300, function() {
	        	/* stuff to do after animation is complete */
	        			$(this).remove();
	      			});
	    		});
	  		});
	  		$(".item").on('swiperight', function(event) {
	    		event.preventDefault();
	    		
	    		$(this).removeClass('selected');
	  		});
	  		/* $(".item").on('swiperight', function(event) {
	    		event.preventDefault();
	    		/* Act on the event */
	    		/* $(this).removeClass('selected');
	  		}); */
	  		
		</script>
    </body>
</html>
