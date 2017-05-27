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
    	
    	<title>评论管理</title>
    	
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
        <script>
        	/* 在校区选择之后得到该校区之下的食堂选择框
        		objValue：校区的ID值
        		windowInsertForm：档口预置表单
        		canteenItemsList：所有食堂信息列表
        		wndCantID：食堂select标签的选择值
        	*/
  	    	function getCanteen(objValue)
	    	{	
	    		var objForm = document.forms["commentMUserInquireForm"];
	    	
        		if(objValue == ""){
        			objForm.wndCantID.disabled = true;
        		}else{  
        			objForm.wndCantID.disabled = false; 
        			objForm.wndCantID.options.length = 0;
        			
        			var optionObj = document.createElement("option");
        			optionObj.text = "请选择档口所属食堂";
	                optionObj.value = 0;
	                objForm.wndCantID.add(optionObj);
	                
        			<c:forEach items="${canteenItemsList }" var="item" >  	
        	 			var cantCampusID = ${item.cantCampusID };
 	     				var optionObj = document.createElement("option");
        	 			if( cantCampusID == Number(objValue)){
	                        optionObj.text = "${item.cantName }";
	                        optionObj.value = "${item.cantID }";
	                        objForm.wndCantID.add(optionObj);
        	 			}  
	    			</c:forEach>
        		}
	    	}
	    	
	    	function getWindow(objValue)
	    	{	
	    		var objForm = document.forms["commentMUserInquireForm"];
	    	
        		if(objValue == ""){
        			objForm.wndID.disabled = true;
        		}else{  
        			objForm.wndID.disabled = false; 
        			objForm.wndID.options.length = 0;       	
	                
        			<c:forEach items="${windowItemsList }" var="item" >  	
        	 			var wndCantID = ${item.wndCantID };
 	     				var optionObj = document.createElement("option");
        	 			if( wndCantID == Number(objValue)){
	                        optionObj.text = "${item.wndName }";
	                        optionObj.value = "${item.wndID }";
	                        objForm.wndID.add(optionObj);
        	 			}  
	    			</c:forEach>
        		}
	    	}
	    	
    
            function check(form){
            	if(form.cantCampusID.value == ""){
            		alert("请先选择档口所在校区！");
            		return false;
            	}
            	if(form.wndCantID.value == ""){
            		alert("请先选择档口所在食堂！");
            		return false;
            	}
            	if(form.wndName.value == ""){
            		alert("请填写档口名称！");
            		form.wndID.focus();
            		return false;
            	}
            } 
  	    </script>
  	    
  	    
    	<div class="container-fluid">	
    		<div class="panel panel-default">			

                <div class="panel-heading">
                    <h3 class="panel-title">预置档口</h3>
                </div>

                <div class="panel-body">
                    <div class="row">
                        <form class="form-horizontal" role="form" name="commentMUserInquireForm" action="commentMUserInquire.action" method="post">
                        	<div class="form-group">                                                                          
                                <label class="col-sm-1 control-label">所属校区</label>
                                <div class="col-sm-2">    
                                    <!-- 选择食堂所属校区 -->
                        	        <select name="cantCampusID" class="form-control" onchange="getCanteen(this.value)">
                        	        	<option value="">请选择食堂所属校区</option>
                        	        	<c:forEach items="${campusList }" var="item" >
                        	        		<option value="${item.campusID }">${item.campusName }</option>
                     	        		</c:forEach>
                        	        </select>
                                </div>                                   
                                                                         
                                <label class="col-sm-1 control-label">所属食堂</label>
                                <div class="col-sm-2">    
                        	        <!-- 选择档口所属食堂 -->
                        		    <select name="wndCantID" class="form-control" disabled="disabled" onchange="getWindow(this.value)">
                        		        <option value="">请选择档口所属食堂</option>
                        	        </select>
                                </div>                                                                         	                        	        
                                <label class="col-sm-1 control-label">档口名称</label>
                                <div class="col-sm-2">    
                        	        <!-- 选择档口 -->
                        		    <select name="wndID" class="form-control" disabled="disabled" >
                        		        <option value="">请选择档口</option>
                        	        </select>
                                </div>  
                                <div class="col-sm-1 control-label">
                        	        <!-- 档口添加按钮 -->
                        	        <input type="submit" class="btn btn-primary" value="查询" onClick="return check(commentMUserInquireForm)">
                                </div>
                            </div>
                        </form>                        	                        
                    </div>    
                </div>            
    			
    			<div class="panel-body">
    				<!-- 显示在一个食堂中的所有菜品 -->
    				<form role="form" name="commentForm" enctype="multipart/form-data">
						<input name="wndID" type="hidden" value="${windowItems.wndID }">
						<div class="row">
	 						<div class="col-sm-2">
						   		${windowItems.cantName}
						   		${windowItems.wndName}
						   	</div>
						   	<div class="col-sm-1">
						   		${windowItems.wndScore}分
						   	</div>
						</div>
						<br>
    					<table class="table table-striped table-bordered table-hover table-responsive text-center">
    						<thead>
    							<tr>
    								<th style='text-align: center;'>评论人</th>
    								<th style='text-align: center;'>评论人头像</th>
    								<th style='text-align: center;'>评论分</th>
    								<th style='text-align: center;'>评论时间</th>
    								<th style='text-align: center;'>评论点赞数</th>
    								<th style='text-align: center;'>评论内容</th>
    								<th style='text-align: center;'>编辑</th>
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
									   	<td style='vertical-align: middle;text-align: center;'>${item.cmtGoodNum}</td>
									   	<td style='vertical-align: middle;text-align: center;'>${item.cmtContent }</td>	
									   	<td style='vertical-align: middle;text-align: center;'><a href="deleteCommentById.action?cmtID=${item.cmtID}&wndID=${item.cmtWndID}">删除</a></td>								 
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
