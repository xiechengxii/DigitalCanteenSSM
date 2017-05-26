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
    <title>修改校区信息</title>   
	  <meta http-equiv="pragma" content="no-cache" />
	  <meta http-equiv="cache-control" content="no-cache" />
	  <meta http-equiv="expires" content="0">   
 	  <meta charset="utf-8">
 	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
	  <meta name="apple-mobile-web-app-capable" content="yes">
	  <meta name="apple-mobile-web-app-status-bar-style" content="black">
	  <meta name="format-detection" content="telephone=no">
    
	  <script src="js/jquery-1.10.1.min.js"></script>
	  <script src="js/modernizr.custom.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/custom.jquery.form.js"></script>
    <script src="js/jquery.validate.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <script>
        function upadteCampus(){
          if(document.updateCampusForm.campusName.value == ""){
            alert("请输入校区名称");
              return;
          }

          document.updateCampusForm.action = "modifyCampusSaveWithValidation.action";
          jquerySubByFId('updateCampusForm', updateCampus_callback, null, "json");
        }
        function updateCampus_callback(data){
            //有同名校区
            if(data.resultInfo.type == '0'){
              alert(data.resultInfo.message);
            }
            window.location.href="findAllCampuses.action";
        }
    </script>
  </head>
  <body>
      <div class="codrops-header" style="background:#29C192;">
            <div class="back-container">
              <button class="btn btn-link btn-lg" ><a style="color:#fff" class="icon icon-arrow-left" data-ajax="false" href="${pageContext.request.contextPath }/campusPreset.action"></a></button>
            </div>  
            <p style="width:100%;height:100%;font-size:27px">修改校区</p>
      </div>
  <div class=" newcustom" style="margin-top:77px" >
  <form name="updateCampusForm" id= "updateCampusForm" role="form" method="post">
  	<!-- 修改校区信息 -->  	
  	<br>
	  <input name="campusID" type="hidden" value="${campus.campusID }">
	  <input name="campusName" class="form-control " type="text" value="${campus.campusName }" onKeydown="if(event.keyCode==13){return false;}">
	  <br>
	  <div align="center"><input type="button" value="保存" class="btn btn-primary btn-wide" onclick="upadteCampus()"> </div>
  </form>
  </div>
  </body>
</html>
