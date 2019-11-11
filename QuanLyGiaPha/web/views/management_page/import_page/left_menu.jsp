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
                <li class="app-sidebar__heading">Dòng họ</li>
                <li>
                    <a href="ParentageInfo?title=parentage_info" class="<%=title.equals("parentage_info")?"mm-active":"" %>">
                        <i class="metismenu-icon pe-7s-notebook"></i>
                        Thông tin dòng họ
                    </a>
                </li>
                <li>
                    <a href="ParentageViewTree?title=parentage_treeview" class="<%=title.equals("parentage_treeview")?"mm-active":"" %>"> 
                        <i class="metismenu-icon pe-7s-network"></i>
                        Quản lý phả đồ
                    </a>
                </li>
                <li>
                    <a href="ListIndividual?title=list_individual" class="<%=title.equals("list_individual")?"mm-active":"" %>">
                        <i class="metismenu-icon pe-7s-album"></i>
                        Danh Sách Thành Viên
                    </a>
                </li>
                <li>
                    <a href="ListAvatar" class="<%=title.equals("list_avatar")?"mm-active":"" %>">
                        <i class="metismenu-icon pe-7s-album"></i>
                        Album Ảnh
                    </a>
                </li>

                <li class="app-sidebar__heading">Tin tức</li>
                <li>
                    <a href="ComingSoon">
                        <i class="metismenu-icon pe-7s-note"></i>
                        Viết bài
                        <i class=""></i>
                    </a>
                </li>
                <li>
                    <a href="ComingSoon">
                        <i class="metismenu-icon pe-7s-helm"></i>
                        Quản lý tin tức
                        <i class=""></i>
                    </a>
                </li>
                
                <li class="app-sidebar__heading">Tin nhắn</li>
                <li>
                    <a href="ComingSoon">
                        <i class="metismenu-icon pe-7s-note">
                        </i>Soạn tin nhắn
                    </a>
                </li>
                <li>
                    <a href="ComingSoon">
                        <i class="metismenu-icon pe-7s-paper-plane">
                        </i>Hộp thư đến
                    </a>
                </li>
                <li>
                    <a href="ComingSoon">
                        <i class="metismenu-icon pe-7s-shuffle">
                        </i>Tin đã gửi
                    </a>
                </li>
                
            </ul>
        </div>
    </div>
</div>