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
    <title>预置食堂信息</title>
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
            <button data-effect="st-effect-3" >
              <div class="burger-container" z-index="-1">
                <span class="burger-bun-top"></span>
                <span class="burger-filling"></span>
                <span class="burger-bun-bot"></span>
              </div>
            </button>
          </div>                   
          <div>  
            <h3>预置食堂</h3>  
          </div>

    <form action="insertCanteen.action" method="post">
    	<!-- 选择食堂所属校区 -->
      <div align="center" >
   		<select name="cantCampusID" data-toggle="select" class="form-control select select-primary mrs mbm" width="80%">
   			<option value="">请选择食堂所属校区</option>
   			<c:forEach items="${campusList }" var="item" >
   				<option value="${item.campusID }">${item.campusName }</option>
			  </c:forEach>
   		</select>
	
   		<select name="cantTypeID" data-toggle="select" class="form-control select select-primary mrs mbm" >
   			<option value="">请选择食堂所属类型</option>
   			<c:forEach items="${canteenTypeList }" var="item" >
   				<option value="${item.cantTypeID }">${item.cantTypeName }</option>
			  </c:forEach>
   		</select>
      </div>
   		<!-- 输入食堂名称 -->
      <div class="form-group" >
    	 <div ><input type="text" placeholder="请输入预置食堂名称" name="cantName" class="form-control "> </div>
       <br>
    	 <div align="center"><input type="submit" value="添加食堂" class="btn btn-primary btn-wide" data-role="none"></div>
      </div>
    <!-- 列举已录入的食堂 -->
	    <table  class="table table-striped table-bordered table-condensed">
		    <thead>
        <tr style="background:#7acfa6;text-align:center;color:white;">
		   	 	<td>校区名称</td>
		   	 	<td>食堂类型</td>
	        <td>食堂名称</td>
		      <td colspan="2">编辑</td>
		    </tr>
        </thead>
			<c:forEach items="${pagehelper.list }" var="item" >
				<tr align="center">
				 	<td>${item.campusName }</td>
				 	<td>${item.cantTypeName }</td>
				  <td>${item.cantName }</td>
				  <td><a href="modifyCanteen.action?cantID=${item.cantID}">修改</a></td>
				  <td><a href="deleteCanteenById.action?cantID=${item.cantID}">删除</a></td>
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
