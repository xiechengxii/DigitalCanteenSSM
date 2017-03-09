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
        
        <title>修改管理员账户</title>
      
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
  	    	function checkRoleID(){
            var objForm = document.forms["muserUpdateForm"];
            <c:if test="${muserItems.roleID == 1 or muserItems.roleID == 2}">
                objForm.muserCampusID.style.display="none";
                objForm.muserCantID.style.display="none";
                document.getElementById("campusLabel").style.display="none";
                document.getElementById("canteenLabel").style.display="none";
            </c:if>
            }
            
            function selectRole(objValue){
                var objForm = document.forms["muserUpdateForm"];
                
                if(objValue == ""){
                    objForm.muserCampusID.disabled = true;
                    objForm.muserCantID.disabled = true;
                }else if(objValue != 3){        
                    <c:forEach items="${campusList }" var="item" >  
                        var optionObj = document.createElement("option");                           
                        optionObj.text = "${item.campusName }";
                        optionObj.value = "${item.campusID }";
                        optionObj.selected = true;
                        objForm.muserCampusID.add(optionObj);              
                    </c:forEach>
                    <c:forEach items="${canteenItemsList }" var="item" > 
                        var optionObj = document.createElement("option"); 
                        optionObj.text = "${item.cantName }";
                        optionObj.value = "${item.cantID }";
                        optionObj.selected = true;
                        objForm.muserCantID.add(optionObj);                            
                    </c:forEach> 
                    objForm.muserCampusID.style.display="none";
                    objForm.muserCantID.style.display="none";
                    document.getElementById("campusLabel").style.display="none";
                    document.getElementById("canteenLabel").style.display="none";

                        
                }
                else{           
                    objForm.muserCampusID.style.display="inline-table";
                    objForm.muserCantID.style.display="inline-table";
                    document.getElementById("campusLabel").style.display="inline-table";
                    document.getElementById("canteenLabel").style.display="inline-table";

                    
                    objForm.muserCampusID.disabled = false;     
                    objForm.muserCampusID.options.length = 0;
                    
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属校区";
                    optionObj.value = "0";
                    objForm.muserCampusID.add(optionObj);
                    
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属食堂";
                    optionObj.value = "0";
                    optionObj.selected = true;
                    objForm.muserCantID.add(optionObj);
                    
                    <c:forEach items="${campusList }" var="item" >      
                        var optionObj = document.createElement("option");                           
                        optionObj.text = "${item.campusName }";
                        optionObj.value = "${item.campusID }";
                        objForm.muserCampusID.add(optionObj);                
                    </c:forEach>
                }
            }
            
            function getCanteen(objValue)
            {   
                var objForm = document.forms["muserUpdateForm"];
            
                if(objValue == ""){
                    objForm.muserCantID.disabled = true;
                }else{                  
                    objForm.muserCantID.disabled = false; 
                    objForm.muserCantID.options.length = 0; 
                    
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属食堂";
                    optionObj.value = "0";
                    objForm.muserCantID.add(optionObj);
                    
                    <c:forEach items="${canteenItemsList }" var="item" >    
                        var cantCampusID = ${item.cantCampusID };                    
                        if( cantCampusID == Number(objValue)){  
                            /* 把var optionObj = document.createElement("option")放在循环外，则只出现一次值 */
                            var optionObj = document.createElement("option");               
                            optionObj.text = "${item.cantName }";
                            optionObj.value = "${item.cantID }";
                            objForm.muserCantID.add(optionObj);
                        }  
                    </c:forEach>
                }
            }
  	    </script>
  	    <script src="././My97DatePicker/WdatePicker.js"></script>
    </head>
    
    <body onLoad="checkRoleID()">
        <%@ include file="publicjsp/backgroundMenu.jsp" %>
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">修改管理员账户</h3>
                    </div>

                    <div class="panel-body">
  	                    <!-- 管理员修改页面 -->
                        <form name = "muserUpdateForm" class="form-horizontal" role="form" action="modifyMUserSave.action" method="post" enctype="multipart/form-data">
                        	
                        	<input name="muserID" type="hidden" value="${muserItems.muserID }">
                        	
                            <!-- 选择管理员所属角色 -->
                            <!-- 遍历所有角色，找相同的角色ID，相同则默认选中，否则添加至下拉框选项 -->
                            <div class="form-group">
                                <!-- 选择要添加的管理员 -->
                                <label class="col-sm-2 control-label">管理员类型</label>
                                <div class="col-sm-9">
                                    <select name="muserRoleID" class="form-control" onchange="selectRole(this.value)">
                                        <c:forEach items="${roleList }" var="item" >
                                              <c:choose>
                                                <c:when test="${muserItems.roleID == item.roleID }">
                                                    <option value="${item.roleID }" selected="selected">${item.roleName }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.roleID }">${item.roleName }</option>
                                                </c:otherwise>
                                            </c:choose>        
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" id="campusLabel">管理员校区</label>
                                <div class="col-sm-9">
                                    <select name="muserCampusID" class="form-control" onchange="getCanteen(this.value)">
                                        <c:forEach items="${campusList }" var="item">
                                              <c:choose>
                                                <c:when test="${muserItems.muserCampusID == item.campusID }">
                                                    <option value="${item.campusID }" selected="selected">${item.campusName }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.campusID }">${item.campusName }</option>
                                                </c:otherwise>
                                            </c:choose>        
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
   	                    	<div class="form-group">
                                <label class="col-sm-2 control-label" id="canteenLabel">管理员食堂</label>
                                <div class="col-sm-9">
                                    <select name="muserCantID" class="form-control">
                                        <c:forEach items="${canteenItemsList }" var="item" >
                                              <c:if test="${muserItems.muserCampusID == item.cantCampusID }">
                                                <c:choose>
                                                    <c:when test="${muserItems.muserCantID == item.cantID }">
                                                        <option value="${item.cantID }" selected="selected">${item.cantName }</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${item.cantID }">${item.cantName }</option>
                                                    </c:otherwise>
                                                </c:choose>  
                                              </c:if>       
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
	                    	<div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员名字" name="muserName" value="${muserItems.muserName }">
                                </div>
                            </div>
	                    	<div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员密码" name="muserPwd" value="${muserItems.muserPwd }">
                                </div>
                            </div>
	                    	<div class="form-group">
                                <label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员电话" name="muserTel" value="${muserItems.muserTel }">
                                </div>
                            </div>
	                    	<div class="form-group">
                                <label class="col-sm-2 control-label">照片</label>
                                <div class="col-sm-9">
                                    <c:if test="${muserItems.muserPhoto != null }">
                                        <img name="muserImageId" src="/upload/pic/${muserItems.muserPhoto }" height="80" width="80"/>
                                        <br/>
                                    </c:if>
                                    <input type="file" name="muserPhotoFile" />
                                </div>                            
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员Email" name="muserEmail" value="${muserItems.muserEmail }">
                                </div>
                            </div>
   	                        <div class="form-group">
                                <label class="col-sm-2 control-label">注册日期</label>
                                <div class="col-sm-9">
                                    <fmt:formatDate value="${muserItems.muserRegDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/> 
                                    <input type="text" class="form-control" name="muserRegDate" value="${theFormattedDate}" readonly=true> 
                                </div>
                            </div>
   	                    	<div class="form-group">
                                <div class="col-sm-2 col-sm-offset-5">
                                    <!-- 菜品添加按钮 -->
                                    <input type="submit" class="btn btn-primary" value="保存">
                                </div>
                            </div>    
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
