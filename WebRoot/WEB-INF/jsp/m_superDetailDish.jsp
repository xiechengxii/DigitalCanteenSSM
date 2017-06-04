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
        <title>菜品录入详情</title>
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
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/jquery.mobile-1.4.3.min.js"></script>
        <link rel="stylesheet" href="css/m_bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />
        <link rel="stylesheet" type="text/css" href="css/leftDelete.css"  />
    </head>
  
    <body>
        <div class="container" data-role="page">
            <div class="mp-pusher" id="mp-pusher">             
                <div class="scroller" style="background:#EEEEEE">
                    <div class="scroller-inner">
                        <div class="codrops-header" style="background:#29C192;">
                            <div class="back-container">
                                <button class="btn btn-link btn-lg" >
                                    <a style="color:#fff" class="icon icon-arrow-left" data-ajax="false" href="muserBackground.action?recordCantID=${record.recordCantID}"></a>
                                </button>    
                            </div>
                            <p style="width:100%;height:100%;font-size:27px">菜品录入详情</p>  
                        </div>
        
        
                        <div class="container-fluid" style="color:#000;padding:0 0px;margin-top:66px ">   
                            <form enctype="multipart/form-data">
                                <input type="hidden" name = "recordID" value="${record.recordID} }">
                                <div class="row" style="padding:0 0px;"> 
                                    <div class="form-group">
                                        <div class="item-wrap">
                                            <c:forEach items="${dishDetailList }" var="item" >
                                                <div class="item clearfix">
                                                    <div class="txt-item" style=" margin-right:0px; margin-left:5px;padding-top:5px">
                                                        <table  width=100%>                                                        
                                                            <tr>
                                                                <td style='vertical-align: left;text-align: center;' rowspan=3>
                                                                    <c:if test="${item.detailDishPhoto != null }">
                                                                        <img src="/upload/pic/${item.detailDishPhoto }" class="center-block" height="80" width="80" style="margin-left:20px;margin-right:-50px">
                                                                    </c:if>
                                                                </td>                                                           
                                                                <td style='vertical-align: middle;font-size:1.5em;width:120px' >${item.detailDishName }</td>
                                                                <td style='vertical-align: middle;'>${item.detailDishSale }</td>                                             
                                                            </tr>
                                                            <tr>                                                           
                                                                <td style='vertical-align: middle;font-size:1em'>[${item.detailWndName }]</td>
                                                                <td style='vertical-align: middle;'>${item.detailDishDate } </td> 
                                                            </tr>
                                                            <tr>                          
                                                                <td style='vertical-align: middle;color:#29C192;font-size:1.5em'>￥${item.detailDishPrice }</td>
                                                                <td style='vertical-align: middle;'><fmt:formatDate value="${item.detailDishInDate}" pattern="yyyy-MM-dd" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
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
    </body>
</html>
