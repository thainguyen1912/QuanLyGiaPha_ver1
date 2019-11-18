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
                <li class="app-sidebar__heading">Quản Lý</li>
                <li>
                    <a href="AdminControl?page=list_parentage" class="<%=title.equals("list_parentage")?"mm-active":"" %>">
                        <i class="metismenu-icon pe-7s-notebook"></i>
                        Dòng Họ Đang Quản Lý
                    </a>
                </li>
                <li>
                    <a href="AdminControl?page=process_post" class="<%=title.equals("process_post")?"mm-active":"" %>">
                        <i class="metismenu-icon pe-7s-next-2"></i>
                        Phê Duyệt Bài Viết
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>