<%@page import="Enity.Account"%>
<%@page import="Enity.Parentage"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Account acc = (Account) session.getAttribute("Account");
%>
<!doctype html>
<html lang="en">
    <jsp:include page="../import_page/import.jsp" flush="true"/>
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="../import_page/header.jsp" flush="true"/>
            <jsp:include page="../import_page/setting_ui.jsp" flush="true"/>
            <div class="app-main">
                <jsp:include page="../import_page/left_menu.jsp" flush="true"/>
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="../import_page/page_title.jsp" flush="true"/>
                        <div class="main-card mb-3 card" style="width: 100%">
                            <div class="card-body">
                                <div class="position-relative form-row" style="margin-bottom: 4%">
                                    <div class="col-md-3 mb-2 mr-2">
                                        <label>Tên Tài Khoản</label>
                                        <hr>
                                        <p><%=acc.getUserName()%></p>
                                    </div>
                                    <div class="col-md-3 mb-2 mr-2">
                                        <label>Ngày Đăng Ký</label>
                                        <hr>
                                        <p><%=acc.getDateCreate()%></p>
                                    </div>
                                    <div class="col-md-3 mb-2 mr-2">
                                        <label>Quyền Hạn</label>
                                        <hr>
                                        <p><%=acc.getRole()==1?"Tạo Lập Gia Phả":"Admin Quản Trị"%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
