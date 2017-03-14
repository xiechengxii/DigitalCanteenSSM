<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <title>outputExcel</title>
    <meta name="viewport" content="width=device-width, 
                                     initial-scale=0.3, 
                                     maximum-scale=1.0, 
                                     user-scalable=true">
	<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!--自定义-->		
	<link rel="stylesheet" href="css/my-custom.css">
	
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--日历控件-->	
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
    <script type="text/javascript" src="js/moment.js"></script>
    <script type="text/javascript" src="js/daterangepicker-1.3.7.js"></script>

	<script type="text/javascript">

	function exportExcel(){

		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/dishExportToExcel.action',
			contentType:'application/x-www-form-urlencoded',
			//发送的是key/value，接收的是json
			data:'',
			//回调函数:返回json结果
			success:function(data){
					alert("导出成功");
			}
		
		});
		
	}

	</script>
</head>
	<%@ include file="publicjsp/backgroundMenu.jsp" %>
<body>
    
    <div class="container-fluid">    
		<div class="row-fluid">


			<div class="container  col-sm-12 col-sm-offset-0"> 
				<div class="panel panel-default ">
					<div class="panel-heading">
						<h3 class="panel-title">菜品记录导出</h3>
					</div> 
					<div class="panel-body"> 
						<div class="row"> 	
							<form id="listFrom" name="listFrom" action="${pageContext.request.contextPath}/dishExportToExcel.action" method="post">																		
								<div  class="form-group col-sm-3">						
										<div class="input-group" style="width: 240px; margin-left: 0px;">
										    <input type="text" class="form-control date-picker" id="dateTimeRange"/>
										    <span class="input-group-addon">
										        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
										    </span>
										    <input type="hidden" name="beginTime" id="beginTime"  />
										    
										    <input type="hidden" name="endTime" id="endTime"  />								    
										</div>													
								</div>
								<div  class="col-sm-6">
									<button onclick="exportExcel()" class="btn btn-primary">导出</button>
								</div>
								<div class="form-group col-sm-2">
									<input type="text" class="form-control" placeholder="Search">
								</div>
								<div  class="col-sm-1">
									<button type="button" class="btn btn-primary">搜索</button> 
								</div>  
							</form>							
				        </div>

						<table class="table table-striped table-bordered table-hover table-condensed table-responsive text-center" >
							<thead>
								<tr>
									<th style='text-align: center;'>校区名称</th>
    								<th style='text-align: center;'>食堂名称</th>
    								<th style='text-align: center;'>档口名称</th>
    								<th style='text-align: center;'>菜品类型</th>
    								<th style='text-align: center;'>菜品名称</th>
    								<th style='text-align: center;'>菜品图片</th>
    								<th style='text-align: center;'>菜品价格</th>
    								<th style='text-align: center;'>菜品销售时间</th>
    								<th style='text-align: center;'>菜品销售状态</th>			
    								<th style='text-align: center;'>菜品录入日期</th>
    								<th style='text-align: center;'>菜品录入状态</th>
    								<th style='text-align: center;'>菜品推荐</th>
    								<th style='text-align: center;'>菜品留样</th>
    								<th style='text-align: center;'>菜品合格</th> 			
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${dishExcel }" var="item" >
					    			 <c:choose>
								    	<c:when test="${item.dishInState == '待审核'}">
											<tr>
											 	<td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
											   	<td style='vertical-align: middle;text-align: center;'>
												   	<c:if test="${item.dishPhoto != null }">
								   						<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="120"/>
								   					</c:if>
						   						</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
											   	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td> 
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishInState }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>
											   	<td style='vertical-align: middle;text-align: center;'>${item.dishQuality }</td>			   	
											    <td style='vertical-align: middle;text-align: center;'>
											    	<div class="form-group btn-group btn-group-sm">
												    	<a href="deleteDishById.action?dishID=${item.dishID}" class="btn btn-danger">删除</a>
													</div>
											    </td>
											</tr>
								    	</c:when>
									</c:choose>
								</c:forEach>
								
								<c:forEach items="${dishExcel }" var="item" >
					    			 <c:choose>
								    	<c:when test="${item.dishInState == '待审核'}">
								    	</c:when>
										<c:otherwise>
											<tr>
										 		<td style='vertical-align: middle;text-align: center;'>${item.campusName }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.cantName }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.wndName }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishTypeName }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishName }</td>
										   		<td style='vertical-align: middle;text-align: center;'>
												   	<c:if test="${item.dishPhoto != null }">												   	
						   								<img src="/upload/pic/${item.dishPhoto }" class="center-block" height="100" width="120"/>
						   							</c:if>
					   							</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishPrice }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishDate }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishSale }</td>
										   		<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td> 
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishInState }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishRecmd }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishKeep }</td>
										   		<td style='vertical-align: middle;text-align: center;'>${item.dishQuality }</td>	
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>											
					</div>					
				</div> 
			</div>
		       
		</div>
	</div>

<!--日期控件-->
  	<script type="text/javascript">
		$(function() {
		    $('#dateTimeRange').daterangepicker({
		        applyClass : 'btn-sm btn-success',
		        cancelClass : 'btn-sm btn-default',
		        locale: {
		            applyLabel: '确认',
		            cancelLabel: '取消',
		            fromLabel : '起始时间',
		            toLabel : '结束时间',
		            customRangeLabel : '自定义',
		            firstDay : 1
		        },
		        ranges : {
		            //'最近1小时': [moment().subtract('hours',1), moment()],
		            '今日': [moment().startOf('day'), moment()],
		            '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
		            '最近7日': [moment().subtract('days', 6), moment()],
		            '最近30日': [moment().subtract('days', 29), moment()],
		            '本月': [moment().startOf("month"),moment().endOf("month")],
		            '上个月': [moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")]
		        },
		        opens : 'right',    // 日期选择框的弹出位置
		        separator : ' 至 ',
		        showWeekNumbers : true,     // 是否显示第几周
		 
		 
		        //timePicker: true,
		        //timePickerIncrement : 10, // 时间的增量，单位为分钟
		        //timePicker12Hour : false, // 是否使用12小时制来显示时间
		 
		         
		        //maxDate : moment(),           // 最大时间
		        format: 'YYYY-MM-DD'
		 
		    }, function(start, end, label) { // 格式化日期显示框
		        $('#beginTime').val(start.format('YYYY-MM-DD'));
		        $('#endTime').val(end.format('YYYY-MM-DD'));
		    })
		    .next().on('click', function(){
		        $(this).prev().focus();
		    });
		});
		 
		/**
		 * 清除时间
		 */
		function begin_end_time_clear()
		{
		    $('#dateTimeRange').val('');
		    $('#beginTime').val('');
		    $('#endTime').val('');
		}
	</script>
</body>
</html>
