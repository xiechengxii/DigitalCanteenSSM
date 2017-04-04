<%@ page contentType="text/html; charset=utf-8" %>

<nav class="navbar navbar-default " role="navigation">
	<div class="navbar-all">

		<div class="navbar-header">		
        	<a class="navbar-brand" href="${pageContext.request.contextPath }/muserCanteenHostPage.action"><FONT style="FONT-FAMILY:楷体">食堂管理系统</FONT></a>
        </div>

        <ul class="nav navbar-nav">
        	<li>
                <a href="${pageContext.request.contextPath }/muserCanteenHostPage.action"><FONT style="FONT-FAMILY:黑体">首页</FONT></a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath }/importDish.action"><FONT style="FONT-FAMILY:黑体">菜品录入</FONT></a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath }/importReplenishDish.action"><FONT style="FONT-FAMILY:黑体">菜品补录</FONT></a>
            </li>

        	<li class="dropdown">
  				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
  					<FONT style="FONT-FAMILY:黑体">菜品管理</FONT>
  					<b class="caret"></b>
  				</a>
  				<ul class="dropdown-menu">
  					<li><a href="${pageContext.request.contextPath }/addDish.action">菜品上架</a></li>
  					<li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath }/findDishInCanteen.action">查看已有菜品</a></li>
  				</ul>
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
