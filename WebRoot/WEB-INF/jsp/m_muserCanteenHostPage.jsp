<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="digitalCanteenSSM.po.Dish" %>
<%@ page import="java.util.*"%>
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
    	
    	<title>食堂管理首页</title>

    	<meta http-equiv="pragma" content="no-cache" >
		<meta http-equiv="cache-control" content="no-cache" >
		<meta http-equiv="expires" content="0">   
 		<meta charset="utf-8">
 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui" >
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
        
        <script src="js/modernizr.custom.js"></script>
    	<script src="js/jquery-2.1.1.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
    	<script src="js/jquery.mobile-1.4.3.min.js"></script>
    	<!--日历控件-->	
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
		<link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-1.3.7.css" />
	    <script src="js/moment.js"></script>
	    <script src="js/daterangepicker-1.3.7.js"></script>
	    
    	<link rel="stylesheet" href="css/m_bootstrap.min.css"/>
    	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
    	<link rel="stylesheet" type="text/css" href="css/demo.css" />
    	<link rel="stylesheet" type="text/css" href="css/icons.css" />
    	<link rel="stylesheet" type="text/css" href="css/component.css" />
    	<link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
    	
    	<!-- 日期控件导入 -->

        <script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script> 
        
  	</head>
  
  	<body>
  		
		<script type="text/javascript">

		function exportExcelInCanteen(){
			document.muserCanteenForm.action="canteenRecordExportToExcel.action";
	    	document.muserCanteenForm.submit();	
	    	/* $.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/canteenRecordExportToExcel.action',
				contentType:'application/x-www-form-urlencoded',
				//发送的是key/value，接收的是json
				data:{beginTime:$('#beginTime'),endTime:$('#endTime')},
				//回调函数:返回json结果
				success:function(data){
						alert("导出成功！");
				}
			
			}); */
		}
		</script>
		
		
 <div class="container" >
     <div class="mp-pusher" id="mp-pusher">
      <%@ include file="publicjsp/canteennavindex.jsp" %> 
      	<div class="scroller" style="background:#f3efe0">
            <div class="scroller-inner">
           		<header class="codrops-header" style="background:#7acfa6">
        	         <div class="row">
	        	         <div id="trigger" class="burger-container">
							<span class="burger-bun-top"></span>
							<span class="burger-filling"></span>
							<span class="burger-bun-bot"></span>
						 </div>					
						<h1>食堂管理系统</h1>
					 </div>
				</header> 
				
				
	                <div class="container-fluid" style="padding:0 0px;">
	                    <form role="form" name="muserCanteenForm" action="canteenRecordExportToExcel.action" method="post">
	                          <div class="row">
	                    	       <div  class="form-group col-xs-7" style="position:relative;top:2px;">
	                    	       					
								         <div class="input-group" style="width: 240px; margin-left: 12px;">
								              <input type="text" class="form-control date-picker" id="dateTimeRange"/>
								                     <span class="input-group-addon">
								        				   <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
								    				 </span>
								              <input type="hidden" name="beginTime" id="beginTime" />
								    		  <input type="hidden" name="endTime" id="endTime"  />								    
										</div>													
								  </div>
							      <div  class="col-xs-4" style="position:relative;left:30px;top:2px;">
								        <button onclick="exportExcelInCanteen()" class="btn btn-primary">导出</button>
							      </div>														
			                      <!-- 食堂管理员 -->
			                      <input type="hidden" name = "campusID" value="${muserItems.campusID }" >
			                      <input type="hidden" name = "cantID" value="${muserItems.cantID }" >
			                      <input type="hidden" name = "muserID" value="${muserItems.cantID }" >
		                    </div>		                
		                    <div class="row" style="padding:0 0px;"> 
		                         <div class="form-group">
		                              <div class="item-wrap">
			                              <c:forEach items="${pagehelper.list }" var="item" >
										  	<div  id="view" class="item clearfix">										    									        									        
											    <div class="txt-item">
											      <table onclick="location.href='modifyRecordDetailDish.action?recordID=${item.recordID}';">
											           <tr><td style="width:80%"><p class="name">${item.recordCampusName } ${item.recordCantName }</p></td><td style="width:80%"><p class="name">${item.recordMUserName }</p></td></tr>
											           <tr><td><p class="txt"><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></p></td><td><p class="txt"> ${item.recordSubmitState }</p></td></tr>
											      </table>										      
											    </div>																			    									        								  	
										  	<a href="deleteRecord.action?recordID=${item.recordID}" class="delect-btn" style="padding-top:28px;">删除</a>										   
										  </div>
										</c:forEach>										  	
								    </div>
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
	
	<script>
  		$(".item").on('swipeleft', function(event) {
    		event.preventDefault();
    		
    		$(this).addClass('selected').siblings('.item').removeClass('selected');
    		$(this).find('.delect-btn').on('click', function(event) {
      			event.preventDefault();
      	    /* Act on the event */
      			$(this).parent(".item").animate({
        		height: 0,
        		width: 0},
        		300, function() {
        	/* stuff to do after animation is complete */
        			$(this).remove();
      			});
    		});
  		});
  		$(".item").on('swiperight', function(event) {
    		event.preventDefault();
    		
    		$(this).removeClass('selected');
  		});
  		/* $(".item").on('swiperight', function(event) {
    		event.preventDefault();
    		/* Act on the event */
    		/* $(this).removeClass('selected');
  		}); */
  		
	</script>
  	</body>
</html>