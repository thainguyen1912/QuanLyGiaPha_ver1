<%@page import="Enity.Parentage"%>
<%@page import="Enity.Account"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<div class="app-header header-shadow">
    <div class="app-header__logo">
        <div style="width: 200px; height: 17px;" class="logo-src"></div>
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
    <div class="app-header__content">
        <div class="app-header-left" style="width: 75%">
            <div class="tenho" style="font-weight: bold;margin-left: 55%;font-size: 25px;">
                <%
                    Parentage par = null;//cho truong hop trang admin khong co par
                    try {
                        par = (Parentage) session.getAttribute("Parentage");
                    } catch (Exception e) {
                    }
                    Account acc = (Account) session.getAttribute("Account");
                %>
                <%=par == null ? "" : par.getName()%>
            </div> 
        </div>
        <div class="app-header-right">
            <div class="header-btn-lg pr-0">
                <div class="widget-content p-0">
                    <div class="widget-content-wrapper">
                            <div class="widget-content-left">
                                <div class="btn-group">
                                    <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0">
                                        <img width="42" class="rounded-circle" src="resources/assets/images/avatars/user3.png" alt="">
                                        <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                    </a>
                                    <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                        <a href="UserAction?page=info"><button type="button" tabindex="0" class="dropdown-item">Thông tin</button></a>
                                        <a href="UserAction?page=change_pass"><button type="button" tabindex="0" class="dropdown-item">Đổi mật khẩu</button></a>
                                        <a href="UserAction?page=logout"><button type="button" tabindex="0" class="dropdown-item">Đăng xuất</button></a>

                                    </div>
                                </div>
                            </div>
                        <div class="widget-content-left  ml-3 header-user-info">
                            <div class="widget-heading">
                                <%=acc.getUserName()%>
                            </div>

                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>