<%@page import="Enity.ParentAge"%>
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
            <div class="tenho" style="font-weight: bold;margin-left: 60%;font-size: 30px;">
                <%
                    ParentAge par=(ParentAge)session.getAttribute("Parentage");
                    Account acc=(Account)session.getAttribute("Account");
                %>
                <%=par.getName() %>
            </div> 
        </div>
        <div class="app-header-right">
            <div class="header-btn-lg pr-0">
                <div class="widget-content p-0">
                    <div class="widget-content-wrapper">
                        <div class="widget-content-left">
                            <div class="btn-group">
                                <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0">
                                    <img width="42" class="rounded-circle" src="assets/images/avatars/a.jpg" alt="">
                                    <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                </a>
                                <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                    <button type="button" tabindex="0" class="dropdown-item"><a href="UserAction?page=Info&">Thông tin</a></button>
                                    <button type="button" tabindex="0" class="dropdown-item"><a href="changepw.jsp">Đổi mật khẩu</a></button>
                                    <button type="button" tabindex="0" class="dropdown-item"><a href="login.jsp">Đăng xuất</a></button>

                                </div>
                            </div>
                        </div>
                        <div class="widget-content-left  ml-3 header-user-info">
                            <div class="widget-heading">
                                <%=acc.getUserName() %>
                            </div>
                            <!-- <div class="widget-subheading">
                                VP People Manager
                            </div> -->
                        </div>
                        <!-- <div class="widget-content-right header-user-info ml-3">
                            <button type="button" class="btn-shadow p-1 btn btn-primary btn-sm show-toastr-example">
                                <i class="fa text-white fa-calendar pr-1 pl-1"></i>
                            </button>
                        </div> -->
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>