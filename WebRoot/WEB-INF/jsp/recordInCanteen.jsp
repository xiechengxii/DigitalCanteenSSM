<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.*"%>

<% 
SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
String dateStr = dateformat.format(System.currentTimeMillis());
%>
   
<!-- 一个食堂下的所有菜品录入记录 -->
<table class="table table-striped table-bordered table-hover table-responsive text-center">
    <thead>
	    <tr>
	    	<th style='text-align: center;'>校区</th>
	    	<th style='text-align: center;'>食堂</th> 
	    	<th style='text-align: center;'>操作人</th> 
	    	<th style='text-align: center;'>日期</th> 
	    	<th style='text-align: center;'>提交状态</th> 
	    	<th style='text-align: center;'>编辑</th>  			
	    </tr>
    </thead>
    <tbody> 
    	<!-- 系统今日日期 -->
    	<c:set var="nowDate" value="<%=dateStr%>"></c:set>   	
	    <c:forEach items="${pagehelper.list }" var="item">
	        <tr>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordCampusName }</td>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordCantName }</td>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordMUserName }</td>
	        	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></td>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td>
	        	<td style='vertical-align: middle;text-align: center;'>
                    <div class="form-group btn-group btn-group-sm">
                    	<!-- 读取record录入日期，控制用户只能修改当日录入记录 -->
    					<c:set var="recordDate">
        					<fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" />
        				</c:set>        				          	
                        <c:if test="${recordDate eq nowDate}">
                        	<!-- 录入和修改合并处理 -->
                        	<a href="importDish.action?recordID=${item.recordID}" class="btn btn-info">修改</a>
                    	</c:if>

	        		    <a href="findRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-success">查看</a>
	        	        <a href="deleteRecord.action?recordID=${item.recordID}" class="btn btn-danger">删除</a>
                    </div>
	        	</td>
	        </tr>
        </c:forEach>
    </tbody>
</table>
