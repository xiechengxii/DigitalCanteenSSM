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
        
        <title>预置档口信息</title>
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
	    		var objForm = document.forms["windowInsertForm"];
	    	
        		if(objValue == ""){
        			objForm.wndCantID.disabled = true;
        		}else{  
        			objForm.wndCantID.disabled = false; 
        			objForm.wndCantID.options.length = 0;
        			
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
            		form.wndName.focus();
            		return false;
            	}
            } 
  	    </script>
  	    
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">预置档口</h3>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <form class="form-horizontal" role="form" name="windowInsertForm" action="insertWindow.action" method="post">
                            	<div class="form-group">                                                                          
                                    <label class="col-sm-2 control-label">所属校区</label>
                                    <div class="col-sm-9">    
                                        <!-- 选择食堂所属校区 -->
   	                        	        <select name="cantCampusID" class="form-control" onchange="getCanteen(this.value)">
   	                        	        	<option value="">请选择食堂所属校区</option>
   	                        	        	<c:forEach items="${campusList }" var="item" >
   	                        	        		<option value="${item.campusID }">${item.campusName }</option>
	                        	        	</c:forEach>
   	                        	        </select>
                                    </div>                                   
                                </div>
                                <div class="form-group">                                                                           
                                    <label class="col-sm-2 control-label">所属食堂</label>
                                    <div class="col-sm-9">    
   	                        	        <!-- 选择档口所属食堂 -->
   	                        		    <select name="wndCantID" class="form-control" disabled="disabled">
   	                        		        <option value="">请选择档口所属食堂</option>
   	                        	        </select>
                                    </div>                                    
                                </div>
                                <div class="form-group">                                       	                        	        
                                    <label class="col-sm-2 control-label">档口名称</label>
                                    <div class="col-sm-9">    
                            	        <input type="text" class="form-control" name="wndName">
                                    </div>
                                </div>    
                                <div class="form-group">       
                                    <label class="col-sm-2 control-label">档口位置</label>
                                    <div class="col-sm-9 ">    
                                        <input type="text" class="form-control" name="wndAddr">
                                    </div>                                    
                                </div>
                                <div class="form-group">                                                                         
                                    <label class="col-sm-2 control-label">价格范围</label>
                                    <div class="col-sm-9">    
                                        <input type="text" class="form-control" name="wndPriceRange">
                                    </div>z
                                </div>    
                                <div class="form-group">                                          
                                    <label class="col-sm-2 control-label">营业时间段</label>
                                    <div class="col-sm-9">    
                                        <input type="text" class="form-control" name="wndSaleHours">
                                    </div>                                    
                                </div>
                                <div class="form-group">                                    
                                    <label class="col-sm-2 control-label">支付方式</label>
                                    <div class="col-sm-9">    
                                        <input type="text" class="form-control" name="wndPayment">
                                    </div>
                                </div>    
                                <div class="form-group">        
                                    <label class="col-sm-2 control-label">档口描述</label>
                                    <div class="col-sm-9">    
                                        <input type="text" class="form-control" name="wndDescription">
                                    </div>                                    
                                </div>
                                <div class="form-group">                                                                           
                                    <label class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-9">    
                                        <input type="text" class="form-control" name="wndNote">
                                    </div>                                    
                                </div>                                
                                <div class="form-group">    
                                    <div class="col-sm-2 col-sm-offset-5">
                            	        <!-- 档口添加按钮 -->
                            	        <input type="submit" class="btn btn-primary" value="添加档口" onClick="return check(windowInsertForm)">
                                    </div>
                                </div>
                            </form>                        	                        
                        </div>    
                    </div>
                </div>

                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">已有档口</h3>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover table-responsive text-center">
                            <thead>
                                <tr>
                                    <th style='text-align: center;'>校区名称</th>
                                    <th style='text-align: center;'>食堂名称</th>
                                    <th style='text-align: center;'>档口名称</th>
                                    <th style='text-align: center;'>档口位置</th>
                                    <th style='text-align: center;'>价格范围</th>
                                    <th style='text-align: center;'>营业时间段</th>
                                    <th style='text-align: center;'>支付方式</th>
                                    <th style='text-align: center;'>档口描述</th>
                                    <th style='text-align: center;'>备注</th>
                                    <th style='text-align: center;'>操作</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${pagehelper.list }" var="item" >
                                    <tr>
                                        <td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndAddr}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndPriceRange}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndSaleHours}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndPayment}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndDescription}</td>
                                        <td style='vertical-align: middle;text-align: center;'>${item.wndNote}</td>
                                        <!-- wndID=${item.wndID}& -->
                                        <td style='vertical-align: middle;text-align: center;'>
                                            <div class="form-group btn-group btn-group-sm">
                                                <a href="modifyWindow.action?wndID=${item.wndID}&cantCampusID=${item.cantCampusID}" class="btn btn-info">修改</a>
                                                <a href="deleteWindowById.action?wndID=${item.wndID}" class="btn btn-danger">删除</a>
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
                                            <a href="findAllWindows.action?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                        </li>
                                    </c:if>

                                    <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    

                                        <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                            <li class="active">
                                                <a href="findAllWindows.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                            </li>
                                        </c:if>

                                        <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                            <li>
                                                <a href="findAllWindows.action?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                            </li>
                                        </c:if>

                                    </c:forEach>

                                    <c:if test="${!pagehelper.isLastPage}">
                                        <li>
                                            <a href="findAllWindows.action?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
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
