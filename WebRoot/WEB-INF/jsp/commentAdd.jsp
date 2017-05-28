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
        
        <title>添加评论</title>
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
    </head>
    
    <body>
  	    <script type="text/javascript">
  	    	/* 得到系统格式化的日期 */
	    	function insertCommentInWindow(form) {
	    	    document.commentInsertForm.action="insertCommentInWindow.action";
            	document.commentInsertForm.submit(); 
	    	}
  	    </script>
  	    
        <div class="container-fluid">
            <div class="container col-sm-6 col-sm-offset-3">
                <div class="panel panel-default">
									
                    <div class="panel-heading">
                        <h3 class="panel-title">${windowItems.wndName }</h3>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <form class="form-horizontal" role="form" name="commentInsertForm" method="post">
                                <input name="cmtWndID" type="hidden" value="${windowItems.wndID }">
								<input name="cmtUserID" type="hidden" value="${userItems }">
								<input name="cmtDate" type="hidden" value="${cmtDate }">
                                <div class="form-group">                                       	                        	        
                                    <label class="col-sm-2 control-label">总分</label>
                                    <div class="col-sm-9">    
                            	        <input type="text" class="form-control" name="cmtScore">
                                    </div>
                                </div>    
                                <div class="form-group">       
                                    <label class="col-sm-2 control-label">评论内容</label>
                                    <div class="col-sm-9 ">    
                                        <input type="text" class="form-control" name="cmtContent">
                                    </div>                                    
                                </div>                         
                                <div class="form-group">    
                                    <div class="col-sm-2 col-sm-offset-5">                            	       
                            	        <input type="submit" class="btn btn-primary" value="发布" onclick=insertCommentInWindow()>
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
