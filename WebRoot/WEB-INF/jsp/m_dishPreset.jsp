<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    	<base href="<%=basePath%>">  	
    	<title>预置菜品信息</title>
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
    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" />  
    </head>   
    <body>
    <div id="st-container" class="st-container">
    	<div class="st-pusher">
    		<%@ include file="publicjsp/index.jsp" %>               
        	<div class="st-content">
        		<div class="st-content-inner">
        			<div class="main clearfix">
        				<div id="st-trigger-effects">
            			   <button data-effect="st-effect-3">
            			   	<div class="burger-container" z-index="-1">
                                <span class="burger-bun-top"></span>
                                <span class="burger-filling"></span>
                                <span class="burger-bun-bot"></span>
                            </div>
            			   </button>
            			</div>
    					<div> 
						   <h3>预置菜品</h3>  
						</div>

		<form action="insetDishPreset.action" method="post">
			<!-- 添加预置菜品-->
			<div class="form-group" >
    			<div> <input name="dishPresetName" class="form-control " type="text" placeholder="请输入预置菜品"> </div>
    			<br>
    			<div align="center"><input  type="submit" value="添加菜品"  class="btn btn-primary btn-wide" data-role="none"></div>
  			</div>

			<!-- 列举所有已录入的预置菜品 --> 
			<table  class="table table-striped table-bordered table-condensed">
				<thead>
			    <tr style="background:#7acfa6;text-align:center;color:white;">
			   	 	<td>预置菜品名称</td>
			        <td colspan="2">编辑</td>
			    </tr>
			    </thead>
				<c:forEach items="${pagehelper.list }" var="item" >
			    <tr align="center">
			        <td>${item.dishPresetName }</td>
			        <td><a href="modifyDishPreset.action?dishPresetID=${item.dishPresetID}">修改</a></td>
			        <td><a href="deleteDishPresetById.action?dishPresetID=${item.dishPresetID}">删除</a></td>
			    </tr>
				</c:forEach>
			</table>		
		</form>
		</div>
		</div>
		</div>
	</div>
    </div>
    <script src="js/classie.js"></script>
    <script src="js/sidebarEffects.js"></script>
  	</body>
</html>
