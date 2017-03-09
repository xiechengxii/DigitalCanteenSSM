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
    
    	<title>后台首页</title>
    
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
    		/* 在校区选择之后得到该校区之下的食堂选择框
    			objValue：校区的ID值
    			windowInsertForm：档口预置表单
    			canteenItemsList：所有食堂信息列表
    			wndCantID：食堂select标签的选择值
    		*/
  			function getCanteen(objValue)
			{	
				var objForm = document.forms["backGroundForm"];
			
    			if(objValue == ""){
    				objForm.recordCantID.disabled = true;
    			}else{   			 	
    				objForm.recordCantID.disabled = false; 
    				objForm.recordCantID.options.length = 0;
    				var optionObj = document.createElement("option");
    				optionObj.text = "请选择要查看的食堂";
    	            optionObj.value = "";
    	            objForm.recordCantID.add(optionObj);
    				
    				<c:forEach items="${canteenItemsList }" var="item" >  	
    		 			var cantCampusID = ${item.cantCampusID };
 		 				var optionObj = document.createElement("option");
    		 			if( cantCampusID == Number(objValue)){	 				
		                    optionObj.text = "${item.cantName }";
		                    optionObj.value = "${item.cantID }";
		                    objForm.recordCantID.add(optionObj);
    		 			}  
					</c:forEach>
    			}
			}
			
			function getRecord(){	
				document.backGroundForm.action="recordDish.action";
    	    	document.backGroundForm.submit();
			}
			
  		</script>
    </head>
  
    <body> 
    	<%@ include file="publicjsp/backgroundMenu.jsp" %> 
        <!-- 后台管理用户的页面 -->
        <form>
	        <input type="hidden" name = "muserID" value="${muserItems.cantID }" >
	        <input type="hidden" name = "roleID" value="${muserItems.roleID }" >
	        <input type="hidden" name = "roleName" value="${muserItems.roleName }" >
	    
        </form>
        
         <form name = "backGroundForm" method="post">
	      	<!-- 选择食堂所属校区 -->
	    	<select name="cantCampusID" onchange="getCanteen(this.value)">
	    		<option value="">请选择要查看的校区</option>
	    		<c:forEach items="${campusList }" var="item" >
	    			<option value="${item.campusID }">${item.campusName }</option>
	    		</c:forEach>
	    	</select>
	    	<!-- 选择食堂 -->
	    	<select name="recordCantID" disabled="disabled" onchange="getRecord()">
	    		<option value="">请选择要查看的食堂</option>
	    	</select>
	    </form>
	    <div class="container-fluid">
	    	<div class="container  col-sm-2">
	    		<div class="panel-group" id="accordion">
	    			<c:forEach items="${campusList }" var="item_campus">
	    				<div class="panel panel-default">
	    					<div class="panel-heading">
	    						<h4 class="panel-title">
	    							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
	    								${item_campus.campusName }
	    							</a>
	    						</h4>
	    					</div>
	    					<div id="collapseOne" class="panel-collapse collapse in">
	    						<c:forEach items="${canteenItemsList }" var="item_canteen">
	    							<c:if test="${item_canteen.campusName == item_campus.campusName}">
	    								<div class="panel-body">
	    									<!-- 读取今日已经录入的记录，检查当前食堂是否已经录入 -->
	    									<c:forEach items="${RecordItemsList }" var="item_record">	    										
	    										<c:if test="${item_record.recordCantName == item_canteen.cantName}">
	    											<!-- 设置一个标记来标示是否已经录入-->
	    											<c:set var="status" value="setted" scope="page"/>
	    										</c:if>	    										
	    									</c:forEach>
	    									<a href="recordDish.action?recordCantID=${item_canteen.cantID }">
	    										<c:if test="${status == 'setted' }">
	    											${item_canteen.cantName}
	    										</c:if>
	    										<c:if test="${status != 'setted' }">
	    											${item_canteen.cantName}【未录入】
	    										</c:if>
	    									</a>
	    									<!-- 每次要将status值重置 -->
	    									<c:set var="status" value="unsetted" scope="page"/>
	    								</div>
	    							</c:if>
	    						</c:forEach>
	    					</div>
	    				</div>
	    			</c:forEach>
	    		</div>
	    	</div>
	    </div>
    </body>
</html>
