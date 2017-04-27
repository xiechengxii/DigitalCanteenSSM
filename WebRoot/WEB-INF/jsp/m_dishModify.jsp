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
        <script src="././My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
    <!-- <div class="container"> -->
        <!-- <div class="mp-pusher" id="mp-pusher"> -->             
            <!-- <div class="scroller" style="background:#EEEEEE"> -->
                <!-- <div class="scroller-inner"> -->
                    <div class="codrops-header" style="background:#29C192;">
                        <div class="back-container">
                            <button class="btn btn-link btn-lg" >
                                <a style="color:#fff" class="icon icon-arrow-left" data-ajax="false" href="${pageContext.request.contextPath }/findDishInCanteen.action"></a>
                            </button>    
                        </div>
                        <p style="width:100%;height:100%;font-size:27px">修改菜品</p>  
                    </div>

                    <div class=" newcustom" style="margin-top:77px" >
                        <form  name = "dishUpdateForm" class="form-horizontal" role="form" action="modifyDishSave.action" method="post" enctype="multipart/form-data">
                            <input name="dishID" type="hidden" value="${dishItems.dishID }">
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">档口</label>
                                    <div class="col-xs-7">
                                        <select name="dishWndID" class="form-control select select-primary mrs mbm">
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
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label  class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">菜品类型</label>
                                    <div class="col-xs-7">
                                    <select name="dishTypeID" class="form-control select select-primary mrs mbm">
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
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group"> 
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品</label>
                                    <div class="col-xs-7">
                                    <select name="dishName" class="form-control select select-primary mrs mbm">
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
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">菜品图片</label>
                                <div class="col-xs-7">
                                    <c:if test="${dishItems.dishPhoto != null }">
                                        <img src="/upload/pic/${dishItems.dishPhoto }" height="80" width="80"/>
                                        <br>
                                    </c:if>
                                    <a href="javascript:;" class="file" style="font-size:15px;">选择文件
                                    <input type="file" name="dishPhotoFile"/>
                                    </a>
                                </div>
                            </div>  
                            <br>
                            <div class="row form-group"> 
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品价格</label>
                                <div class="col-xs-7">
                                    <input type="text" class="form-control" placeholder="请在此输入菜品价格" name="dishPrice" value="${dishItems.dishPrice }">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品日期</label>
                                <div class="col-xs-7">
                                    <fmt:formatDate value="${dishItems.dishInDate}" pattern="yyyy-MM-dd" var="theFormattedDate"/> 
                                    <input type="text" name ="dishInDate" value="${theFormattedDate}" class="Wdate form-control"  onClick="WdatePicker()">
                                </div>
                            </div>                         
                            <br>
                            <div class="row form-group">
                                <label  class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left;padding-left:8%; line-height:34px;">菜品推荐</label>
                                    <div class="col-xs-7">
                                    <select name="dishRecmd" class="form-control select select-primary mrs mbm">
                                        <c:choose>
                                            <c:when test="${dishItems.dishRecmd == '是' }">
                                                <option value="是" selected="selected">是</option>
                                                <option value="否">否</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="否" selected="selected">否</option>
                                                <option value="是" >是</option>
                                            </c:otherwise>    
                                        </c:choose>
                                    </select>
                                    </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品留样</label>  
                                <div class="col-xs-7">
                                    <select name="dishKeep" class="form-control select select-primary mrs mbm">
                                        <c:choose>
                                            <c:when test="${dishItems.dishKeep == '是' }">
                                                <option value="是" selected="selected">是</option>
                                                <option value="否">否</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="否" selected="selected">否</option>
                                                <option value="是" >是</option>
                                            </c:otherwise>    
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">  
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品质量</label>
                                <div class="col-xs-7">
                                    <select name="dishQuality" class="form-control select select-primary mrs mbm">
                                        <c:choose>
                                            <c:when test="${dishItems.dishQuality == '优' }">
                                                <option value="优" selected="selected">优</option>
                                                <option value="良">良</option>
                                                <option value="中">中</option>
                                                <option value="差">差</option>
                                            </c:when>
                                            <c:when test="${dishItems.dishQuality == '良' }">
                                                <option value="优">优</option>
                                                <option value="良" selected="selected">良</option>
                                                <option value="中">中</option>
                                                <option value="差">差</option>
                                            </c:when>
                                            <c:when test="${dishItems.dishQuality == '中' }">
                                                <option value="优">优</option>
                                                <option value="良">良</option>
                                                <option value="中" selected="selected">中</option>
                                                <option value="差">差</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="优">优</option>
                                                <option value="良">良</option>
                                                <option value="中">中</option>
                                                <option value="差" selected="selected">差</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>    
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品录入状态</label>
                                <div class="col-xs-7">
                                    <input type="text" class="form-control" name="dishInState" value="${dishItems.dishInState }" readonly="readonly">
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品销售状态</label>
                                <div class="col-xs-7">
                                    <select name="dishSale" class="form-control select select-primary mrs mbm">
                                        <c:choose>
                                            <c:when test="${dishItems.dishSale ==  '在售' }">
                                                <option value="在售" selected="selected">在售</option>
                                                <option value="未售">未售</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="在售">在售</option>
                                                <option value="未售" selected="selected">未售</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row form-group">       
                                <label class="col-xs-4 control-label" style="color:black;font-size:15px;height:34px; text-align:left; padding-left:8%;line-height:34px;">菜品销售时间</label> 
                                <div class="col-xs-7">
                                    <select name="dishDate" class="form-control select select-primary mrs mbm">
                                        <c:choose>
                                            <c:when test="${dishItems.dishDate == '早上'}">
                                                <option value="早上" selected="selected">早上</option>
                                                <option value="中午">中午</option>
                                                <option value="晚上">晚上</option>
                                            </c:when>
                                            <c:when test="${dishItems.dishDate == '中午'}">
                                                <option value="早上">早上</option>
                                                <option value="中午" selected="selected">中午</option>
                                                <option value="晚上">晚上</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="早上">早上</option>
                                                <option value="中午">中午</option>
                                                <option value="晚上" selected="selected">晚上</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select> 
                                </div> 
                            </div>
                            <br>
                            
                            <div align="center">
                                <input type="submit" class="btn btn-primary" value="保存" onClick="return check(dishInsertForm)">
                            </div>
                        </form>
                    </div>
                <!-- </div> -->
            <!-- </div> -->
        <!-- </div> -->
    <!-- </div> -->
    <script src="js/classie.js"></script>
    <script src="js/mlpushmenu.js"></script>
    <script>
        new mlPushMenu( document.getElementById( 'mp-menu' ), document.getElementById( 'trigger' ) );
    </script>
    </body>
</html>
