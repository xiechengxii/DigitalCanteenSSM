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
        
        <title>添加用户</title>
        
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
        	function selectRole(objValue){
        		var objForm = document.forms["muserInsertForm"];
        		
        		
        		if(objValue == ""){
        			objForm.muserCampusID.disabled = true;
        			objForm.muserCantID.disabled = true;
        		}else if(objValue != 3){ 
        		  	/* objForm.muserCampusID.disabled = false;
        			objForm.muserCantID.disabled = false; */	
        			/* objForm.muserCampusID.value="${item.campusID }"; */	
        			
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
        		}else{
        			objForm.muserCampusID.disabled = false;	 	
        			objForm.muserCampusID.options.length = 0;
        			
        			var optionObj = document.createElement("option");
        			optionObj.text = "请选择添加的管理员的所属校区";
                    optionObj.value = "0";
                    objForm.muserCampusID.add(optionObj);
               
                    objForm.muserCampusID.style.display="inline-table";
                    objForm.muserCantID.style.display="inline-table";
                    document.getElementById("campusLabel").style.display="inline-table";
                    document.getElementById("canteenLabel").style.display="inline-table";
                    objForm.muserCantID.disabled = false;   
                    objForm.muserCantID.options.length = 0;
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属食堂";
                    optionObj.value = "0";
                    objForm.muserCantID.add(optionObj);
    
         
        			<c:forEach items="${campusList }" var="item" >  	
 	     				var optionObj = document.createElement("option"); 							
                        optionObj.text = "${item.campusName }";
                        optionObj.value = "${item.campusID }";
                        objForm.muserCampusID.add(optionObj);                
	    			</c:forEach>
        		}
        	}
    
	    	function selectCanteen(objValue){
        		var objForm = document.forms["muserInsertForm"];
        		
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
 	     				var optionObj = document.createElement("option"); 		
 	     				if(cantCampusID == Number(objValue)){	 				
	                        optionObj.text = "${item.cantName }";
	                        optionObj.value = "${item.cantID }";
	                        objForm.muserCantID.add(optionObj);
        	 	        }  					              
	    			</c:forEach>
        		}
        	}
        	
        	/* 得到系统格式化的日期 */
	    	function getNowFormatDate() {
	    	    var date = new Date();
	    	    var seperator1 = "-";
	    	    var seperator2 = ":";
	    	    var month = date.getMonth() + 1;
	    	    var strDate = date.getDate();
	    	    if (month >= 1 && month <= 9) {
	    	        month = "0" + month;
	    	    }
	    	    if (strDate >= 0 && strDate <= 9) {
	    	        strDate = "0" + strDate;
	    	    }
	    	    var currentDate= date.getFullYear() + seperator1 + month + seperator1 + strDate;
	    	    document.muserInsertForm.muserRegDate.value=currentDate;
	    	    document.muserInsertForm.action="insertmuser.action";
	    	    document.muserInsertForm.submit(); 
            }	
        </script>
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <h3 class="panel-title">新增管理员账户</h3>
                    </div>

                    <div class="panel-body">
                        <form class="form-horizontal" role="form" name="muserInsertForm" method="post" enctype="multipart/form-data">
                            <div class="form-group">
        	                    <!-- 选择要添加的管理员 -->
                                <label class="col-sm-2 control-label">管理员类型</label>
                                <div class="col-sm-9">
   	    	                        <select name="muserRoleID" class="form-control" onchange="selectRole(this.value)">
   	    	                        	<option value="">请选择添加的管理员类型</option>
   	    	                        	<c:forEach items="${roleList }" var="item" >
   	    	                        		<option value="${item.roleID }">${item.roleName }</option>
	    	                        	</c:forEach>
   	    	                        </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" id="campusLabel">管理员校区</label>
                                <div class="col-sm-9">
   	    	                        <!-- 选择要添加的食堂管理员的所属校区 -->
   	    	                        <select name="muserCampusID" class="form-control" onchange="selectCanteen(this.value)">
   	    	                        	<option value="">请选择食堂管理员的所属校区</option>
   	    	                        </select>
                                </div>
                            </div>
   	    	                <div class="form-group">
                                <label class="col-sm-2 control-label" id="canteenLabel">管理员食堂</label>
                                <div class="col-sm-9">
   	    	                        <!-- 选择要添加的食堂管理员的所属食堂 -->
   	    	                        <select name="muserCantID" class="form-control">
   	    	                        	<option value="">请选择食堂管理员的所属食堂</option>
   	    	                        </select>
                                </div>
                            </div>
   	    	                <div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-9">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员名字" name="muserName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-9">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员密码" name="muserPwd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-9">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员电话" name="muserTel">
                                </div>
                            </div>
   	    	                <div class="form-group">
   	    	                    <label class="col-sm-2 control-label">照片</label>
   	    	                	<div class="col-sm-9">
   	    	                		<input type="file" name="muserPhotoFile"/>
                                </div>   	    	               
                            </div>
   	    	                <div class="form-group">
                                <label class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-9">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员Email" name="muserEmail">
                                </div>
                            </div>
   	    	                <input type="hidden" name = "muserRegDate">
   	    	                <div class="form-group">
                                <div class="col-sm-2 col-sm-offset-5">
        	                        <!-- 菜品添加按钮 -->
        	                        <input type="button" class="btn btn-primary" value="添加用户" onClick=getNowFormatDate()>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
