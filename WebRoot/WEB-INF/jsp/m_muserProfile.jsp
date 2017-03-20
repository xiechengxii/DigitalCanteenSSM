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
        
        <title>账户信息</title>
    
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
        	function VerifyPwd(form){
        		if(form.muserPwd.value == "")
        		{
        			alert("密码不能为空！");
        			return false;
        		}
        		return true;
        	}
        </script>

    </head>
  
    <body>
    	<!-- 根据用户类型决定菜单项 -->
    	<c:if test="${muserItems.roleName == 'super'}">
    		<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	</c:if>
    	<c:if test="${muserItems.roleName == 'company'}">
    		<%@ include file="publicjsp/backgroundMenu.jsp" %>
    	</c:if>
    	<c:if test="${muserItems.roleName == 'canteen'}">
    		<%@ include file="publicjsp/canteenMenu.jsp" %>
    	</c:if>

    	<div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">

                	<div class="panel-heading">
                        <h3 class="panel-title">修改账户信息</h3>
                    </div>

                    <div class="panel-body">
                    	<form name="profileForm" class="form-horizontal" action="profileEditSave.action" method="post" enctype="multipart/form-data">
                    		
                    		<input name="muserID" type="hidden" value="${muserItems.muserID }">

                    		<div class="form-group">
                    			<label class="col-sm-2 control-label">管理员类型</label>
                    			<div class="col-sm-9">                    				
                    				<select name="muserRoleID" class="form-control">
                    					<option value="${muserItems.roleID}">${muserItems.roleName }</option>
                    				</select>
                    			</div>
                    		</div>
                    		<c:if test="${muserItems.roleName == 'canteen'}">
                    			<div class="form-group">
                    				<label class="col-sm-2 control-label" id="campusLabel">管理员校区</label>
                    				<div class="col-sm-9">                    					
                    					<select name="muserCampusID" class="form-control">
                    						<option value="${muserItems.campusID}">${muserItems.campusName }</option>
                    					</select>
                    				</div>
                    			</div>
                    			<div class="form-group">
                    				<label class="col-sm-2 control-label" id="campusLabel">管理员食堂</label>
                    				<div class="col-sm-9">
                    					<select name="muserCantID" class="form-control">
                    						<option value="${muserItems.cantID}">${muserItems.cantName }</option>
                    					</select>
                    				</div>
                    			</div>
                    		</c:if>
                    		<!-- 对于非食堂管理员，也要获取他们的默认校区ID和食堂ID，因为数据库关联了外键，必须填上这两个ID -->
                    		<c:if test="${muserItems.roleName != 'canteen'}">
                    			<input type="hidden" name="muserCampusID" value="${muserItems.campusID}">
                    			<input type="hidden" name="muserCantID" value="${muserItems.cantID}">
                    		</c:if>
                    		<div class="form-group">
                    			<label class="col-sm-2 control-label">用户名</label>
                    			<div class="col-sm-9">
                                    <input type="text" class="form-control" name="muserName" value="${muserItems.muserName }" readonly=true>
                                </div>
                    		</div>
                    		<div class="form-group">
                    			<label class="col-sm-2 control-label">修改密码</label>
                    			<div class="col-sm-9">
                                    <input type="password" class="form-control" name="muserPwd" value="${muserItems.muserPwd }">
                                </div>
                    		</div>                    		
                    		<div class="form-group">
                    			<label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="请在此输入电话" name="muserTel" value="${muserItems.muserTel }">
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
                                    <input type="text" class="form-control" placeholder="请在此输入Email" name="muserEmail" value="${muserItems.muserEmail }">
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
                                    <input type="submit" class="btn btn-primary" value="保存" onclick="return VerifyPwd(profileForm)">
                                </div>
                            </div>  
                    	</form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
