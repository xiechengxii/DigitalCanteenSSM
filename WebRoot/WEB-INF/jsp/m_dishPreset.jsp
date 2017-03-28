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
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <!--分页控件--> 
    <link rel="stylesheet" href="css/qunit-1.11.0.css">  
    </head>   
    <body>
    <div class="container">
    <div class="mp-pusher" id="mp-pusher">
    		<%@ include file="publicjsp/index.jsp" %>               
        	<div class="scroller" style="background:#f3efe0">
            <div class="scroller-inner">
                <header class="codrops-header" style="background:#7acfa6">
                  <div class="row">
                   <div id="trigger" class="burger-container">
                      <span class="burger-bun-top"></span>
                      <span class="burger-filling"></span>
                      <span class="burger-bun-bot"></span>
                  </div>         
                  <h1>预置菜品</h1>
                  </div>  
						    </header>

                <div class="content clearfix">
		            <form action="insetDishPreset.action" method="post">
			<!-- 添加预置菜品-->
			           <div class="form-group" >
    			         <div> 
                      <input name="dishPresetName" class="form-control " type="text" placeholder="请输入预置菜品"> 
                    </div>
    			         <br>
    			         <div align="center">
                      <input  type="submit" value="添加菜品"  class="btn btn-primary btn-wide" data-role="none">
                   </div>
  			         </div>

			<!-- 列举所有已录入的预置菜品 --> 
			           <table  class="table table-striped table-bordered table-condensed">
			           	<thead>
			               <tr style="background:#7acfa6;text-align:center;color:white;font-size:15px">
			              	 	<td>预置菜品名称</td>
			                  <td colspan="2">编辑</td>
			               </tr>
			            </thead>
			           	<c:forEach items="${pagehelper.list }" var="item" >
			               <tr align="center" style="color:black;font-size:15px">
			                   <td>${item.dishPresetName }</td>
			                   <td><a href="modifyDishPreset.action?dishPresetID=${item.dishPresetID}">修改</a></td>
			                   <td><a href="deleteDishPresetById.action?dishPresetID=${item.dishPresetID}">删除</a></td>
			               </tr>
			           	</c:forEach>
			           </table>

            <div>
              <div class="message">
                <p class="text-center">
                  共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                </p>
              </div>
              <div style="text-align:center;">
                <ul class="pagination">
                  <c:if test="${!pagehelper.isFirstPage}">                    
                    <li>
                      <a href="findAllDishPreset.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                    </li>
                  </c:if>

                  <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">  

                    <c:if test="${navigatepageNum==pagehelper.pageNum}">
                      <li class="active">
                        <a href="findAllDishPreset.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                      </li>
                    </c:if>

                    <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                      <li>
                        <a href="findAllDishPreset.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                      </li>
                    </c:if>

                  </c:forEach>

                  <c:if test="${!pagehelper.isLastPage}">
                    <li>
                      <a href="findAllDishPreset.action?pageNum=${pagehelper.lastPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                    </li>
                  </c:if>
                </ul>
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
    <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
  	</body>
</html>
