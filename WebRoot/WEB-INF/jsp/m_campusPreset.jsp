<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
	<script src="js/modernizr.custom.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.form.js"></script>
	<script src="js/custom.jquery.form.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script>
        	//添加校区的重复检验
        	function insertCampus(){
        		if(document.campusPresetForm.campusName.value == ""){
        			alert("请输入校区名称");
        			return;
        		}

        		document.campusPresetForm.action="insertCampusWithValidation.action";
        		jquerySubByFId('campusPresetForm', insertCampus_callback, null, "json");
        	}
        	function insertCampus_callback(data){
        		//成功
        		if(data.resultInfo.type == '1'){
        			window.location.href="findAllCampuses.action";
        		}
        		//失败
        		else if(data.resultInfo.type == '0'){
        			alert(data.resultInfo.message);
        			window.location.href="findAllCampuses.action";
        		}
        	}
    </script> 
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />   
</head>  
<body>

<div class="container">
    <div class="mp-pusher" id="mp-pusher">
    <%@ include file="publicjsp/index.jsp" %>               
        <div class="scroller" style="background:#EEEEEE">
        	<div class="scroller-inner">
        	    <div class="codrops-header" style="background:#29C192">
        	         <div id="trigger" class="burger-container">
						<span class="burger-bun-top"></span>
						<span class="burger-filling"></span>
						<span class="burger-bun-bot"></span>
					 </div>					
					<p style="width:100%;height:100%;vertical-align:middle;font-size:27px">预置校区</p>
				</div>
				
                <div class="content clearfix">                                       							
					<form id="campusPresetForm" name="campusPresetForm" role="form" method="post">
					<!-- 添加校区 -->
					<div class=" newcustom" style="margin-top:77px" >							
						<div class="form-group" >
						    <div> <input name="campusName" class="form-control " type="text" placeholder="请输入预置校区" onKeydown="if(event.keyCode==13){return false;}"> </div>
							<br>
						    <div align="center"><input  type="button" value="添加校区"  class="btn btn-primary btn-wide" onclick="insertCampus()"></div>
						</div>
					</div>
					</form>										
					<!-- 列举所有已录入校区 -->
					<div class="newcustom" style="padding: 1em 0.6em">
						<table   class="table table-striped table-bordered table-condensed">
							<thead>
						    	<tr style="background:#29C192;text-align:center;color:white;font-size:15px">
						   		 	<td >校区名称</td>
						    	    <td colspan="2">编辑</td>
						    	</tr>
							</thead>
							<tbody>
							<c:forEach items="${campusList }" var="item" >
						    	<tr align="center" style="color:black;font-size:15px">
						    	    <td>${item.campusName }</td>
						    	    <td><a href="modifyCampus.action?campusID=${item.campusID}" style="color:#66AFE9">修改</a></td>
						    	    <td><a href="deleteCampusById.action?campusID=${item.campusID}" style="color:#66AFE9">删除</a></td>
						    	</tr>
							</c:forEach>
							</tbody>
						</table>
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
