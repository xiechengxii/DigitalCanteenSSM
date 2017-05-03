<%@ page contentType="text/html; charset=utf-8" %>

<nav class="navbar navbar-default " role="navigation">
	<div class="navbar-all">

		<div class="navbar-header">		
        	<a class="navbar-brand" href="${pageContext.request.contextPath }/companyHomepage.action"><FONT style="FONT-FAMILY:楷体">饮食公司管理系统</FONT></a>
        </div>

        <ul class="nav navbar-nav">

        	<li>
                <a href="${pageContext.request.contextPath }/companyHomepage.action"><FONT style="FONT-FAMILY:黑体">首页</FONT></a>
            </li>

            <li>
                <a href="javascript:void(0)"><FONT style="FONT-FAMILY:黑体">菜品下架</FONT></a>
            </li>

        </ul>

        <div class="collapse navbar-collapse" id="example-navbar-collapse">
    	    <ul class="nav navbar-nav navbar-right">
    	        <li class="dropdown">
    	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
    	                <FONT style="FONT-FAMILY:楷体"><span class="glyphicon glyphicon-user"></span>&nbsp;${muserItems.muserName} </FONT>
    	                <b class="caret"></b>
    	            </a>
    	            <ul class="dropdown-menu">
    	                <li><a href="${pageContext.request.contextPath }/profileEdit.action?muserID=${muserItems.muserID}">账户信息</a></li>
    	                <li class="divider"></li>
    	                <li><a href="${pageContext.request.contextPath }/logout.action">注销</a></li>
    	            </ul>
    	        </li>
    	    </ul>
  		</div>
	</div>
</nav>
