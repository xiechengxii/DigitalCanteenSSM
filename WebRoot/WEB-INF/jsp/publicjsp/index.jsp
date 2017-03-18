<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

        <nav id="mp-menu" class="mp-menu">
					<div class="mp-level">
						<h2  style="font-size:18px; background:#7acfa6">后台管理系统</h2>
						<ul>
							<li >
								<a class="icon icon-display" href="#" style="font-size:17px">菜品管理</a>
								<div class="mp-level">
									<h2 class="icon icon-display" style="padding: 1em 1em 1em 4.5em;font-size:17px; background:rgba(122,207,166,0.95)">菜品管理</h2>
									<ul>
										<li >
											<a class="icon icon-phone" href="${pageContext.request.contextPath }/checkDish.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">菜品导出</a>
										</li>
										<li >
											<a class="icon icon-tv" href="${pageContext.request.contextPath }/checkDish.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">新菜审核</a>
										</li>
										<li >
											<a class="icon icon-camera" href="#" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">广告推送管理</a>									
										</li>
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-news" href="#" style="font-size:17px">人员管理</a>
								<div class="mp-level">
									<h2 class="icon icon-news" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(122,207,166,0.95)">人员管理</h2>
									<ul>
										<li><a href="${pageContext.request.contextPath }/findAllMUser.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">用户管理</a></li>
										<li><a href="${pageContext.request.contextPath }/addMUser.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">新增用户</a></li>
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-news" href="#" style="font-size:17px">预置信息</a>
								<div class="mp-level">
									<h2 class="icon icon-news" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(122,207,166,0.95)">预置信息</h2>
									<ul>
										<li><a href="${pageContext.request.contextPath }/canteenTypePreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置食堂类型</a></li>
		                                <li><a href="${pageContext.request.contextPath }/dishTypePreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置菜品类型</a></li>       
							            <li><a href="${pageContext.request.contextPath }/campusPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置校区</a></li>
							  		    <li><a href="${pageContext.request.contextPath }/canteenPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置食堂</a></li>			          		
							  	        <li><a href="${pageContext.request.contextPath }/windowPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置档口</a></li>	  		 
							  		    <li><a href="${pageContext.request.contextPath }/dishPreset.action" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">预置菜品</a></li>	 
									</ul>
								</div>
							</li>
							<li >
								<a class="icon icon-shop" href="#" style="font-size:17px">操作日志</a>
								<div class="mp-level">
									<h2 class="icon icon-shop" style="padding: 1em 1em 1em 4.5em;font-size:17px;background:rgba(122,207,166,0.95)">操作日志</h2>
									<ul>
										<li >
											<a class="icon icon-t-shirt" href="#" style="padding: 1em 1em 1em 4.5em;font-weight:300;font-size:15px;color:#484848">日志查看</a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<button style="position:absolute;left:20px;top:93%;border:none"><a href="${pageContext.request.contextPath }/logout.action"><span style="font-size:15px;color:#000000;">注销</span></a></button>
				</nav>

    


