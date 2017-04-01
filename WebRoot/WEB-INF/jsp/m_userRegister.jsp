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
    	<title>用户注册</title>
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/component.css" />
    </head>
  
    <body>
    	<script>
    		/* 在校区选择之后得到该校区之下的食堂选择框
        		objValue：校区的ID值
        		registerForm：档口预置表单
        		canteenItemsList：所有食堂信息列表
        		userCantID：食堂select标签的选择值
        	*/
  	    	function getCanteen(objValue)
	    	{	
	    		var objForm = document.forms["registerForm"];
	    	
        		if(objValue == ""){
        			objForm.userCantID.disabled = true;
        		}else{  
        			objForm.userCantID.disabled = false; 
        			objForm.userCantID.options.length = 0;
        			
        			<c:forEach items="${canteenItemsList }" var="item" >  	
        	 			var cantCampusID = ${item.cantCampusID };
 	     				var optionObj = document.createElement("option");
        	 			if( cantCampusID == Number(objValue)){
	                        optionObj.text = "${item.cantName }";
	                        optionObj.value = "${item.cantID }";
	                        objForm.userCantID.add(optionObj);
        	 			}  
	    			</c:forEach>
        		}
	    	}

	    	function checkForm(form){	    		
	    		if(form.userName.value == "" ){
	    			alert("用户名不能为空!");
	    			return false;
	    		}else if(form.userPwd.value == ""){
	    			alert("密码不能为空！");
	    			return false;
	    		}else if(form.userCampusID.value == ""){
	    			alert("请选择你所在的校区！");
	    			return false;
	    		}else if(form.userCantID.value == ""){
	    			alert("请设定首选食堂！");
	    			return false;
	    		}else if(form.userPwd.value != form.userPwdVerify.value){
	    			alert("两次输入的密码不一致!");
	    			return false;
	    		}
	    	}
    	</script>
       
    <div class="content clearfix" style="margin-top:20%">
    	<form name="registerForm" method="post" enctype="multipart/form-data" action="userRegister.action" role="form">
            <div class="form-group row">
                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">用户名：</label>
                <div class="col-xs-6">
    		      <input type="text" class="form-control" name="userName" placeholder="请输入用户名">
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">用户密码：</label>
                <div class="col-xs-6">
    		      <input type="password" class="form-control" name="userPwd" placeholder="请输入密码">
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">密码确认：</label>
                <div class="col-xs-6">
    		      <input type="password" class="form-control" name="userPwdVerify" placeholder="请确认密码">
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">头像：</label>
                <div class="col-xs-6">
                  <a href="javascript:;" class="file" style="font-size:15px;">选择头像
    		          <input type="file" name="userPhotoFile">
                  </a>
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">校区：</label>
                <div class="col-xs-6">
    		      <select name="userCampusID" class="form-control select select-primary mrs mbm" data-toggle="select" onchange="getCanteen(this.value)">
    		      	<option value="">请选择所在校区</option>
    		      	<c:forEach items="${campusList }" var="item">
    		      		<option value="${item.campusID }">${item.campusName }</option>
    		      	</c:forEach>
    		      </select>
                </div>
            </div>
    		<br>
            <div class="form-group row">
    		  <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:center; line-height:34px;">食堂：</label>
                <div class="col-xs-6">
    		      <select name="userCantID" disabled="disabled" class="form-control select select-primary mrs mbm" data-toggle="select">
    		      	<option value="">请设定首选食堂</option>
    		      </select>
                </div>
            </div>
    		<br>
            <br>
            <div align="center">
    		  <input type="submit" value="注册" onclick="return checkForm(registerForm)" class="btn btn-block" style="width:80%;background:#72dbc8;color:#fff;font-size:18px">
            </div>
    	</form>
    </div>
        
    </body>
</html>
