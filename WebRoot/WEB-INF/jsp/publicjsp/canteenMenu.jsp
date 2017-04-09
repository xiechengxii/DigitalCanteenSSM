<%@ page contentType="text/html; charset=utf-8" %>

<!-- jQuery支撑 -->
<script src="js/jquery.form.js"></script>
<script src="js/custom.jquery.form.js"></script>
<script src="js/jquery.validate.js"></script>

<script>
    //菜品录入的重复性校验
    function dishImport(){
        jquerySubByFId('dishImportForm', dishImport_callback, null, "json");
    }
    function dishImport_callback(data){
        //如果消息类型为INFO（3），说明已经生成过记录表，跳转到修改页面
        //否则跳转到录入页面
        if(data.resultInfo.type == '3'){
            window.location.href = "modifyRecordDetailDish.action?recordID=" + data.resultInfo.recordID;
        }else if(data.resultInfo.type == '1'){
            window.location.href = "importDish.action?recordID=" + data.resultInfo.recordID;
        }
    }
</script>

<!-- 构建一个Form用于菜品录入的重复性校验 -->
<form id="dishImportForm" name="dishImportForm" action="importRepeatCheck.action" method="post"></form>

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
                <a href="javascript:void(0)" onclick="dishImport()"><FONT style="FONT-FAMILY:黑体">菜品录入</FONT></a>
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
