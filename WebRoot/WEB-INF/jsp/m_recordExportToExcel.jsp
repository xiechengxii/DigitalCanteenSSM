<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>outputExcel</title>
    <meta name="viewport" content="width=device-width, 
                                     initial-scale=0.3, 
                                     maximum-scale=1.0, 
                                     user-scalable=true">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<!--自定义-->		
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/my-custom.css">
	<link rel="stylesheet" href="css/qunit-1.11.0.css">
	<script type="text/javascript" src="js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!--日历控件-->	
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
	<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
    <script src="js/moment.js"></script>
    <script src="js/daterangepicker-1.3.7.js"></script>

</head>
	<%@ include file="publicjsp/backgroundMenu.jsp" %>
<body>
	<script type="text/javascript">

	function exportExcel(){
		/* document.listFrom.action="campusRecordExportToExcel.action";
    	document.listFrom.submit();	 */
    	$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/campusRecordExportToExcel.action',
			contentType:'application/x-www-form-urlencoded',
			//发送的是key/value，接收的是json
			data:{beginTime:$('#beginTime'),endTime:$('#endTime')},
			//回调函数:返回json结果
			success:function(data){
					alert("导出成功！");
			}
		
		});
	}

	function findCampusRecord(){
		document.listFrom.action="findRecordInCampus.action";
    	document.listFrom.submit();
	}
	</script>
    
    <div class="container-fluid">    
		<div class="row-fluid">
			<div class="container  col-sm-12 col-sm-offset-0"> 
				<div class="panel panel-default ">
					<div class="panel-heading">
						<h3 class="panel-title">菜品记录导出</h3>
					</div> 
					<div class="panel-body"> 
						<div class="row"> 	
							<form id="listFrom" name="listFrom" action="${pageContext.request.contextPath}/campusRecordExportToExcel.action" method="post">																		
								<div class="col-sm-3">    
                                    <!-- 选择食堂所属校区 -->
                                    <select class="form-control" name="campusID">
                                        <option value="">请选择食堂所属校区</option>
                                        <c:forEach items="${campusList }" var="item" >
                                            <c:choose>
	                   		                    <c:when test="${item.campusID == campusID }">
	                   		                        <option value="${item.campusID }" selected="selected">${item.campusName }</option>
	                   		                    </c:when>
	                   		                    <c:otherwise>
	                   		                         <option value="${item.campusID }">${item.campusName }</option>
	                   		                    </c:otherwise>
	                   		                </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>                                
								<div  class="col-sm-2">
									<button type="button" class="btn btn-primary" onclick="findCampusRecord()">搜索</button> 
								</div> 
								<div  class="form-group col-sm-3">						
										<div class="input-group" style="width: 240px; margin-left: 0px;">
										    <input type="text" class="form-control date-picker" id="dateTimeRange"/>
										    <span class="input-group-addon">
										        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
										    </span>
										    <input type="hidden" name="beginTime" id="beginTime" />
										    <input type="hidden" name="endTime" id="endTime"  />								    
										</div>													
								</div>
								<div  class="col-sm-3">
									<button onclick="exportExcel()" class="btn btn-primary">导出</button>
								</div>                                                               
							</form>							
				        </div>
				        
						<table class="table table-striped table-bordered table-hover table-responsive text-center">
						    <thead>
							    <tr>
							    	<th style='text-align: center;'>校区</th>
							    	<th style='text-align: center;'>食堂</th> 
							    	<th style='text-align: center;'>操作人</th> 
							    	<th style='text-align: center;'>日期</th> 
							    	<th style='text-align: center;'>提交状态</th> 	
							    	<th style='text-align: center;'>编辑</th> 		
							    </tr>
						    </thead>
						    <tbody>
							    <c:forEach items="${recordList }" var="item">
							        <tr>
							        	<td style='vertical-align: middle;text-align: center;'>${item.recordCampusName }</td>
							        	<td style='vertical-align: middle;text-align: center;'>${item.recordCantName }</td>
							        	<td style='vertical-align: middle;text-align: center;'>${item.recordMUserName }</td>
							        	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></td>
							        	<td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td>  	
							        	<td style='vertical-align: middle;text-align: center;'>
						                    <div class="form-group btn-group btn-group-sm">
						                        <a href="modifyRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-info">修改</a>
							        		    <a href="findRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-success">查看</a>
							        	        <a href="deleteRecord.action?recordID=${item.recordID}" class="btn btn-danger">删除</a>
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
		            /* '最近1小时': [moment().subtract('hours',1), moment()], */
		            '今日': [moment().startOf('day'), moment()],
		            /* '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
		            '最近7日': [moment().subtract('days', 6), moment()],
		            '最近30日': [moment().subtract('days', 29), moment()], */
		            '本月': [moment().startOf("month"),moment()],
		            /* '上个月': [moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")] */
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
