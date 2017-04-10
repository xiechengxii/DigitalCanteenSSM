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
        <title>修改管理员账户</title>
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

  	    <script>   
  	    	function checkRoleID(){
            var objForm = document.forms["muserUpdateForm"];
            <c:if test="${muserItems.roleID == 1 or muserItems.roleID == 2}">
                objForm.muserCampusID.style.display="none";
                objForm.muserCantID.style.display="none";
                document.getElementById("campusLabel").style.display="none";
                document.getElementById("canteenLabel").style.display="none";
            </c:if>
            }
            
            function selectRole(objValue){
                var objForm = document.forms["muserUpdateForm"];
                
                if(objValue == ""){
                    objForm.muserCampusID.disabled = true;
                    objForm.muserCantID.disabled = true;
                }else if(objValue != 3){        
                    <c:forEach items="${campusList }" var="item" >  
                        var optionObj = document.createElement("option");                           
                        optionObj.text = "${item.campusName }";
                        optionObj.value = "${item.campusID }";
                        optionObj.selected = true;
                        objForm.muserCampusID.add(optionObj);              
                    </c:forEach>
                    <c:forEach items="${canteenItemsList }" var="item" > 
                        var optionObj = document.createElement("option"); 
                        optionObj.text = "${item.cantName }";
                        optionObj.value = "${item.cantID }";
                        optionObj.selected = true;
                        objForm.muserCantID.add(optionObj);                            
                    </c:forEach> 
                    objForm.muserCampusID.style.display="none";
                    objForm.muserCantID.style.display="none";
                    document.getElementById("campusLabel").style.display="none";
                    document.getElementById("canteenLabel").style.display="none";

                        
                }
                else{           
                    objForm.muserCampusID.style.display="inline-table";
                    objForm.muserCantID.style.display="inline-table";
                    document.getElementById("campusLabel").style.display="inline-table";
                    document.getElementById("canteenLabel").style.display="inline-table";

                    
                    objForm.muserCampusID.disabled = false;     
                    objForm.muserCampusID.options.length = 0;
                    
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属校区";
                    optionObj.value = "0";
                    objForm.muserCampusID.add(optionObj);
                    
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属食堂";
                    optionObj.value = "0";
                    optionObj.selected = true;
                    objForm.muserCantID.add(optionObj);
                    
                    <c:forEach items="${campusList }" var="item" >      
                        var optionObj = document.createElement("option");                           
                        optionObj.text = "${item.campusName }";
                        optionObj.value = "${item.campusID }";
                        objForm.muserCampusID.add(optionObj);                
                    </c:forEach>
                }
            }
            
            function getCanteen(objValue)
            {   
                var objForm = document.forms["muserUpdateForm"];
            
                if(objValue == ""){
                    objForm.muserCantID.disabled = true;
                }else{                  
                    objForm.muserCantID.disabled = false; 
                    objForm.muserCantID.options.length = 0; 
                    
                    var optionObj = document.createElement("option");
                    optionObj.text = "请选择添加的管理员的所属食堂";
                    optionObj.value = "0";
                    objForm.muserCantID.add(optionObj);
                    
                    <c:forEach items="${canteenItemsList }" var="item" >    
                        var cantCampusID = ${item.cantCampusID };                    
                        if( cantCampusID == Number(objValue)){  
                            /* 把var optionObj = document.createElement("option")放在循环外，则只出现一次值 */
                            var optionObj = document.createElement("option");               
                            optionObj.text = "${item.cantName }";
                            optionObj.value = "${item.cantID }";
                            objForm.muserCantID.add(optionObj);
                        }  
                    </c:forEach>
                }
            }
  	    </script>
  	    <script src="././My97DatePicker/WdatePicker.js"></script>
    </head>
    <body onLoad="checkRoleID()">
    <div class="container">
        <div class="mp-pusher" id="mp-pusher">             
            <div class="scroller" style="background:#EEEEEE">
                <div class="scroller-inner">
                    <header class="codrops-header" style="background:#29C192;padding-top:22px;">
                        <div class="row">
                            <button class="btn btn-lg" style="position:relative;right:48%;padding:0 0;background-color:#29C192";>
                                <a style="color:#fff" class="icon icon-arrow-left" data-ajax="false" href="${pageContext.request.contextPath }/findAllMUser.action"></a>
                            </button>    
                            <h1>修改账户</h1>
                        </div>  
                    </header>

                    <div class="content clearfix" style="margin-top:77px">
                        <form  name = "muserUpdateForm" class="form-horizontal" role="form" action="modifyMUserSave.action" method="post" enctype="multipart/form-data">
                            <input name="muserID" type="hidden" value="${muserItems.muserID }">
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">管理员类型</label>
                                    <div class="col-xs-8">
                                        <select name="muserRoleID" class="form-control select select-primary mrs mbm" onchange="selectRole(this.value)">
                                        <c:forEach items="${roleList }" var="item" >
                                              <c:choose>
                                                <c:when test="${muserItems.roleID == item.roleID }">
                                                    <option value="${item.roleID }" selected="selected">${item.roleName }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.roleID }">${item.roleName }</option>
                                                </c:otherwise>
                                            </c:choose>        
                                        </c:forEach>
                                        </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label id="campusLabel" class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">管理员校区</label>
                                    <div class="col-xs-8">
                                    <select name="muserCampusID" class="form-control select select-primary mrs mbm" onchange="getCanteen(this.value)" >
                                        <c:forEach items="${campusList }" var="item">
                                              <c:choose>
                                                <c:when test="${muserItems.muserCampusID == item.campusID }">
                                                    <option value="${item.campusID }" selected="selected">${item.campusName }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.campusID }">${item.campusName }</option>
                                                </c:otherwise>
                                            </c:choose>        
                                        </c:forEach>
                                    </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group"> 
                                <label class="col-xs-4 control-label" id="canteenLabel" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">管理员食堂</label>
                                    <div class="col-xs-8">
                                    <select name="muserCantID" class="form-control select select-primary mrs mbm">
                                        <c:forEach items="${canteenItemsList }" var="item" >
                                              <c:if test="${muserItems.muserCampusID == item.cantCampusID }">
                                                <c:choose>
                                                    <c:when test="${muserItems.muserCantID == item.cantID }">
                                                        <option value="${item.cantID }" selected="selected">${item.cantName }</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${item.cantID }">${item.cantName }</option>
                                                    </c:otherwise>
                                                </c:choose>  
                                              </c:if>       
                                        </c:forEach>
                                    </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group"> 
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">用户名</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员名字" name="muserName" value="${muserItems.muserName }">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group"> 
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">密码</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员密码" name="muserPwd" value="${muserItems.muserPwd }">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">联系电话</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员电话" name="muserTel" value="${muserItems.muserTel }">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">Email</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control" placeholder="请在此输入管理员Email" name="muserEmail" value="${muserItems.muserEmail }">
                                </div>
                            </div>
                             <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">照片</label>
                                <div class="col-xs-8">
                                    <c:if test="${muserItems.muserPhoto != null }">
                                        <img name="muserImageId" src="/upload/pic/${muserItems.muserPhoto }" height="80" width="80"/>
                                        <br/>
                                    </c:if>
                                    <a href="javascript:;" class="file" style="font-size:15px;">选择文件
                                    <input type="file" name="muserPhotoFile"/>
                                    </a>
                                </div>
                            </div>  
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">注册日期</label>
                                <div class="col-xs-8">
                                    <fmt:formatDate value="${muserItems.muserRegDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/> 
                                    <input type="text" class="form-control" name="muserRegDate" value="${theFormattedDate}" readonly=true> 
                                </div>
                            </div>                         
                            <br>
                            <div align="center">
                                <input type="submit" class="btn btn-primary" value="保存">
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
    </body>
</html>
