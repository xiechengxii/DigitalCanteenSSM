<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

        <nav class="st-menu st-effect-3" id="menu-3" data-sidenav data-sidenav-toggle="#sidenav-toggle">
            <div class="sidenav-brand">
                BRAND
            </div>
            <ul class="sidenav-menu">

            <li>
            <a href="javascript:;" data-sidenav-dropdown-toggle>
              <span class="sidenav-link-icon">
                <i class="material-icons">store</i>
              </span>

              <span class="sidenav-link-title">预置信息</span>
              <span class="sidenav-dropdown-icon show" data-sidenav-dropdown-icon>
                <i class="material-icons">arrow_drop_down</i>
              </span>
              <span class="sidenav-dropdown-icon" data-sidenav-dropdown-icon>
                <i class="material-icons">arrow_drop_up</i>
              </span>
            </a>

            <ul class="sidenav-dropdown" data-sidenav-dropdown>
                    <li><a href="${pageContext.request.contextPath}/campusPreset.action">预置校区</a></li>
                    <li><a href="${pageContext.request.contextPath}/canteenTypePreset.action">预置食堂类型</a></li>
                    <li><a href="${pageContext.request.contextPath}/canteenPreset.action">预置食堂</a></li>           
                    <li><a href="${pageContext.request.contextPath}/windowPreset.action">预置档口</a></li>           
                    <li><a href="${pageContext.request.contextPath}/dishTypePreset.action">预置菜品类型</a></li>
                    <li><a href="${pageContext.request.contextPath}/dishPreset.action">预置菜品</a></li>
            </ul>
            </li>

            </ul>
        </nav>

    



