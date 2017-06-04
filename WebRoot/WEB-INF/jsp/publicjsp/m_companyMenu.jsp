<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

        <nav id="mp-menu" class="mp-menu">
			<div class="mp-level">
				<h2  style="font-size:18px; background:#29C192">饮食公司管理系统</h2>
				<ul>
				    <li >
						<a class="icon icon-shop" data-ajax="false" href="${pageContext.request.contextPath }/companyHomepage.action" style="font-size:17px">首页</a>
					</li>
					<li >
						<a class="icon icon-news" data-ajax="false" href="${pageContext.request.contextPath }/takeOffShelfPage.action" style="font-size:17px">菜品下架</a>
					</li>
				</ul>
			</div>
			<button style="position:absolute;left:20px;bottom:10%;border:none"><a data-ajax="false" href="${pageContext.request.contextPath }/logout.action"><span style="font-size:15px;color:#000000;">注销</span></a></button>
		</nav>

    



