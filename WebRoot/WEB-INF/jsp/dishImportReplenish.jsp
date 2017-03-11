<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<html >
<head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-contro                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              l" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function getRecordDish(){
	
			obj = document.getElementsByName("dishIDList");
		    recordDishID = [];
		    for(k in obj){
		        if(obj[k].checked)
		            recordDishID.push(obj[k].value);
		    }
		}
		/* <!-- onClick=getRecordDish() --> */
		/* 得到系统格式化的日期 */
		function getdishImportReplenish(form) {
		    document.importReplenishDishForm.action="importHandle.action";
        	document.importReplenishDishForm.submit(); 
		}
		
		//点击导入以前日期已录入的菜品
		function getDishInImportReplenishDate(){
			
			document.importReplenishDishForm.action="getDishInImportReplenishDate.action";
        	document.importReplenishDishForm.submit(); 
		}
		
		function checkBoxSelect(dishID){
			var checkbox = document.getElementById(dishID);	
			checkbox.checked=true;
		}
		function getAllSelect(name,boolValue){
			var allvalue = document.getElementsByName(name);   
    		for (var i = 0; i < allvalue.length; i++) {        
        	if (allvalue[i].type == "checkbox")             
            allvalue[i].checked = boolValue;             
    		} 
		}
		
		var checkflag=false;
		function getAllDishSelect(name){
			var allvalue = document.getElementsByName(name);
			
			if(checkflag==false){
				for (var i = 0; i < allvalue.length; i++) {        
		        	if ((allvalue[i].type == "checkbox"))             
		            allvalue[i].checked = true;  	                       
    			}  
    			checkflag=true;
			}else{
				for (var i = 0; i < allvalue.length; i++) {        
		        	if ((allvalue[i].type == "checkbox"))             
		            allvalue[i].checked = false;  	                       
    			}  
    			checkflag=false;
			}
		}
	</script>
	<script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script>
</head>
  
 <!-- html自动调用JS中的函数 --><!-- onload="checkBoxSelect()" -->
<body >
    <br/>
	<!-- 所有菜品显示列表 -->
    <form  name="importReplenishDishForm" method="post" enctype="multipart/form-data" >

    	所属校区：<input type="text" name = "campusName" value="${muserItems.campusName }" readonly="readonly">
    	所属食堂：<input type="text" name = "cantName" value="${muserItems.cantName }" readonly="readonly">
    	管理员：<input type="text" name = "muserName" value="${muserItems.muserName }" readonly="readonly">
    	<br/><br/>
    	<fmt:formatDate value="${recordDate}" pattern="yyyy-MM-dd" var="theFormattedDate1"/>
    	 选择要导入到今天记录的日期：<input type="text" name ="recordDate" value="${theFormattedDate1}" placeholder="请在此输入记录日期" class="Wdate"  onClick="WdatePicker()"> 
    	<input type="button" value="选择导入" onClick=getDishInImportReplenishDate()> 
    	<br/><br/>
    	<fmt:formatDate value="${muserItems.muserSubmitDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/> 
                 补录日期：<input type="text" name ="muserSubmitDate" value="${theFormattedDate}" placeholder="请在此输入菜品补录日期" class="Wdate"  onClick="WdatePicker()"> 
    	<br/><br/>
    	<input type="checkbox" id="selectAll" name="selectAll" onclick="getAllDishSelect('dishIDList')">全选
    	<input type="button" value="录入" onClick=getdishImportReplenish() > 
    	<br/>
    	<table  border="1">
    		<tr>
    			<td>选择</td>
    			<td>校区名称</td>
    			<td>食堂名称</td>
    			<td>档口名称</td>
    			<td>菜品类型</td>
    			<td>菜品名称</td>
    			<td>菜品图片</td>
    			<td>菜品价格</td>
    			<td>菜品销售时间</td>
    			<td>菜品销售状态</td>			
    			<td>菜品录入日期</td>
    			<td>菜品录入状态</td>
    			<td>菜品推荐</td>
    			<td>菜品留样</td>
    			<td>菜品合格</td> 			
    		</tr>
			<!-- dishDetailInDateList -->
			<c:forEach items="${dishItemsList }" var="item" varStatus="status">

	    		 <c:choose>
			    	<c:when test="${item.dishInState == '待审核'}">
			    	</c:when>
					<c:otherwise>
						<tr>
							<td><input type="checkbox" name="dishIDList" id="${item.dishID }" value="${item.dishID }" /></td>
							<c:choose >
								<c:when test="${dishDetailInDateList == null }">	
								</c:when>
								<c:otherwise>
									<c:forEach items="${dishDetailInDateList }" var="itemInDate">
										<c:choose>
											<c:when test="${itemInDate.detailDishID == item.dishID }">
												<script> checkBoxSelect("${item.dishID}");</script>		
											</c:when>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						 	<td>${item.campusName }</td>
						   	<td>${item.cantName }</td>
						   	<td>${item.wndName }</td>
						   	<td>${item.dishTypeName }</td>
						   	<td>${item.dishName }</td>
						   	<td>
							   	<c:if test="${item.dishPhoto != null }">
			   						<img src="/upload/pic/${item.dishPhoto }" width=120 height=90/>
			   					</c:if>
		   					</td>
						   	<td>${item.dishPrice }</td>
						   	<td>${item.dishDate }</td>
						   	<td>${item.dishSale }</td>
						   	<td><fmt:formatDate value="${item.dishInDate}" pattern="yyyy-MM-dd" /></td>
						   	<td>${item.dishInState }</td>
						   	<td>${item.dishRecmd }</td>
						   	<td>${item.dishKeep }</td>
						   	<td>${item.dishQuality }</td>	
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
    	</table>
    </form>
</body>
</html>
