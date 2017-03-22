<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

        <nav id="mp-menu" class="mp-menu">
					<div class="mp-level">
						<h2  style="font-size:18px; background:#7acfa6">食堂管理系统</h2>
						<ul>
						    <li >
								<a class="icon icon-shop" href="${pageContext.request.contextPath }/muserCanteenHostPage.action" style="font-size:17px">首页</a>
							</li>
							<li >
								<a class="icon icon-news" href="${pageContext.request.contextPath }/importDish.action" style="font-size:17px">菜品录入</a>
							</li>
							<li >
								<a class="icon icon-news" href="${pageContext.request.contextPath }/importReplenishDish.action" style="font-size:17px">菜品补录</a>
							</li>
							<li >
								<a class="icon icon-news" href="#" style="font-size:17px">菜品管理</a>
								<div class="mp-level">
									<h2 class="icon icon-news" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(122,207,166,0.95)">菜品管理</h2>
									<ul>
										<li><a href="${pageContext.request.contextPath }/addDish.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">菜品上架</a></li>
		                                <li><a href="${pageContext.request.contextPath }/applyDish.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">申请新菜</a></li>       
							            <li><a href="${pageContext.request.contextPath }/findDishInCanteen.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">查看已有菜品</a></li>	 
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<button style="position:absolute;left:20px;top:80%;border:none"><a href="${pageContext.request.contextPath }/logout.action"><span style="font-size:15px;color:#000000;">注销</span></a></button>
				</nav>

    



