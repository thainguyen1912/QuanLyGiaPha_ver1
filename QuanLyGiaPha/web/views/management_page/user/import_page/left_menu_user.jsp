<%@page import="Enity.Account"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String title="";
    try{
        title=request.getAttribute("title").toString();
    }
    catch(Exception e){
        
    }
%>
<div class="app-sidebar sidebar-shadow">
    <div class="app-header__logo">
        <div class="logo-src"></div>
        <div class="header__pane ml-auto">
            <div>
                <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </div>
        </div>
    </div>
    <div class="app-header__mobile-menu">
        <div>
            <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                <span class="hamburger-box">
                    <span class="hamburger-inner"></span>
                </span>
            </button>
        </div>
    </div>
    <div class="app-header__menu">
        <span>
            <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                <span class="btn-icon-wrapper">
                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                </span>
            </button>
        </span>
    </div>
    <div class="scrollbar-sidebar">
        <div class="app-sidebar__inner">
            <ul class="vertical-nav-menu">
                <li class="app-sidebar__heading">Thông Tin</li>
                <li>
                    <a href="UserAction?page=info" class="<%=title.equals("user_info")?"mm-active":"" %>">
                        <i class="metismenu-icon pe-7s-notebook"></i>
                        Thông tin Người Dùng
                    </a>
                </li>
                <li>
                    <a href="UserAction?page=change_pass" class="<%=title.equals("change_pass")?"mm-active":"" %>"> 
                        <i class="metismenu-icon pe-7s-network"></i>
                        Đổi Mật Khẩu
                    </a>
                </li>
                <li>
                    <%
                        Account acc=(Account)session.getAttribute("Account");
                        
                    %>
                    <a href="<%=acc.getUserName().equalsIgnoreCase("admin")?"AdminControl?page=list_parentage":"ParentageInfo" %>" class="<%=title.equals("")?"mm-active":"" %>"> 
                        <i class="metismenu-icon pe-7s-left-arrow"></i>
                        Quay Lại
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>