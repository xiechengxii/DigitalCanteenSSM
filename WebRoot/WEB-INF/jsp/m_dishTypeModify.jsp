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
    <title>修改菜品类型信息</title>
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
      <header class="codrops-header" style="background:#29C192;padding-top:22px;">
          <div class="row">
              <button class="btn btn-lg" style="position:relative;right:48%;top:15px;padding:0 0;background-color:#29C192";>
                  <a style="color:#fff" class="icon icon-arrow-left" data-ajax="false" href="${pageContext.request.contextPath }/dishTypePreset.action"></a>
              </button>    
              <h1>修改菜品类型</h1>
          </div>  
      </header>
      <div class=" newcustom" style="margin-top:77px" >
      <form name="updateDishType" method="post" action="modifyDishTypeSave.action">
      	<!-- 修改菜品类型信息 -->
        <br>
	      <input name="dishTypeID" type="hidden" value="${dishType.dishTypeID }">
	      <input name="dishTypeName" class="form-control " type="text" value="${dishType.dishTypeName }">
	      <br>
	      <div align="center"><input type="submit" value="保存" class="btn btn-primary btn-wide" data-role="none"></div>
      </form>
    </div>
  </body>
</html>
