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
        <link rel="stylesheet" href='http://fonts.googleapis.com/icon?family=Material+Icons' type='text/css'>

        <!-- 日期控件导入 -->
        <script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script>

    </head>  
    <body>
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

<div class="container">
    <div class="mp-pusher" id="mp-pusher">
    <%@ include file="publicjsp/canteennavindex.jsp" %>               
        <div class="scroller" style="background:#f3efe0">
          <div class="scroller-inner">
              <header class="codrops-header" style="background:#7acfa6">
                   <div id="trigger" >
                      <a href="javascript:;" >
                        <i class="material-icons" style="position:absolute;left:10px">menu</i>
                      </a>
                   </div>
                    <h1 class="panel-title">菜品上架</h1>
              </header>
    
                    <div class="content clearfix">
                        <!-- 菜品添加 -->
                        <form role="form" name="dishInsertForm" action="insertDish.action" method="post" enctype="multipart/form-data">
        	                
                            <div class="form-group">
                                <div class="row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">校区</label>
                                <div class="col-xs-8">
        	                        <input type="text" class="form-control" name="campusName" value="${muserItems.campusName }" readonly="readonly">
                                </div>
                                </div>
                                <br>
                                <div class="row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">食堂</label>
                                <div class="col-xs-8">
	       	                        <input type="text" class="form-control" name = "cantName" value="${muserItems.cantName }" readonly="readonly">
                                </div>
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">  
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">档口</label>
                                <div class="col-xs-8">
                                    <!-- 选择菜品所属档口 -->
                                    <select name="dishWndID" class="form-control" onchange="getDish(this.value)">
                                        <option value="">请选择菜品所属档口</option>
                                        <c:forEach items="${windowItemsList }" var="item" >
                                            <option value="${item.wndID }">${item.wndName }</option>
                                        </c:forEach>
                                    </select>
                                </div>    
                            </div>
                            <br> 
                            <div class="row form-group">                               
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品类型</label>
                                <div class="col-xs-8">
                                    <!-- 选择菜品所属类型-->                    
                                    <select name="dishTypeID" class="form-control">
                                        <option value="">请选择菜品所属类型</option>
                                        <c:forEach items="${dishTypeList }" var="item" >
                                            <option value="${item.dishTypeID }">${item.dishTypeName }</option>
                                        </c:forEach>
                                    </select>   
                                </div>                            
                            </div>
                            <br>    
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品名称</label>
                                <div class="col-xs-8">
                                    <!-- 选择菜品  -->
                                    <select name="dishName" class="form-control" disabled="disabled">
                                        <option value="">请选择菜品</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品图片上传</label>
                                <div class="col-xs-8">
                                    <a href="javascript:;" class="file" style="font-size:15px">选择文件
                                    <input type="file" name="dishPhotoFile"/>
                                    </a>
                                </div>
                            </div>
                            <br>    
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品添加日期</label>
                                <div class="col-xs-8">
                                    <input type="text" name ="dishInDate" placeholder="请点击此处选择菜品录入日期" class="Wdate form-control"  onClick="WdatePicker()"> 
                                </div>
                            </div>
                            <br> 
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品价格</label>
                                <div class="col-xs-8">   
                                    <input type="text" class="form-control" placeholder="请在此输入菜品价格" name="dishPrice">
                                </div>
                            </div>
                            <br>    
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品推荐</label>
                                <div class="col-xs-8">
                                    <select name="dishRecmd" class="form-control">
                                        <option value="否" selected="selected">否</option>
                                        <option value="是">是</option>            
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品留样</label>
                                <div class="col-xs-8">
                                    <select name="dishKeep" class="form-control">
                                        <option value="否" selected="selected">否</option>
                                        <option value="是">是</option>            
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品质量</label>
                                <div class="col-xs-8">
                                    <select name="dishQuality" class="form-control">
                                        <option value="优" selected="selected">优</option>
                                        <option value="良">良</option>
                                        <option value="中">中</option>
                                        <option value="差">差</option>
                                    </select>
                                </div>
                            </div>
                            <br> 
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品录入状态</label>
                                <div class="col-xs-8">   
                                    <input type="text" class="form-control" name="dishInState" value="审核通过" readonly="readonly">
                                </div>
                            </div>
                            <br>    
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品销售状态</label>
                                <div class="col-xs-8">
                                    <select name="dishSale" class="form-control">
                                        <option value="在售" selected="selected">在售</option>
                                        <option value="未售">未售</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">菜品销售时间</label>
                                <div class="col-xs-8">
                                    <select name="dishDate" class="form-control">
                                        <option value="早上" selected="selected">早上</option>
                                        <option value="中午">中午</option>
                                        <option value="晚上">晚上</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div align="center">
                                    <input type="submit" class="btn btn-primary" value="添加菜品" onClick="return check(dishInsertForm)">
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