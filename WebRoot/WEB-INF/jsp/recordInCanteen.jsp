<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
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
	    <c:forEach items="${dishRecordList }" var="item">
	        <tr>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordCampusName }</td>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordCantName }</td>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordMUserName }</td>
	        	<td style='vertical-align: middle;text-align: center;'><fmt:formatDate value="${item.recordDate}" pattern="yyyy-MM-dd" /></td>
	        	<td style='vertical-align: middle;text-align: center;'>${item.recordSubmitState }</td>
	        	<td style='vertical-align: middle;text-align: center;'>
                    <div class="form-group btn-group btn-group-sm">
                        <a href="modifyRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-info">修改</a>
	        		    <a href="findRecordDetailDish.action?recordID=${item.recordID}" class="btn btn-success">查看</a>
	        	        <a href="deleteRecord.action?recordID=${item.recordID}" class="btn btn-danger">删除</a>
                    </div>
	        	</td>
	        </tr>
        </c:forEach>
    </tbody>
</table>
