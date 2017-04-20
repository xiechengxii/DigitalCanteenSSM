<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
    <head>
        <base href="<%=basePath%>">
        <title>修改录入表</title>
    	
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

        <!-- jQuery支撑 -->
        <script src="js/jquery.form.js"></script>
        <script src="js/custom.jquery.form.js"></script>
        <script src="js/jquery.validate.js"></script>

    	<script>	
    	
    		function modifyRecordDetailDishSave() {
    		    document.importDishForm.action="modifyRecordDetailDishSave.action";
            	document.importDishForm.submit(); 
    		}
    			
    		function checkBoxSelect(dishID){
    			var checkbox = document.getElementById(dishID);	
    			checkbox.checked=true;
    		}

            var checkflag=false;
            function getAllDishSelect(name){
                var allvalue = document.getElementsByName(name);
                
                if(checkflag==false){
                    for (var i = 0; i < allvalue.length; i++) {        
                        if ((allvalue[i].type == "checkbox"))             
                        allvalue[i].checked = true;                            
                    }  
                    checkflag=true;
                }else{
                    for (var i = 0; i < allvalue.length; i++) {        
                        if ((allvalue[i].type == "checkbox"))             
                        allvalue[i].checked = false;                           
                    }  
                    checkflag=false;
                }
            }

            //设置时间档下拉框默认显示
            function myinitiation() {       
                var dishDate = document.getElementById("dishDate");
                var dishDateVal=$("#dishdate").val();

                for(i = 0; i<=dishDate.length; i++){
                     var v = dishDate.options[i].value;
                    if(dishDate.options[i].value == dishDateVal){
                        dishDate.options[i].selected = true;
                    }
                }   
            }
    	</script>
    </head>
  
    <body onload="myinitiation()">
        <%@ include file="publicjsp/canteenMenu.jsp" %>
        <div class="container-fluid">	
    		<div class="panel panel-default">
    			<div class="panel panel-heading">
    				<div class="row">
 						<div class="col-sm-1">
					   		<label>所属校区：</label>${muserItems.campusName}
					   	</div>
					   	<div class="col-sm-1">
					   		<label>所属食堂：</label>${muserItems.cantName}
					   	</div>
					   	<div class="col-sm-1">
					   		<label>管理员：</label>${muserItems.muserName}
					   	</div>
					</div>
    			</div>
    			<div class="panel-body">
    	            <!-- 所有菜品显示列表 -->
                    <form role="form" name="importDishForm" id="importDishForm" method="post" enctype="multipart/form-data" >
                    	<input type="hidden" name = "recordID" value="${record.recordID}">
                    	<table class="table table-striped table-bordered table-hover table-responsive text-center">
                    		<thead>
                    			<tr>
                    				<th style='text-align: center;'>
                                        <input type="checkbox" id="selectAll" name="selectAll" onclick="getAllDishSelect('dishIDList')">
                                    </th>
                    				<th style='text-align: center;'>校区名称</th>
                    				<th style='text-align: center;'>食堂名称</th>
                    				<th style='text-align: center;'>档口名称</th>
                    				<th style='text-align: center;'>菜品类型</th>
                    				<th style='text-align: center;'>菜品名称</th>
                    				<th style='text-align: center;'>菜品图片</th>
                    				<th style='text-align: center;'>菜品价格</th>
                    				<th style='text-align: center;'>菜品销售时间</th>
                    				<th style='text-align: center;'>菜品销售状态</th>			
                    				<th style='text-align: center;'>菜品录入日期</th>
                    				<th style='text-align: center;'>菜品录入状态</th>
                    				<th style='text-align: center;'>菜品推荐</th>
                    				<th style='text-align: center;'>菜品留样</th>
                    				<th style='text-align: center;'>菜品合格</th> 			
                    			</tr>
                    		</thead>
                    		<tbody>
    	            		    <!-- dishDetailList -->
    	            		    <c:forEach items="${dishItemsList }" var="item" varStatus="status">
    	                	    	<c:choose>
    	            		        	<c:when test="${item.dishInState == '待审核'}">
    	            		        	</c:when>
    	            		    		<c:otherwise>
    	            		    			<tr>
    	            		    				<td style='vertical-align: middle;text-align: center;'>
    	            		    					<input type="checkbox" name="dishIDList" id="${item.dishID }" value="${item.dishID }" />
    	            		    				</td>
    	            		    				<c:choose >
    	            		    					<c:when test="${empty dishDetailList}"></c:when>
    	            		    					<c:otherwise>
    	            		    						<c:forEach items="${dishDetailList }" var="itemInRecord">
    	            		    							<c:choose>
    	            		    								<c:when test="${itemInRecord.detailDishID == item.dishID }">
    	            		    									<script> checkBoxSelect("${item.dishID}");</script>		
    	            		    								</c:when>
    	            		    							</c:choose>
    	            		    						</c:forEach>
    	            		    					</c:otherwise>
    	            		    				</c:choose>
    	            		    			 	<td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>
    	            		    				   	<c:if test="${item.dishPhoto != null }">
    	            		       						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="120"/>
    	            		       					</c:if>
    	            	   	    				</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishInState }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>
    	            		    			   	<td style='vertical-align: middle;text-align: center;'>${item.dishQuality }</td>	
    	            		    			</tr>
    	            		    		</c:otherwise>
    	            		    	</c:choose>
    	            		    </c:forEach>
    	            		</tbody>
                    	</table>
                    	<div class="form-group">
                    		<input type="button" class="btn btn-primary" value="保存" onClick=modifyRecordDetailDishSave() > 
                    	</div>
                    </form>
                </div>
            </div>
        </div>
	</body>
</html>
