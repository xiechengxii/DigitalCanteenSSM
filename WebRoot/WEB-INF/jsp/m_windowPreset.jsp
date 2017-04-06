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
    </head>   
    <body>
    <div class="container">
    <div class="mp-pusher" id="mp-pusher">
        <%@ include file="publicjsp/index.jsp" %>               
        <div class="scroller" style="background:#EEEEEE">
            <div class="scroller-inner">
                <header class="codrops-header">
                    <div class="row">
                        <div id="trigger" class="burger-container">
                            <span class="burger-bun-top"></span>
                            <span class="burger-filling"></span>
                            <span class="burger-bun-bot"></span>
                        </div>         
                        <h1>预置档口</h1>
                    </div> 
                </header>

                <div class="content clearfix" >
                    <form name = "windowInsertForm" action="insertWindow.action" method="post" >
    	        <!-- 选择食堂所属校区 -->
                        <div class=" newcustom" style="margin-top:77px" > 
                            <div align="center" class="col-xs-12">
                                <select name="cantCampusID" onchange="getCanteen(this.value)" data-toggle="select" class="form-control select select-primary mrs mbm" >
                                    <option value="">请选择食堂所属校区</option>
                                    <c:forEach items="${campusList }" var="item" >
                                        <option value="${item.campusID }">${item.campusName }</option>
                                    </c:forEach>
                                </select>
                            </div>
       		<!-- 选择档口所属食堂 -->
                            <div align="center" class="col-xs-12">
                   		        <select name="wndCantID" disabled="disabled" data-toggle="select" class="form-control select select-primary mrs mbm">
                   			        <option value="">请选择档口所属食堂</option>
                   		        </select>
                            </div>
       		<!-- 输入档口名称 -->
                            <div class="col-xs-6">
                                <input type="text" placeholder="请输入预置档口名称"   name="wndName" class="form-control input-sm">           
                            </div>
                            <div class="col-xs-6">
                                <input type="text" placeholder="请输入档口位置"       name="wndAddr" class="form-control input-sm">
                            </div>
                            <div class="col-xs-6">
                                <input type="text" placeholder="请输入档口价格范围"   name="wndPriceRange" class="form-control input-sm">
                            </div>
                            <div class="col-xs-6">
                                <input type="text" placeholder="请输入档口营业时间段" name="wndSaleHours" class="form-control input-sm">
                            </div>
                            <div class="col-xs-6">
                                <input type="text" placeholder="请输入档口支付方式"   name="wndPayment" class="form-control input-sm">
                            </div>
                            <div class="col-xs-6">
                                <input type="text" placeholder="请输入档口描述"       name="wndDescription" class="form-control input-sm">
                            </div>
                            <div align="center" class="col-xs-12">
                                <input type="text" placeholder="请输入档口备注"       name="wndNote" class="form-control input-sm">
                            </div>
                        
      	    <!-- 档口添加按钮 -->
          	                <div align="center" style="margin-top:6px">
                                <input  type="submit" value="添加档口" onClick="return check(windowInsertForm)" class="btn btn-primary btn-wide" data-role="none">
                            </div>
                        </div>
                <!-- 列举已录入的档口 -->
                        <div class="newcustom" style="padding: 1em 0.6em">
        	                <table  class="table table-striped table-bordered table-condensed">
                                <thead>
                		            <tr style="background:#29C192;text-align:center;color:white;font-size:15px">
                		           	 	<td>校区名称</td>
                	               	    <td>食堂名称</td>
                	               	    <td>档口名称</td>
                		                <td colspan="2">编辑</td>
                		            </tr>
                                </thead>
                        
            			        <c:forEach items="${pagehelper.list }" var="item" >
            			       	    <tr align="center" style="color:black;font-size:15px">
                			       	 	<td >${item.campusName }</td>
                			       	    <td>${item.cantName }</td>
                			       	    <td>${item.wndName }</td>
                			       	   	<!-- wndID=${item.wndID}& -->
                			       	    <td><a href="modifyWindow.action?wndID=${item.wndID}&cantCampusID=${item.cantCampusID}">修改</a></td>
                			       	    <td><a href="deleteWindowById.action?wndID=${item.wndID}">删除</a></td>
            			       	    </tr>
            			        </c:forEach>
        		            </table>
                            <div>
                                <div class="message">
                                    <p class="text-center" style="color:#888">
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
