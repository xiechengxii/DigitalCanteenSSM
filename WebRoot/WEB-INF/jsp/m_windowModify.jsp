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
        <title>修改档口信息</title>
      
  	    <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0">   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-    scalable=no,minimal-ui" />
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
  	    
        <script src="js/modernizr.custom.js"></script>
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
  	
    <script>
    	/* 在校区选择之后得到该校区之下的食堂选择框
    		objValue：校区的ID值
    		windowUpdateForm：档口更新表单
    		canteenItemsList：所有食堂信息列表
    		wndCantID：食堂select标签的选择值
    	*/
  		function getCanteen(objValue)
		{	
			var objForm = document.forms["windowUpdateForm"];
		
    		if(objValue == ""){
    			objForm.wndCantID.disabled = true;
    		}else{   			 	
    			objForm.wndCantID.disabled = false; 
    			objForm.wndCantID.options.length = 0; 
    			<c:forEach items="${canteenItemsList }" var="item" >  	
    	 			 var cantCampusID = ${item.cantCampusID };   	 			 
    	 			if( cantCampusID == Number(objValue)){	
    	 				/* 把var optionObj = document.createElement("option")放在循环外，则只出现一次值 */
    	 				var optionObj = document.createElement("option"); 				
	                    optionObj.text = "${item.cantName }";
	                    optionObj.value = "${item.cantID }";
	                    objForm.wndCantID.add(optionObj);
    	 			}  
				</c:forEach>
    		}
		}

        function check(form){
        	if(form.cantCampusID.value == ""){
        		alert("请先选择档口所在校区！");
        		return false;
        	}
        	if(form.wndCantID.value == ""){
        		alert("请先选择档口所在食堂！");
        		return false;
        	}
        	if(form.wndName.value == ""){
        		alert("请填写档口名称！");
        		form.wndName.focus();
        		return false;
        	}
        }
        
  	</script>
    </head>    
    <body>
      <header class="codrops-header" style="background:#29C192;padding-top:22px;">
          <div class="row">
              <button class="btn btn-lg" style="position:relative;right:48%;top:15px;padding:0 0;background-color:#29C192";>
                  <a style="color:#fff" class="icon icon-arrow-left" data-ajax="false" href="${pageContext.request.contextPath }/windowPreset.action"></a>
              </button>    
              <h1>修改预置档口</h1>
          </div>  
      </header>
    <div class=" newcustom" style="margin-top:77px" >
    <form name = "windowUpdateForm" action="modifyWindowSave.action" method="post">
    	<input name="wndID" type="hidden" value="${windowItems.wndID }">
    	<!-- 选择食堂所属校区 -->
      <div align="center">
   		<select name="cantCampusID" onchange="getCanteen(this.value)" data-toggle="select" class="form-control select select-primary mrs mbm">	
   			<c:forEach items="${campusList }" var="item" >
   			<c:choose>
			    <c:when test="${windowItems.campusID == item.campusID }">
			       <option value="${windowItems.campusID }" selected="selected">${windowItems.campusName }</option>
			    </c:when>
			    <c:otherwise>
			        <option value="${item.campusID }">${item.campusName }</option>
			    </c:otherwise>
			 </c:choose>
			 </c:forEach>
   		</select>
      </div>

   		<!-- 选择档口所属食堂 -->
      <div align="center">
   		<select name="wndCantID" data-toggle="select" class="form-control select select-primary mrs mbm">
	   			<c:forEach items="${canteenItemsInCampus }" var="item" >
	   			<c:choose>
				    <c:when test="${wndCantID == item.cantID }">
				       <option value="${windowItems.cantID }" selected="selected">${windowItems.cantName }</option>
				    </c:when>
				    <c:otherwise>
				        <option value="${item.cantID }">${item.cantName }</option>
				    </c:otherwise>
				  </c:choose>
				</c:forEach>
   		</select>
      </div>

   		<!-- 输入档口名称 -->
      <div class="form-group" >

    	<input type="text"  name="wndName" value="${windowItems.wndName }" class="form-control input-sm">

      <div >
        <input type="text"  placeholder="请在此输入档口位置" name="wndAddr" value="${windowItems.wndAddr}" class="form-control input-sm">
      </div>
      <br>
      <div>
        <input type="text" placeholder="请在此输入档口价格范围"   name="wndPriceRange" value="${windowItems.wndPriceRange}" class="form-control input-sm">
      </div>
      <br>
      <div>
        <input type="text" placeholder="请在此输入档口营业时间段" name="wndSaleHours" value="${windowItems.wndSaleHours}" class="form-control input-sm">
      </div>
      <br>
      <div >
        <input type="text" placeholder="请在此输入档口支付方式"   name="wndPayment" value="${windowItems.wndPayment}" class="form-control input-sm">
      </div> 
      <br>
      <div>
        <input type="text" placeholder="请在此输入档口描述"       name="wndDescription" value="${windowItems.wndDescription}" class="form-control input-sm">
      </div>
      <br>
      <div>
        <input type="text" placeholder="请在此输入档口备注"       name="wndNote" value="${windowItems.wndNote}" class="form-control input-sm">
      </div> 
      <br>
    	<!-- 档口添加按钮 -->
    	<div align="center"><input type="submit" value="保存" onClick="return check(windowUpdateForm)" class="btn btn-primary btn-wide" data-role="none"></div>
      </div>
    </form>
  </div>
    </body>
</html>
