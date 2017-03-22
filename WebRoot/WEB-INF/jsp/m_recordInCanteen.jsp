<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!-- 一个食堂下的所有菜品录入记录 -->

       <c:forEach items="${pagehelper.list }" var="item">
      
            <div class="row">
                <div  style="color:#000000;font-size:16px;">
                   <div style="position:relative;top:5px;left:5px;">
                      ${item.recordCampusName } &nbsp ${item.recordCantName } &nbsp ${item.recordMUserName } &nbsp
                      <fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /> &nbsp ${item.recordSubmitState }
                   </div>
                </div>
                <br>                
                <div class="form-group btn-group btn-group-sm" style="position:relative;top:18px;left:150px;">
                      <a href="modifyRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-default">修改</a>
                         
                      <a href="findRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-default">查看</a>
                         
	        	      <a href="deleteRecord.action?recordID=${item.recordID}" class="btn btn-default">删除</a>
               </div>                                      
            </div>
             <hr>
            </c:forEach>



