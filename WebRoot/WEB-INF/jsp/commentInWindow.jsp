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
    	
    	<title>档口评论</title>
    	
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
    	<div class="container-fluid">	
    		<div class="panel panel-default">

    			<div class="panel-heading">
    				<div class="row">
 						<div class="col-sm-2">
					   		${windowItems.cantName}
					   		${windowItems.wndName}
					   	</div>
					   	<div class="col-sm-1">
					   		${windowItems.wndScore}分
					   	</div>
					   	<div class="col-sm-1">
					   		<a href="addCommentInWindow.action?wndID=${windowItems.wndID}">我要写</a>
					   	</div>
					</div>
    			</div>

    			<div class="panel-body">
    				<!-- 显示在一个食堂中的所有菜品 -->
    				<form role="form" name="commentForm" enctype="multipart/form-data">
						<input name="wndID" type="hidden" value="${windowItems.wndID }">

    					<table class="table table-striped table-bordered table-hover table-responsive text-center">
    						<thead>
    							<tr>
    								<th style='text-align: center;'>评论人</th>
    								<th style='text-align: center;'>评论人头像</th>
    								<th style='text-align: center;'>评论分</th>
    								<th style='text-align: center;'>评论时间</th>
    								<th style='text-align: center;'>评论点赞数</th>
    								<th style='text-align: center;'>评论内容</th>
    							</tr>
    						</thead>
    						
    						<tbody>
    							<c:forEach items="${commentItemsList }" var="item" >					    			 
									<tr>
									 	<td style='vertical-align: middle;text-align: center;'>${item.userName }</td>
									 	<td style='vertical-align: middle;text-align: center;'>
										   	<c:if test="${item.userPhoto != null }">
						   						<img src="/upload/pic/${item.userPhoto }" class="center-block" height="100" width="120"/>
						   					</c:if>
				   						</td>
									   	<td style='vertical-align: middle;text-align: center;'>${item.cmtScore }</td>
									   	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.cmtDate}" pattern="yyyy-MM-dd" /></td> 
									   	<td style='vertical-align: middle;text-align: center;'><a href="updateCmtGoodNum.action?cmtID=${item.cmtID}">${item.cmtGoodNum}</a></td>
									   	<td style='vertical-align: middle;text-align: center;'>${item.cmtContent }</td>									 
									</tr>
								</c:forEach>
								
							</tbody>
    					</table>
    				</form>
    			</div>
    		</div>
    	</div>
    </body>
</html>
