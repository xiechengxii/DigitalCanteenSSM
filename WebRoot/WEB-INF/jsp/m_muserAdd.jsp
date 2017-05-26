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
    </head> 
    <body>
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

    <div class="container">
        <div class="mp-pusher" id="mp-pusher">
        <%@ include file="publicjsp/index.jsp" %>               
            <div class="scroller" style="background:#EEEEEE">
                <div class="scroller-inner">
                    <div class="codrops-header" style="background:#29C192">
                            <div id="trigger" class="burger-container">
                            <span class="burger-bun-top"></span>
                            <span class="burger-filling"></span>
                            <span class="burger-bun-bot"></span>
                            </div>         
                            <p style="width:100%;height:100%;vertical-align:middle;font-size:27px">新增账户</p> 
                    </div>

                    <div class="content clearfix">
                        <form  role="form" name="muserInsertForm" method="post" enctype="multipart/form-data">
                            <div class="newcustom" style="margin-top:69px;padding-left:5%">
                            <div class="row form-group">
                                <label class="col-xs-4 control-label style1">管理员类型</label>
   	    	                        <div class="col-xs-7">
                                        <select name="muserRoleID" class="form-control" data-toggle="select" onchange="selectRole(this.value)">
   	    	                        	<option value="">请选择添加的管理员类型</option>
   	    	                        	<c:forEach items="${roleList }" var="item" >
   	    	                        		<option value="${item.roleID }">${item.roleName }</option>
	    	                        	</c:forEach>
   	    	                            </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label style1" id="campusLabel">管理员校区</label>
                                    <div class="col-xs-7">
   	    	                        <select name="muserCampusID" class="form-control" onchange="selectCanteen(this.value)" data-toggle="select">
   	    	                        	<option value="">请选择食堂管理员的所属校区</option>
   	    	                        </select>
                                    </div>
                            </div>
                            <br>
   	    	                <div class="row form-group"> 
                                <label class="col-xs-4 control-label style1" id="canteenLabel">管理员食堂</label>
                                    <div class="col-xs-7">
   	    	                        <select name="muserCantID" class="form-control" data-toggle="select">
   	    	                        	<option value="">请选择食堂管理员的所属食堂</option>
   	    	                        </select>
                                    </div>
                            </div>
                            <br>
   	    	                <div class="row form-group">
                                <label class="col-xs-4 control-label style1">用户名</label>
                                <div class="col-xs-7">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员名字" name="muserName">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label style1">密码</label>
                                <div class="col-xs-7">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员密码" name="muserPwd">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label style1">联系电话</label>
                                <div class="col-xs-7">
   	    	                        <input type="text" class="form-control" placeholder="请在此输入管理员电话" name="muserTel">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label style1">Email</label>
                                <div class="col-xs-7">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员Email" name="muserEmail">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
   	    	                    <label class="col-xs-4 control-label style1">照片</label>
   	    	                	<div class="col-xs-7">
                                    <a href="javascript:;" class="file" style="font-size:15px;">选择文件
   	    	                		<input type="file" name="muserPhotoFile"/>
                                    </a>
                                </div>
                            </div>   	    	               
   	    	                <input type="hidden" name = "muserRegDate">
   	    	                <div align="center">
        	                    <input type="button" class="btn btn-primary" value="添加用户" onClick=getNowFormatDate()>
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
