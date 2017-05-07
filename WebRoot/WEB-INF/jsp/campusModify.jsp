<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	    <base href="<%=basePath%>">
	    
	    <title>修改校区信息</title>
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

        <script src="js/jquery.form.js"></script>
	    <script src="js/custom.jquery.form.js"></script>
	    <script src="js/jquery.validate.js"></script>

	    <script>
	    	function upadteCampus(){
	    		if(document.updateCampusForm.campusName.value == ""){
	    			alert("请输入校区名称");
        			return;
	    		}

	    		document.updateCampusForm.action = "modifyCampusSaveWithValidation.action";
	    		jquerySubByFId('updateCampusForm', updateCampus_callback, null, "json");
	    	}
	    	function updateCampus_callback(data){
        		//有同名校区
        		if(data.resultInfo.type == '0'){
        			alert(data.resultInfo.message);
        		}
        		window.location.href="findAllCampuses.action";
	    	}
	    </script>
	</head>
	  
	<body>
		<%@ include file="publicjsp/backgroundMenu.jsp" %>
		<div class="container-fluid">
			<div class="container col-sm-6 col-sm-offset-3">
				<div class="panel panel-default">

					<div class="panel panel-heading">
						<h3 class="panel-title">修改校区</h3>
					</div>

					<div class="panel-body">
	    				<form name="updateCampusForm" id= "updateCampusForm" class="form-horizontal" role="form" method="post">
	    					<div class="form-group">    							    							
	  					    	<input name="campusID" type="hidden" value="${campus.campusID }">
	  					    	<label class="col-sm-2 control-label">校区名称：</label>
	  					    	<div class="col-sm-9">	
	  					    		<input name="campusName" class="form-control" type="text" value="${campus.campusName }" onKeydown="if(event.keyCode==13){return false;}">
	  					    	</div>	  					    	
	  					    </div>	
	  						<div class="form-group">
	  							<div class="col-sm-2 col-sm-offset-5">
	  					    		<input type="button" class="btn btn-primary" value="保存" onclick="upadteCampus()">
	  					    	</div>
	  					    </div>
	    				</form>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</body>
</html>
