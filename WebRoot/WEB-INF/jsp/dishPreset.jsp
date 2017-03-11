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

    	<meta name="viewport" content="width=device-width, 
                                                 initial-scale=0.3, 
                                                 maximum-scale=1.0, 
                                                 user-scalable=true">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--自定义-->      
        <link rel="stylesheet" href="css/my-custom.css">
        <!--分页控件--> 
        <link rel="stylesheet" href="css/qunit-1.11.0.css">
        
        <!--bootstrap-->    
        <script src="js/jquery-1.10.1.min.js"></script>       
        
        <!--bootstrap-->    
        <script src="js/bootstrap.min.js"></script>
    </head>
    
    <body>
    	<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	<div class="container-fluid">
    		<div class="container col-sm-6 col-sm-offset-3">
    			<div class="panel panel-default">

    				<div class="panel-heading">
						<h3 class="panel-title">预置菜品</h3>
					</div>

					<div class="panel-body">
						
						<form class="form-horizontal" role="form" action="insetDishPreset.action" method="post">
							<div class="form-group">																	
								<label class="col-sm-2 control-label">菜品名称：</label>
								<div class="col-sm-9">	
									<!-- 添加预置菜品-->
									<input type="text" class="form-control" placeholder="预置菜品名称" name="dishPresetName"> 
								</div>								
							</div>	
							<div class="form-group">
								<div class="col-sm-2 col-sm-offset-5">
									<input type="submit" class="btn btn-primary" value="添加预置菜品">
								</div>
							</div>
						</form>
						
					</div>	
				</div>

				<div class="panel panel-default">

    				<div class="panel-heading">
						<h3 class="panel-title">已有菜品</h3>
					</div>

					<div class="panel-body">
						<!-- 列举所有已录入的预置菜品 --> 
						<table class="table table-striped table-bordered table-hover table-responsive text-center">
							<thead>
						    	<tr>
						   		 	<th style='text-align: center;'>菜品名称</th>
						    	    <th style='text-align: center;'>编辑</th>
						    	</tr>
							</thead>
							<tbody>
								<c:forEach items="${pagehelper.list }" var="item" >
						    		<tr>
						    		    <td style='vertical-align: middle;text-align: center;'>${item.dishPresetName }</td>
						    		    <td style='vertical-align: middle;text-align: center;'>						    		    	
						    		    	<div class="form-group btn-group btn-group-sm">
						    		    		<a href="modifyDishPreset.action?dishPresetID=${item.dishPresetID}" class="btn btn-info">修改</a>
						    		    		<a href="deleteDishPresetById.action?dishPresetID=${item.dishPresetID}" class="btn btn-danger">删除</a>
						    		    	</div>						    		    	
						    		    </td>
						    		</tr>
								</c:forEach>
							</tbody>
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
					</div>
				</div>
				
			</div>
		</div>
  	</body>
</html>
