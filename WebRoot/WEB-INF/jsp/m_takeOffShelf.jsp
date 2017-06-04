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
    	<meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
    
        <script src="js/modernizr.custom.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
    	<div class="container">
            <div class="mp-pusher" id="mp-pusher">
            <%@ include file="publicjsp/m_companyMenu.jsp" %>               
                <div class="scroller" style="background:#EEEEEE">
                    <div class="scroller-inner">
                        <div class="codrops-header" style="background:#29C192">
                             <div id="trigger" class="burger-container">
                                <span class="burger-bun-top"></span>
                                <span class="burger-filling"></span>
                                <span class="burger-bun-bot"></span>
                             </div>                 
                            <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">菜品下架</p>
                        </div>

                        <div class="content clearfix" >
                            <div class="container-fluid" style="margin-top:77px">
                            <div class="panel panel-default">
                            	<div class="panel-heading">
                            		<div class="row">
                                    	<div  style="font-size:15px;">
                                    		校区：${windowItems.campusName}
                                            <br><br><br>
                                    		食堂：${windowItems.cantName}
                                            <br><br><br>
                                    		档口：${windowItems.wndName}
                                    	</div>
                                    </div>                
                                </div>

                                <div class="panel-body">
                                	<form role="form" name="windowForm" action="takeOffShelfPage.action" method="post">
    		                      	<div class="form-group">
    		                      		<div class="col-xs-4">
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
    		        		            <div class="col-xs-4">
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
	    	        		            <div class="col-xs-4">
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
                                        <br>
    		        		            <div align="center">
    		        		            	<input type="submit" class="btn btn-primary btn-wide" value="查询">
    		        		            </div>
    		        	             </div>
                                     <br>
    		        	             <div class="form-group">
    		        	             	<div class="col-xs-6">
    		        	             		<input type="text" class="form-control" name="search" id="search" placeholder="可输入菜名搜索">
    		        	             	</div>
    		        	             	<div class="col-xs-6">
    		        	             		<input type="button" class="btn btn-warning" value="搜索" name="searchin" id="searchin">
    		        	             	</div>
    		        	             </div>
                                     <br>
    		        	            <table class="table table-striped table-bordered table-condensed table-hover table-responsive text-center">
    		        	             	<thead>
    		        	             		<tr id="theader" style="background:#29C192;text-align:center;color:white;font-size:15px">
    		        	             			<th style='text-align: center;'>菜品名称</th>
    		        	             			<th style='text-align: center;'>菜品销售时间</th>
    		        	             			<th style='text-align: center;'>菜品价格</th>
    					               			<th style='text-align: center;'>菜品类型</th>
    					               			<th style='text-align: center;'>菜品销售状态</th>	
    					               			<th style='text-align: center;'>编辑</th>
    		        	             		</tr>
    		        	             	</thead>
    		        		            <tbody>
    		        		            	<c:forEach items="${dishItemsList }" var="item" >
    		        		            		<tr style="color:black;font-size:15px">
    		        		            			<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
    		        		            			<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
    		        		            			<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
    						          	   		    <td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
    						          	   		    <td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
    						          	   		    <td style='vertical-align: middle;text-align: center;'>
    						          	   			<c:if test="${item.dishSale == '在售'}">
    						          	   				<a href="takeOffShelf.action?dishID=${item.dishID}" class="btn btn-primary">停售</a>
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
    </body>
</html>
