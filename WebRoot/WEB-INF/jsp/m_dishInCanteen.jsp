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
    	<base href="<%=basePath%>">
    	<meta charset="utf-8">
    	<title>食堂菜品</title>
    	
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
    </head>
  
    <body>
        <div class="container" >
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
						        <h1>食堂菜品</h1>
					        </div>
				        </header> 								
            	        <div class="container-fluid" style="color:#000;padding:0 0px;">
                            <div class="row" style="padding:16px 0px 16px 16px">
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
                            <form role="form" name="dishForm" enctype="multipart/form-data">
        					   <input name="dishID" type="hidden" value="${dishItems.dishID }">		                
        	                    <div class="row" style="padding:0 0px;"> 
    	                            <div class="form-group">
    	                                <div class="item-wrap">
    	                                    <c:forEach items="${pagehelper.list }" var="item">
    	                                        <div class="item clearfix">
    			                    	    	    <c:choose>
    				                	        	    <c:when test="${item.dishInState == '待审核'}">        				                	    		
        				                	    		    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
        				                	    		        <table  width=100% border=2>							               	    		   
        				                	    			        <tr>					 				                	    				
        				                	    			            <td style='vertical-align: left;text-align: center;' rowspan=3>
                				                	    				   	<c:if test="${item.dishPhoto != null }">
                				                	       						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="80" width="100"/>
                				                	       					</c:if>
        				                   	    				        </td>						               	    			 	
        				                	    			   	        <td style='vertical-align: left;font-size:1.5em' colspan=2>${item.dishName }</td>
        				                	    			   	        <td style='vertical-align: left;'>${item.dishTypeName }</td>						                	   	
        				                	    			        </tr>
        				                	    			        <tr>							               	    		   
        				                	    			   	        <td style='vertical-align: left;font-size:0.8em' colspan=2>[${item.wndName }]</td>
        				                	    			   	        <td style='vertical-align: left;'>${item.dishDate } ${item.dishSale }</td> 
        				                	    			        </tr>
        				                	    			        <tr>						  
        				                	    			   	        <td style='vertical-align: middle;color:#29C192;font-size:1.5em'>￥${item.dishPrice }</td>
        				                	    			   	        <td style='vertical-align: middle;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
        				                	    			   	        <td style='vertical-align: middle;'>${item.dishInState }</td> 
        				                	    			        </tr>
        				                	    			    </table>
        				                	    		    </div>
        				                	    		    <a href="deleteDishById.action?dishID=${item.dishID}" class="delect-btn">删除</a>
        				                	    		</c:when>
    				                	    	    </c:choose>
    				                	        </div>
    				                	    </c:forEach>
    				                	    <c:forEach items="${pagehelper.list }" var="item">
    	                                        <div class="item clearfix">
    			                    	    	    <c:choose>
    				                	        	    <c:when test="${item.dishInState == '待审核'}">
    				                	        	    </c:when>
    				                	        	    <c:otherwise>  				           				                	    		
        				                	    		    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
        				                	    		        <table  width=100% onclick="location.href='modifyDish.action?dishID=${item.dishID}&dishWndID=${item.wndID}&wndCantID=${item.cantID}';">							               	    		   
        				                	    			        <tr>					 				                	    				
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
        				                	    		    <a href="deleteDishById.action?dishID=${item.dishID}" class="delect-btn">删除</a>
        				                	    		</c:otherwise> 
    				                	    	    </c:choose>
    				                	        </div>
    				                	    </c:forEach>    				                	    				                              						 	
    							        </div>
    				                </div>  
    				            </div> 				  
    		                </form> 			             
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
