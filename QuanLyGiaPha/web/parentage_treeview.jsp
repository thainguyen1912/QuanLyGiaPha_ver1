<%@page import="Enity.ParentAge"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    ParentAge par = (ParentAge) session.getAttribute("Parentage");
    request.setAttribute("value", "parentage_treeview");
%>
<!doctype html>
<html lang="en">
    <jsp:include page="import.jsp" />
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="header.jsp" /> 
            <jsp:include page="setting_ui.jsp" />
            <div class="app-main">
                <jsp:include page="left_menu.jsp" />
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="page_title.jsp" />
                        <div class="main-card mb-3 card" style="width: 100%">
                            <div class="tree">
                                <ul>
                                    <li>
                                        <a href="">Parent</a>
                                        <ul>
                                            <li>
                                                <a href="#">Child</a>
                                                <ul>
                                                    <li>
                                                        <a href="#">Grand Child</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Grand Child</a>
                                                        <ul>
                                                            <li>
                                                                <a href="#">Grand Child</a>
                                                                
                                                            </li>
                                                            <li>
                                                                <a href="#">Grand Child</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">Child</a>
                                                <ul>
                                                    <li>
                                                        <a href="#">Grand Child</a>
                                                        <ul>
                                                            <li>
                                                                <a href="#">Grand Grand Child</a>
                                                                <ul>
                                                                    <li>
                                                                        <a href="#">Grand Grand Child</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#">Grand Grand Child</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <a href="#">Grand Child</a>
                                                        <ul>
                                                            <li>
                                                                <a href="#">Grand Grand Child</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="footer.jsp" />
                </div>
            </div>
        </div>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="assets/scripts/main.js"></script>
    </body>
</html>
