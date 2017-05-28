<%@ page contentType="text/html; charset=utf-8" %>

<nav class="navbar navbar-default " role="navigation">
    <div class="navbar-all">
        <div class="navbar-header">		
        	<a class="navbar-brand" href="${pageContext.request.contextPath }/backgroundHomepage.action"><FONT style="FONT-FAMILY:楷体">后台管理系统</FONT></a>
        </div>
  	
  		<ul class="nav navbar-nav">
    	    <li>
                <a href="${pageContext.request.contextPath }/backgroundHomepage.action"><FONT style="FONT-FAMILY:黑体">首页</FONT></a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <FONT style="FONT-FAMILY:黑体">菜品管理</FONT>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">                    
                    <li><a href="${pageContext.request.contextPath }/recordExportToExcel.action">菜品导出</a></li>
                    <li class="divider"></li>
                    <li><a href="#">广告推送管理</a></li>                    
                </ul>
            </li>
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
  					<FONT style="FONT-FAMILY:黑体">人员管理</FONT>
  					<b class="caret"></b>
  				</a>
  				<ul class="dropdown-menu">
  					<li><a href="${pageContext.request.contextPath }/findAllMUser.action">用户管理</a></li>
  					<li class="divider"></li>
  					<li><a href="${pageContext.request.contextPath }/addMUser.action">新增用户</a></li>
  				</ul>
  			</li>	  			
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
  					<FONT style="FONT-FAMILY:黑体">预置信息</FONT>
  					<b class="caret"></b>
  				</a>
  				<ul class="dropdown-menu">
  					<li><a href="${pageContext.request.contextPath }/canteenTypePreset.action">预置食堂类型</a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath }/dishTypePreset.action">预置菜品类型</a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath }/campusPreset.action">预置校区</a></li>
  					<li class="divider"></li>
  					<li><a href="${pageContext.request.contextPath }/canteenPreset.action">预置食堂</a></li>	
                    <li class="divider"></li>			
  					<li><a href="${pageContext.request.contextPath }/windowPreset.action">预置档口</a></li>
  					<li class="divider"></li>
  					<li><a href="${pageContext.request.contextPath }/dishPreset.action">预置菜品</a></li>
                    
  				</ul>
  			</li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <FONT style="FONT-FAMILY:黑体">操作日志</FONT>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">日志查看</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <FONT style="FONT-FAMILY:黑体">评论管理</FONT>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath }/commentSelectWindow.action">评论查看</a></li>
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
      

