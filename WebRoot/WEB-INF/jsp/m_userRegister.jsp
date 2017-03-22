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
    	
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

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

    	<form name="registerForm" method="post" enctype="multipart/form-data" action="userRegister.action">
    		<label>用户名：</label>
    		<input type="text" name="userName" >
    		<br>
    		<label>用户密码：</label>
    		<input type="password" name="userPwd">
    		<br>
    		<label>密码确认：</label>
    		<input type="password" name="userPwdVerify">
    		<br>
    		<label>头像：</label>
    		<input type="file" name="userPhotoFile">
    		<br>
    		<label>校区：</label>
    		<select name="userCampusID" onchange="getCanteen(this.value)">
    			<option value="">请选择你所在的校区</option>
    			<c:forEach items="${campusList }" var="item">
    				<option value="${item.campusID }">${item.campusName }</option>
    			</c:forEach>
    		</select>
    		<br>
    		<label>食堂：</label>
    		<select name="userCantID" disabled="disabled">
    			<option value="">请设定首选食堂</option>
    		</select>
    		<br>
    		<input type="submit" value="注册" onclick="return checkForm(registerForm)">
    	</form>
    </body>
</html>
