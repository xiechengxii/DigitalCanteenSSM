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
        
        <title>菜品上架</title>

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

        <!-- 日期控件导入 -->
        <script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script>

    </head>
  
    <body>
        <%@ include file="publicjsp/canteenMenu.jsp" %>
        <script>
        	/* 在档口选择之后得到该档口之下的菜品选择框
        		objValue：档口的ID值
        		dishUpdateForm：菜品更新表单
        		dishPresetList：所有菜品信息列表
        		dishName：菜品select标签的选择值
        	*/
        	function getDish(objValue){
        		var objForm = document.forms["dishInsertForm"];
        		if(objValue == ""){
        			objForm.dishName.disabled = true;
        		}else{   			 	
        			objForm.dishName.disabled = false; 
        			objForm.dishName.options.length = 0;
        			
	    		var optionObj = document.createElement("option");
        			optionObj.text = "请选择菜品";
                    optionObj.value = "0";
                    objForm.dishName.add(optionObj);
                    
        			<c:forEach items="${dishPresetList }" var="item" >
 	     				var optionObj = document.createElement("option");
                        optionObj.text = "${item.dishPresetName }";
                        optionObj.value = "${item.dishPresetName }";
                        objForm.dishName.add(optionObj);
	    			</c:forEach>
        		}
        	}
	    	
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
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">
    
                    <div class="panel-heading">
                        <h3 class="panel-title">菜品上架</h3>
                    </div>
    
                    <div class="panel-body">
                        <!-- 菜品添加 -->
                        <form class="form-horizontal" role="form" name="dishInsertForm" action="insertDish.action" method="post">        	                
                            <div class="form-group">
                                <label class="col-sm-2 control-label">校区</label>
                                <div class="col-sm-9">
        	                        <input type="text" class="form-control" name="campusName" value="${muserItems.campusName }" readonly="readonly">
                                </div>
                            </div>        
                            <div class="form-group">
                                <label class="col-sm-2 control-label">食堂</label>
                                <div class="col-sm-9">
	       	                        <input type="text" class="form-control" name = "cantName" value="${muserItems.cantName }" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-group">  
                                <label class="col-sm-2 control-label">档口</label>
                                <div class="col-sm-9">
                                    <!-- 选择菜品所属档口 -->
                                    <select name="dishWndID" class="form-control" onchange="getDish(this.value)">
                                        <option value="">请选择菜品所属档口</option>
                                        <c:forEach items="${windowItemsList }" var="item" >
                                            <option value="${item.wndID }">${item.wndName }</option>
                                        </c:forEach>
                                    </select>
                                </div>    
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品类型</label>
                                <div class="col-sm-9">
                                    <!-- 选择菜品所属类型-->                    
                                    <select name="dishTypeID" class="form-control">
                                        <option value="">请选择菜品所属类型</option>
                                        <c:forEach items="${dishTypeList }" var="item" >
                                            <option value="${item.dishTypeID }">${item.dishTypeName }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品名称</label>
                                <div class="col-sm-9">
                                    <!-- 选择菜品  -->
                                    <select name="dishName" class="form-control" disabled="disabled">
                                        <option value="">请选择菜品</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品添加日期</label>
                                <div class="col-sm-9">
                                    <input type="text" name ="dishInDate" placeholder="请点击此处选择菜品录入日期" class="Wdate form-control"  onClick="WdatePicker()"> 
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品价格</label>
                                <div class="col-sm-9">    
                                    <input type="text" class="form-control" placeholder="请在此输入菜品价格" name="dishPrice">
                                </div>
                            </div>    
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品推荐</label>
                                <div class="col-sm-9">
                                    <select name="dishRecmd" class="form-control">
                                        <option value="否" selected="selected">否</option>
                                        <option value="是">是</option>            
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品留样</label>
                                <div class="col-sm-9">
                                    <select name="dishKeep" class="form-control">
                                        <option value="否" selected="selected">否</option>
                                        <option value="是">是</option>            
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品销售状态</label>
                                <div class="col-sm-9"> 
                                    <select name="dishSale" class="form-control">
                                        <option value="在售" selected="selected">在售</option>
                                        <option value="下架">下架</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜品销售时间</label>
                                <div class="col-sm-9">
                                    <select name="dishDate" class="form-control">
                                        <option value="早餐" selected="selected">早餐</option>
                                        <option value="正餐">正餐</option>
                                        <option value="全天供应">全天供应</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 col-sm-offset-5">
                                    <input type="submit" class="btn btn-primary" value="添加菜品" onClick="return check(dishInsertForm)">
                                </div>
                            </div>                                   	        
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
