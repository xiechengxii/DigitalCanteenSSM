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
    <title>预置校区信息</title>
    <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0">   
 	<meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
		

	<!--<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />--> 
	<script src="js/modernizr.custom.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <link rel='stylesheet' href='http://fonts.googleapis.com/icon?family=Material+Icons' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/sidenav.min.css" />
</head>  
<body>

<div id="st-container" class="st-container">
    <div class="st-pusher">
    <%@ include file="publicjsp/index.jsp" %>               
        <div class="st-content">
        	<div class="st-content-inner">
                <div class="main clearfix">                    
                    <div id="st-trigger-effects">
                       <button data-effect="st-effect-3" >
                            <div class="burger-container" z-index="-1">
                                <span class="burger-bun-top"></span>
                                <span class="burger-filling"></span>
                                <span class="burger-bun-bot"></span>
                            </div>                                
                        </button>
                        <h3>预置校区</h3>
                    </div>
							
			<form action="insertCampus.action" method="post">
			<!-- 添加校区 -->							
				<div class="form-group" >
				    <div> <input name="campusName" class="form-control " type="text" placeholder="请输入预置校区"> </div>
					<br>
				    <div align="center"><input  type="submit" value="添加校区"  class="btn btn-primary btn-wide" data-role="none"></div>
				</div>
														
			<!-- 列举所有已录入校区 -->
					<table   class="table table-striped table-bordered table-condensed">
						<thead>
					    <tr style="background:#7acfa6;text-align:center;color:white;">
					   	 	<td >校区名称</td>
					        <td colspan="2">编辑</td>
					    </tr>
						</thead>
						<c:forEach items="${campusList }" var="item" >
					    <tr align="center">
					        <td>${item.campusName }</td>
					        <td><a href="modifyCampus.action?campusID=${item.campusID}">修改</a></td>
					        <td><a href="deleteCampusById.action?campusID=${item.campusID}">删除</a></td>
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
<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
<script src="js/sidenav.min.js"></script>
<script>$('[data-sidenav]').sidenav();</script>

<!--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓3列菜单开始↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
<!--<div class="btn3 clearfix">
    <div class="menu">
        <div class="bt-name">
        	<div data-role="main" class="ui-content">
			<a href="campusPreset.action" data-transition="slide">
        	<span class="glyphicon glyphicon-home" style="color:#2FA2DB"></span>
        	</a>
        	</div>
        </div>
    </div>

    <div class="menu">
        <div class="bt-name">
        	<div data-role="main" class="ui-content">
        	<a href="campusPreset.action" data-transition="slide">
        	<span class="glyphicon glyphicon-cutlery" style="color:#2FA2DB"></span>
        	</a>
        	</div>
        </div>
    </div>

    <div class="menu">
        <div class="bt-name">
        	<div data-role="main" class="ui-content">
        	<a href="campusPreset.action" data-transition="slide">
        	<span class="glyphicon glyphicon-user" style="color:#2FA2DB"></span>
        	</a>
        	</div>
        </div>
    </div>
</div> -->

</body>
</html>
