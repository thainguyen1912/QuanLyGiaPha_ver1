<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String value="";
    try{
        value=request.getParameter("value").toString();
        System.out.println(value);
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
                    <a href="parentage_info.jsp?value=parentage_info" class="<%=value.equals("parentage_info")?"mm-active":"" %>">
                        <i class=""></i>
                        Thông tin dòng họ
                    </a>
                </li>
                <li>
                    <a href="Parentage_Treeview?value=parentage_treeview" class="<%=value.equals("parentage_treeview")?"mm-active":"" %>"> 
                        <i class=""></i>
                        Quản lý phả đồ
                    </a>
                </li>
                <li>
                    <a href="index.html" class="">
                        <i class=""></i>
                        Album Ảnh
                    </a>
                </li>

                <li class="app-sidebar__heading">Tin tức</li>
                <li>
                    <a href="#">
                        <i class=""></i>
                        Viết bài
                        <i class=""></i>
                    </a>
                    <!-- <ul
                    >
                        <li>
                            <a href="elements-buttons-standard.html">
                                <i class="metismenu-icon"></i>
                                Buttons
                            </a>
                        </li>
                        <li>
                            <a href="elements-dropdowns.html">
                                <i class="metismenu-icon">
                                </i>Dropdowns
                            </a>
                        </li>
                        <li>
                            <a href="elements-icons.html">
                                <i class="metismenu-icon">
                                </i>Icons
                            </a>
                        </li>
                        <li>
                            <a href="elements-badges-labels.html">
                                <i class="metismenu-icon">
                                </i>Badges
                            </a>
                        </li>
                        <li>
                            <a href="elements-cards.html">
                                <i class="metismenu-icon">
                                </i>Cards
                            </a>
                        </li>
                        <li>
                            <a href="elements-list-group.html">
                                <i class="metismenu-icon">
                                </i>List Groups
                            </a>
                        </li>
                        <li>
                            <a href="elements-navigation.html">
                                <i class="metismenu-icon">
                                </i>Navigation Menus
                            </a>
                        </li>
                        <li>
                            <a href="elements-utilities.html">
                                <i class="metismenu-icon">
                                </i>Utilities
                            </a>
                        </li>
                    </ul> -->
                </li>
                <li>
                    <a href="#">
                        <i class=""></i>
                        Quản lý tin tức
                        <i class=""></i>
                    </a>
                    <!-- <ul
                    >
                        <li>
                            <a href="components-tabs.html">
                                <i class="metismenu-icon">
                                </i>Tabs
                            </a>
                        </li>
                        <li>
                            <a href="components-accordions.html">
                                <i class="metismenu-icon">
                                </i>Accordions
                            </a>
                        </li>
                        <li>
                            <a href="components-notifications.html">
                                <i class="metismenu-icon">
                                </i>Notifications
                            </a>
                        </li>
                        <li>
                            <a href="components-modals.html">
                                <i class="metismenu-icon">
                                </i>Modals
                            </a>
                        </li>
                        <li>
                            <a href="components-progress-bar.html">
                                <i class="metismenu-icon">
                                </i>Progress Bar
                            </a>
                        </li>
                        <li>
                            <a href="components-tooltips-popovers.html">
                                <i class="metismenu-icon">
                                </i>Tooltips &amp; Popovers
                            </a>
                        </li>
                        <li>
                            <a href="components-carousel.html">
                                <i class="metismenu-icon">
                                </i>Carousel
                            </a>
                        </li>
                        <li>
                            <a href="components-calendar.html">
                                <i class="metismenu-icon">
                                </i>Calendar
                            </a>
                        </li>
                        <li>
                            <a href="components-pagination.html">
                                <i class="metismenu-icon">
                                </i>Pagination
                            </a>
                        </li>
                        <li>
                            <a href="components-scrollable-elements.html">
                                <i class="metismenu-icon">
                                </i>Scrollable
                            </a>
                        </li>
                        <li>
                            <a href="components-maps.html">
                                <i class="metismenu-icon">
                                </i>Maps
                            </a>
                        </li>
                    </ul> -->
                </li>
                <!-- <li  >
                    <a href="tables-regular.html">
                        <i class="metismenu-icon pe-7s-display2"></i>
                        Tables
                    </a>
                </li> -->
                <!-- <li class="app-sidebar__heading">Tin nhắn</li>
                <li>
                    <a href="dashboard-boxes.html">
                        <i class="metismenu-icon pe-7s-display2"></i>
                        Dashboard Boxes
                    </a>
                </li> -->
                <li class="app-sidebar__heading">Tin nhắn</li>
                <li>
                    <a href="forms-controls.html">
                        <i class="">
                        </i>Soạn tin nhắn
                    </a>
                </li>
                <li>
                    <a href="forms-layouts.html">
                        <i class="">
                        </i>Hộp thư đến
                    </a>
                </li>
                <li>
                    <a href="forms-validation.html">
                        <i class="">
                        </i>Tin đã gửi
                    </a>
                </li>
                <!-- <li class="app-sidebar__heading">Charts</li>
                <li>
                    <a href="charts-chartjs.html">
                        <i class="metismenu-icon pe-7s-graph2">
                        </i>ChartJS
                    </a>
                </li>
                <li class="app-sidebar__heading">PRO Version</li>
                <li>
                    <a href="https://dashboardpack.com/theme-details/architectui-dashboard-html-pro/" target="_blank">
                        <i class="metismenu-icon pe-7s-graph2">
                        </i>
                        Upgrade to PRO
                    </a>
                </li> -->
            </ul>
        </div>
    </div>
</div>