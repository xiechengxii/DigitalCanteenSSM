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
        
        <title>修改菜品信息</title>
      
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

  	    <script>   	
            function check(form){
            	if(form.cantCampusID.value == ""){
            		alert("请先选择菜品所在校区！");
            		return false;
            	}
            	if(form.wndCantID.value == ""){
            		alert("请先选择菜品所在食堂！");
            		return false;
            	}
            	if(form.dishWndID.value == ""){
            		alert("请先选择菜品所在档口！");
            		return false;
            	}
            	if(form.wndName.value == ""){
            		alert("请填写菜品名称！");
            		form.wndName.focus();
            		return false;
            	}
            }
    
  	    </script>
  	    <script src="././My97DatePicker/WdatePicker.js"></script>
    </head>
    
    <body>
        <%@ include file="publicjsp/canteenMenu.jsp" %>
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">修改菜品</h3>
                    </div>

                    <div class="panel-body">
  	                    <!-- 菜品修改页面 -->
                        <form class="form-horizontal" role="form" name = "dishUpdateForm" action="modifyDishSave.action" method="post" enctype="multipart/form-data">
                        	<input name="dishID" type="hidden" value="${dishItems.dishID }">
   	                    	<!-- 选择菜品所属档口 -->
   	                    	<!-- 遍历所有窗口，找相同的食堂ID，结果为真，则比较传进来的档口ID与菜品所属档口，相同则默认选中，否则添加至下拉框选项 -->
	                    	<div class="form-group">  
                                <label class="col-sm-2 control-label">档口：</label> 
                                <div class="col-sm-9">
	                    	        <select name="dishWndID" class="form-control">
	                    	        	<c:forEach items="${windowItemsList }" var="item" >
	                    	        		<c:choose>
	                    	            		<c:when test="${dishItems.dishWndID == item.wndID }">
	                    	            			<option value="${item.wndID }" selected="selected">${item.wndName }</option>
	                    	            		</c:when>
	                    	            		<c:otherwise>
	                    	        		        <option value="${item.wndID }">${item.wndName }</option>
	                    	        		    </c:otherwise>
	                    	            	</c:choose>	       
	                    	        	</c:forEach>
   	                    	        </select>
                                </div>
                            </div>
                            <div class="form-group"> 
    	                    	<!-- 选择菜品类型  -->
                                <label class="col-sm-2 control-label">菜品类型：</label>
	                    	    <div class="col-sm-9">
	                    	        <select name="dishTypeID" class="form-control">		
	                    	        	<c:forEach items="${dishTypeList }" var="item" >
	                    	        		<c:choose>
	                    	        			<c:when test="${dishItems.dishTypeID==item.dishTypeID}">
	                    	        				<option value="${dishItems.dishTypeID }" selected="selected">${dishItems.dishTypeName }</option>
	                    	        			</c:when>
	                    	        			<c:otherwise>
	                    	        				<option value="${item.dishTypeID }">${item.dishTypeName }</option>
	                    	        			</c:otherwise>
	                    	        		</c:choose>				
	                    	        	</c:forEach>
	                    	        </select>
                                </div>
                            </div>
                            <div class="form-group"> 
                                <label class="col-sm-2 control-label">菜品：</label>
	                    	    <!-- 选择菜品  -->
   	                    	    <div class="col-sm-9">    
   	                    	        <select name="dishName" class="form-control">
  	                    	        	<c:forEach items="${dishPresetList }" var="item" >
	                       	        		<c:choose>
	                    	        		    <c:when test="${dishItems.dishName == item.dishPresetName }">
	                    	            			<option value="${item.dishPresetName }" selected="selected">${item.dishPresetName }</option>
	                    	            		</c:when>
	                    	            		<c:otherwise>
	                    	        		        <option value="${item.dishPresetName }">${item.dishPresetName }</option>
	                    	        		    </c:otherwise>    
	                    	        		</c:choose>
	                    	        	</c:forEach>
   	                    	        </select>
                                </div>
                            </div>
   	                    	<div class="form-group">
                                <label class="col-sm-2 control-label">菜品图片：</label>
                                <div class="col-sm-9">
                                    <c:if test="${dishItems.dishPhoto != null }">
                                        <img src="/upload/pic/${dishItems.dishPhoto }" height="100" width="120"/>
                                    </c:if>
                                    <br><br>
                                    <input type="file" name="dishPhotoFile"/>
                                </div>
                            </div>
   	                    	<div class="form-group">
                                <label class="col-sm-2 control-label">菜品价格：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="请在此输入菜品价格" name="dishPrice" value="${dishItems.dishPrice }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品日期：</label>
                                <div class="col-sm-9">
                                    <!-- 日期控件调用，用在填入菜品的日期 -->
                                    <fmt:formatDate value="${dishItems.dishInDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/>
                                    <input type="text" name ="dishInDate" value="${theFormattedDate}" placeholder="请在此输入菜品录入日期" class="Wdate form-control"  onClick="WdatePicker()"> 
                                </div>
                            </div>        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品推荐:</label>    
                                <div class="col-sm-9">
                                    <select name="dishRecmd" class="form-control">
                                        <c:choose>
                                            <c:when test="${dishItems.dishRecmd == '是' }">
                                                <option value="是" selected="selected">是</option>
                                                <option value="否">否</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="否" selected="selected"}>否</option>
                                                <option value="是" >是</option>
                                            </c:otherwise>    
                                        </c:choose>
                                    </select>
                                </div>    
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品留样:</label>  
                                <div class="col-sm-9">
                                    <select name="dishKeep" class="form-control">
                                        <c:choose>
                                            <c:when test="${dishItems.dishKeep == '是' }">
                                                <option value="是" selected="selected">是</option>
                                                <option value="否">否</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="否" selected="selected"}>否</option>
                                                <option value="是" >是</option>
                                            </c:otherwise>    
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">  
                                <label class="col-sm-2 control-label">菜品质量：</label>
                                <div class="col-sm-9">
                                    <select name="dishQuality" class="form-control">
                                        <c:choose>
                                            <c:when test="${dishItems.dishQuality == '优' }">
                                                <option value="优" selected="selected">优</option>
                                                <option value="良">良</option>
                                                <option value="中">中</option>
                                                <option value="差">差</option>
                                            </c:when>
                                            <c:when test="${dishItems.dishQuality == '良' }">
                                                <option value="优">优</option>
                                                <option value="良" selected="selected">良</option>
                                                <option value="中">中</option>
                                                <option value="差">差</option>
                                            </c:when>
                                            <c:when test="${dishItems.dishQuality == '中' }">
                                                <option value="优">优</option>
                                                <option value="良">良</option>
                                                <option value="中" selected="selected">中</option>
                                                <option value="差">差</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="优">优</option>
                                                <option value="良">良</option>
                                                <option value="中">中</option>
                                                <option value="差" selected="selected">差</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>    
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品录入状态：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="dishInState" value="${dishItems.dishInState }" readonly="readonly">
                                </div>
                            </div>        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品销售状态：</label>
                                <div class="col-sm-9">
                                    <select name="dishSale" class="form-control">
                                        <c:choose>
                                            <c:when test="${dishItems.dishSale ==  '在售' }">
                                                <option value="在售" selected="selected">在售</option>
                                                <option value="未售">未售</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="在售">在售</option>
                                                <option value="未售" selected="selected">未售</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">       
                                <label class="col-sm-2 control-label">菜品销售时间：</label> 
                                <div class="col-sm-9">
                                    <select name="dishDate" class="form-control">
                                        <c:choose>
                                            <c:when test="${dishItems.dishDate == '早上'}">
                                                <option value="早上" selected="selected">早上</option>
                                                <option value="中午">中午</option>
                                                <option value="晚上">晚上</option>
                                            </c:when>
                                            <c:when test="${dishItems.dishDate == '中午'}">
                                                <option value="早上">早上</option>
                                                <option value="中午" selected="selected">中午</option>
                                                <option value="晚上">晚上</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="早上">早上</option>
                                                <option value="中午">中午</option>
                                                <option value="晚上" selected="selected">晚上</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select> 
                                </div> 
                            </div>
                            <div class="form-group">  
                                <div class="col-sm-2 col-sm-offset-5"> 
                        	        <!-- 菜品保存按钮 -->
                        	        <input type="submit" class="btn btn-primary" value="保存" onClick="return check(dishUpdateForm)">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
