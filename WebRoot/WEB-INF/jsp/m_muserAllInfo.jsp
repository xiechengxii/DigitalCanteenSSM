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
        <title>账户管理</title>
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
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
    </head>
  
    <body>
    <div class="container">
        <div class="mp-pusher" id="mp-pusher">
        <%@ include file="publicjsp/index.jsp" %>               
            <div class="scroller" style="background:#EEEEEE">
                <div class="scroller-inner">
                    <header class="codrops-header" style="background:#29C192">
                        <div class="row">
                         <div id="trigger" class="burger-container">
                            <span class="burger-bun-top"></span>
                            <span class="burger-filling"></span>
                            <span class="burger-bun-bot"></span>
                         </div>                 
                        <h1>账户管理</h1>
                        </div>
                    </header>

    	            <div class="container-fluid" style="padding:0 0px;">
                    <form role="form" name="muserForm" enctype="multipart/form-data">
                    	<div class="row" style="padding:0 0px;">
                            <div class="form-group">
                                <div class="item-wrap">
                    		    <c:forEach items="${muserItemsList }" var="item" >
                                    <div  id="view" class="item clearfix">
                                        <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
                                            <table width=100% onclick="location.href='modifyMUser.action?muserID=${item.muserID}';">
	                    	    	            <tr>
	                	        	            	<td style='vertical-align: middle;text-align: center;' rowspan=2>
	                		    	               		<c:if test="${item.muserPhoto != null }">
	                		    	               			<img src="/upload/pic/${item.muserPhoto }" class="center-block" height="80" width="80"/>
	                		    	               		</c:if>
	                		    	               	</td>
                                                    <td style='vertical-align: middle;font-size:1.5em'>${item.muserName }</td>
                                                    <td style='vertical-align: middle;'>${item.roleName }</td>
                                                    <td style='vertical-align: middle;'><fmt:formatDate value="${item.muserRegDate}" pattern="yyyy-MM-dd" /></td>
	                    	    	            </tr>
                                                <tr>
                                                    <td style='vertical-align: middle;' colspan=2>${item.muserTel }</td>
                                                    <td style='vertical-align: middle;'>${item.muserEmail }</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <a class="delect-btn">删除</a>
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
    </script>
    </body>
</html>