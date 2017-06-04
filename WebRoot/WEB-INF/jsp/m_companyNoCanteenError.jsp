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
        <title>暂未录入食堂信息</title>   
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
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />   
    </head>
  
    <body>
    	<div class="container">
        <div class="mp-pusher" id="mp-pusher">
        <%@ include file="publicjsp/m_companyMenu.jsp" %>
            <form>
                <input type="hidden" name = "muserID" value="${muserItems.cantID }" >
                <input type="hidden" name = "roleID" value="${muserItems.roleID }" >
                <input type="hidden" name = "roleName" value="${muserItems.roleName }" >        
            </form>
        <!-- 饮食公司管理用户的页面 -->
            <div class="scroller" style="background:#EEEEEE">
                <div class="scroller-inner">
                    <div class="codrops-header" style="background:#29C192">
                         <!-- <div class="row"> -->
                         <div id="trigger" class="burger-container">
                            <span class="burger-bun-top"></span>
                            <span class="burger-filling"></span>
                            <span class="burger-bun-bot"></span>
                         </div>                 
                        <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">饮食公司管理系统</p>
                        <!-- </div> -->
                    </div>

                    <div class="content clearfix" >
                        <div class="container-fluid" style="margin-top:77px">
    	                <p>后台未录入食堂信息，无法查看记录</p><br>
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

