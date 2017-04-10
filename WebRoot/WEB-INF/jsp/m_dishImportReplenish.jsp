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
<html>
  	<head>
    	<meta charset="utf-8">
    	
    	<title>菜品补录</title>

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
    	<!-- <script src="js/jquery.mobile-1.4.3.min.js"></script> -->
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
    		function getdishImportReplenish(form) {
    		    document.importReplenishDishForm.action="importHandle.action";
            	document.importReplenishDishForm.submit(); 
    		}
    		
    		//点击导入以前日期已录入的菜品
    		function getDishInImportReplenishDate(){
    			
    			document.importReplenishDishForm.action="getDishInImportReplenishDate.action";
            	document.importReplenishDishForm.submit(); 
    		}
    		
    		function checkBoxSelect(dishID){
    			var checkbox = document.getElementById(dishID);	
    			checkbox.checked=true;
    		}
    		function getAllSelect(name,boolValue){
    			var allvalue = document.getElementsByName(name);   
        		for (var i = 0; i < allvalue.length; i++) {        
            	if (allvalue[i].type == "checkbox")             
                allvalue[i].checked = boolValue;             
        		} 
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
		      	<div class="scroller" style="background:#EEEEEE">
		            <div class="scroller-inner">
		           		<header class="codrops-header" style="background:#29C192">
		        	        <div class="row">
			        	        <div id="trigger" class="burger-container">
									<span class="burger-bun-top"></span>
									<span class="burger-filling"></span>
									<span class="burger-bun-bot"></span>
								</div>					
								<h1>菜品补录</h1>
							</div>
						</header> 
				    	<div class="container-fluid" style="color:#000;padding:0 0;">
				    		<div class="newcustom" style="margin-top:69px;padding-left:5%">					    		
			    				<div class="row" style="padding-top:16px;">
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

			                        <div class="row" style="padding-top:16px">			                      
				    	                <div class="form-group">					    	          
				                    	    <fmt:formatDate value="${recordDate}" pattern="yyyy-MM-dd" var="theFormattedDate1"/>
				                    	    <div class="col-xs-3" style="padding-top:12px;">
				                    	    	<b>导入记录：</b>
				                    	    </div>
				                    	    <div class="col-xs-6">
				                    	    	<input type="text" name ="recordDate" value="${theFormattedDate1}" class="Wdate"  onClick="WdatePicker()" style="border:1px solid #ccc;border-radius:5px;-webkit-appearance: none;">
				                    	    </div>
				                    	    <div class="col-xs-3">
				                    	    	<input type="button" class="btn btn-primary" value="导入" onClick=getDishInImportReplenishDate()>
				                    	    </div>				                    	     					                    	    
				                    	</div>
				                    </div>
				                    <div class="row" style="padding-top:8px;font-size:1.2em">
				                        <p class="help-block">通过选择日期来导入某一天的菜品录入记录</p>
				                    </div>
				                    <div class="row">
				                    	<div class="form-group">					                    
				                    		<fmt:formatDate value="${muserItems.muserSubmitDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/>
				                    		<div class="col-xs-3" style="padding-top:3%;">
					                    	    <b>补录日期：</b>
					                    	</div>
					                    	<div class="col-xs-6">
					                    	    <input type="text" name ="muserSubmitDate" value="${theFormattedDate}" class="Wdate"  onClick="WdatePicker()" style="border:1px solid #ccc;border-radius:5px;-webkit-appearance: none;">
					                    	</div> 					                             					                                
				                    	</div>
				                    </div>
				                    <div class="row" style="padding-top:8px;font-size:1.2em">
				                        <p class="help-block">选择要补录记录的日期</p>
				                    </div>
				                    <!-- <hr style="margin:0 0 1.4em; background:#ddd;color:#ddd;clear:both;width:100%;height: 5px; line-height: 3px;font-size: 0; border: none 0;"> -->
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
							                	    			   			<td style='vertical-align: middle;color:#29C192;font-size:1.5em'>￥${item.dishPrice }</td>
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
					        		<div class="form-group" style="padding-top:5px" align="center">
	                    				<input type="button" class="btn btn-primary" value="录入" onClick=getdishImportReplenish() > 
	                    			</div>				  				    	                	 				   	            	
	                    		</form>
		                    </div>				            					        	
		    	        </div>
		    	    </div>
		    	</div>
		    </div>
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
