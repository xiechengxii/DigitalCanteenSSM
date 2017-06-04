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
		<base href="<%=basePath%>">
	    <title>导出记录</title>
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
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" />
		
		<script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
		<!--日历控件-->	
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
	    <script src="js/moment.js"></script>
	    <script src="js/daterangepicker-1.3.7.js"></script>
	
	</head>
	
	<body>		
		<script>	
			function exportExcel(){
				 document.listFrom.action="campusRecordExportToExcel.action";
	    		document.listFrom.submit();	 
	    		/*$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/campusRecordExportToExcel.action',
					contentType:'application/x-www-form-urlencoded',
					//发送的是key/value，接收的是json
					data:{beginTime:$('#beginTime'),endTime:$('#endTime')},				
				});*/
			}
		
			function findCampusRecord(){
				document.listFrom.action="findRecordInCampus.action";
	    		document.listFrom.submit();
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
					<p style="width:100%;height:100%;vertical-align:middle;font-size:27px">菜品记录导出</p>
				</div>

	    		<div class="content clearfix">
					<form id="listFrom" name="listFrom" class="form-horizontal" action="campusRecordExportToExcel.action" method="post">																		
						<div class=" newcustom" style="margin-top:77px" >
						<div class="form-group">
							<div class="col-xs-9">    
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
	                        <div class="col-xs-3">
								<button type="button" class="btn btn-success" onclick="findCampusRecord()">搜索</button> 
							</div> 
	                    </div>
	                    <br><br>
	                    <div class="form-group">
	                        <div class="col-xs-9">
								<div class="input-group" style="width: 240px; margin-left: 0px;">
								    <input type="text" class="form-control date-picker" id="dateTimeRange"/>
								    <span class="input-group-addon">
								        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
								    </span>
								    <input type="hidden" name="beginTime" id="beginTime" />
								    <input type="hidden" name="endTime" id="endTime"  />								    
								</div>
							</div>											
							<div class="col-xs-3">
								<button onclick="exportExcel()" class="btn btn-primary">导出</button>
							</div>  
						</div>
						</div>                                                             
					</form>							
					        
					    <div class="newcustom" style="padding: 1em 0.6em">   
							<table class="table table-striped table-bordered table-condensed table-hover table-responsive text-center">
							    <thead>
								    <tr style="background:#29C192;text-align:center;color:white;font-size:15px">
								    	<th >校区</th>
								    	<th >食堂</th> 
								    	<th >操作人</th> 
								    	<th >日期</th> 
								    	<th >提交状态</th> 									    			
								    </tr>
							    </thead>
							    <tbody>
								    <c:forEach items="${pagehelper.list }" var="item">
								        <tr style="color:black;font-size:15px">
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordCampusName }</td>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordCantName }</td>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordMUserName }</td>
								        	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></td>
								        	<td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td>  	
								        </tr>
							        </c:forEach>
							    </tbody>
							</table>
						</div>
							<div>
                                <div class="message">
                                    <p class="text-center" style="color:black">
                                        共<b>${pagehelper.total}</b>条记录，当前显示第&nbsp;<b>${pagehelper.pageNum}/${pagehelper.pages}</b>&nbsp;页
                                    </p>
                                </div>
                                <div style="text-align:center;">
                                    <ul class="pagination">
                                        <c:if test="${!pagehelper.isFirstPage}">                                        
                                            <li>
                                                <a href="findRecordInCampus.action?campusID=${campusID}&pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">上一页</a>
                                            </li>
                                        </c:if>
    
                                        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">    
    
                                            <c:if test="${navigatepageNum==pagehelper.pageNum}">
                                                <li class="active">
                                                    <a href="findRecordInCampus.action?campusID=${campusID}&pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                            <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                                                <li>
                                                    <a href="findRecordInCampus.action?campusID=${campusID}&pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a>
                                                </li>
                                            </c:if>
    
                                        </c:forEach>
    
                                        <c:if test="${!pagehelper.isLastPage}">
                                            <li>
                                                <a href="findRecordInCampus.action?campusID=${campusID}&pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">下一页</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>												
						</div>					
					</div> 
				</div>      
			</div>
		</div>
	
	<!--日期控件-->
	  	<script>
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
		<script src="js/classie.js"></script>
		<script src="js/mlpushmenu.js"></script>
		<script>
		   new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
		</script>
	</body>
</html>
