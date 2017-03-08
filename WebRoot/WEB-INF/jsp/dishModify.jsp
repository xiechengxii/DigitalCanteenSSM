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
        
        <title>修改菜品信息</title>
      
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
            function check(form){
            	if(form.cantCampusID.value == ""){
            		alert("请先选择菜品所在校区！");
            		return false;
            	}
            	if(form.wndCantID.value == ""){
            		alert("请先选择菜品所在食堂！");
            		return false;
            	}
            	if(form.dishWndID.value == ""){
            		alert("请先选择菜品所在档口！");
            		return false;
            	}
            	if(form.wndName.value == ""){
            		alert("请填写菜品名称！");
            		form.wndName.focus();
            		return false;
            	}
            }
    
  	    </script>
  	    <script language="javascript" type="text/javascript" src="././My97DatePicker/WdatePicker.js"></script>
    </head>
    
    <body>
  	<!-- 菜品修改页面 -->
    <form name = "dishUpdateForm" action="modifyDishSave.action" method="post" enctype="multipart/form-data">
    	<input name="dishID" type="hidden" value="${dishItems.dishID }">
   		<!-- 选择菜品所属档口 -->
   		<!-- 遍历所有窗口，找相同的食堂ID，结果为真，则比较传进来的档口ID与菜品所属档口，相同则默认选中，否则添加至下拉框选项 -->
		档口：
		<select name="dishWndID" >
			<c:forEach items="${windowItemsList }" var="item" >
				  <c:choose>
		    		<c:when test="${dishItems.dishWndID == item.wndID }">
		    			<option value="${item.wndID }" selected="selected">${item.wndName }</option>
		    		</c:when>
		    		<c:otherwise>
				        <option value="${item.wndID }">${item.wndName }</option>
				    </c:otherwise>
		    	</c:choose>	       
			</c:forEach>
   		</select>

		<!-- 选择菜品类型  -->
		菜品类型：
		<select name="dishTypeID">		
			<c:forEach items="${dishTypeList }" var="item" >
				<c:choose>
					<c:when test="${dishItems.dishTypeID==item.dishTypeID}">
						<option value="${dishItems.dishTypeID }" selected="selected">${dishItems.dishTypeName }</option>
					</c:when>
					<c:otherwise>
						<option value="${item.dishTypeID }">${item.dishTypeName }</option>
					</c:otherwise>
				</c:choose>				
			</c:forEach>
		</select>
		<!-- 选择菜品  -->
   		菜品：
   		<select name="dishName" >
  			<c:forEach items="${dishPresetList }" var="item" >
	   			<c:choose>
				    <c:when test="${dishItems.dishName == item.dishPresetName }">
		    			<option value="${item.dishPresetName }" selected="selected">${item.dishPresetName }</option>
		    		</c:when>
		    		<c:otherwise>
				        <option value="${item.dishPresetName }">${item.dishPresetName }</option>
				    </c:otherwise>    
				</c:choose>
			</c:forEach>
   		</select>
   		<br><br>
   		<!-- 菜品图片录入 -->		
   		<tr>
   			<td>菜品图片：</td><br/>		
   			<td>
   				<c:if test="${dishItems.dishPhoto != null }">
					<img src="/upload/pic/${dishItems.dishPhoto }" width=160 height=120/>
					<br/>
				</c:if>
   				<input type="file" name="dishPhotoFile"/>
   			</td>
   		</tr>
   		<br><br>
                菜品价格：<input type="text" placeholder="请在此输入菜品价格"      name="dishPrice" value="${dishItems.dishPrice }">
                菜品日期：
        <!-- 日期控件调用，用在填入菜品的日期 -->
        <fmt:formatDate value="${dishItems.dishInDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/> 
        <input type="text" name ="dishInDate" value="${theFormattedDate}" placeholder="请在此输入菜品录入日期" class="Wdate"  onClick="WdatePicker()"> 
        <br><br>
                菜品推荐:
       <select name="dishRecmd" >
   			<c:choose>
			    <c:when test="${dishItems.dishRecmd == 是 }">
	    			<option value="是" selected="selected">是</option>
	    			<option value="否">否</option>
	    		</c:when>
	    		<c:otherwise>
			        <option value="否" selected="selected"}>否</option>
			        <option value="是" >是</option>
			    </c:otherwise>    
			</c:choose>
   		</select>
       
                菜品留样:
        <select name="dishKeep" >
   			<c:choose>
			    <c:when test="${dishItems.dishKeep == 是 }">
	    			<option value="是" selected="selected">是</option>
	    			<option value="否">否</option>
	    		</c:when>
	    		<c:otherwise>
			        <option value="否" selected="selected"}>否</option>
			        <option value="是" >是</option>
			    </c:otherwise>    
			</c:choose>
   		</select>
        <br><br>
                菜品质量：
        <select name="dishQuality">
        	<option value="${dishItems.dishQuality}" selected="selected">${dishItems.dishQuality}</option>
   			<option value="优">优</option>
   			<option value="良">良</option>
   			<option value="中">中</option>
   			<option value="差">差</option>
   		</select>        
                菜品录入状态：<input type="text" name="dishInState" value="${dishItems.dishInState }" readonly="readonly">        
                
        <br><br>
                菜品销售状态：
        <select name="dishSale">
        	<option value="${dishItems.dishSale}" selected="selected">${dishItems.dishSale}</option>
   			<option value="在售">在售</option>
   			<option value="未售">未售</option>
   		</select>        
                菜品销售时间：
        <select name="dishDate">
        	<option value="${dishItems.dishDate}" selected="selected">${dishItems.dishDate}</option>
   			<option value="早上" >早上</option>
   			<option value="中午">中午</option>
   			<option value="晚上">晚上</option>
   		</select>  
   		
        <br><br>    
    	<!-- 菜品保存按钮 -->
    	<input type="submit" value="保存" onClick="return check(dishUpdateForm)">
    </form>
    </body>
</html>
