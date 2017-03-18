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
    	<title>后台首页</title>   
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
    <div class="container">
    	<div class="mp-pusher" id="mp-pusher">
    	<%@ include file="publicjsp/index.jsp" %>
    	    <form>
	        	<input type="hidden" name = "muserID" value="${muserItems.cantID }" >
	        	<input type="hidden" name = "roleID" value="${muserItems.roleID }" >
	        	<input type="hidden" name = "roleName" value="${muserItems.roleName }" >	    
        	</form>
        <!-- 后台管理用户的页面 -->
        <div class="scroller" style="background:#f3efe0">
        	<div class="scroller-inner">
        	    <header class="codrops-header" style="background:#7acfa6">
        	         <div class="row">
        	         <div id="trigger" class="burger-container">
						<span class="burger-bun-top"></span>
						<span class="burger-filling"></span>
						<span class="burger-bun-bot"></span>
					 </div>					
					<h1>后台管理系统</h1>
					</div>
				</header>

		<div class="content clearfix">
	    <div class="container-fluid">	    	
	    		<div class="panel-group" id="accordion">
	    			<c:forEach items="${campusList }" var="item_campus">
	    				<div class="panel panel-default">
	    					<div class="panel-heading">
	    						<h4 class="panel-title">	    							
	    							${item_campus.campusName }	    							
	    						</h4>
	    					</div>
	    					<div class="panel-collapse collapse in">
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
	    									<a style="font-size:15px;" href="muserBackGround.action?recordCantID=${item_canteen.cantID }">
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
	    	
	    	
	    		<div class="panel panel-default">
	    			<div class="panel-heading">
	    				<div class="row">
 						    <div style="font-size:15px;">
					   	    	所属校区:${canteenItems.campusName}

					   	    	所属食堂:${canteenItems.cantName}
					   	    </div>
					   	</div>
	    			</div>
	    			<div class="panel-body">
	    		        <table class="table table-striped table-bordered table-condensed table-hover table-responsive text-center">
	    		        	<thead>
	                            <tr style="background:#7acfa6;text-align:center;color:white;font-size:15px">
	                            	<th >校区</th>
	                            	<th >食堂</th> 
	                            	<th >操作人</th> 
	                            	<th >日期</th> 
	                            	<th >提交状态</th> 
	                            	<th >编辑</th>  			
	                            </tr>
                            </thead>
                            <tbody>
	                           <c:forEach items="${dishRecordList }" var="item">
	                               <tr style="color:black;font-size:15px"> 
	                               	    <td style='vertical-align: middle;text-align: center;'>${item.recordCampusName }</td>
	                               	    <td style='vertical-align: middle;text-align: center;'>${item.recordCantName }</td>
	                               	    <td style='vertical-align: middle;text-align: center;'>${item.recordMUserName }</td>
	                               	    <td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></td>
	                               	    <td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td>
	                               	    <td style='vertical-align: middle;text-align: center;'>
                                            <div class="form-group btn-group btn-group-sm">
	                               	    		<a href="findRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-success">查看</a>
                                            </div>
	                               	    </td>
	                               </tr>
                               </c:forEach>
                            </tbody>
	    		        </table>
	    		    </div>
	    		</div>
	    	
	    	
	    </div>
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
