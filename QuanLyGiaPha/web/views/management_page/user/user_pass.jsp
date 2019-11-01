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
                                <form class="needs-validation" action="UserAction?page=process_pass" method="post">
                                    <div class="form-row" style="">
                                        <div class="col-md-4 mb-3">
                                        </div>
                                        <div class="col-md-4 mb-3" style="text-align: center">
                                            <h6 class="text-primary">
                                                <%=request.getAttribute("mess")==null?"":request.getAttribute("mess") %>
                                            </h6>
                                        </div>
                                    </div>

                                    <div class="" style="margin-bottom: 4%; width: 30%; margin-left: 36%;">
                                        <div class="mb-5">
                                            <label>Mật Khẩu Cũ</label>
                                            <input style="" type="text" class="form-control" name="old_pass" required>
                                        </div>
                                        <div class="mb-3">
                                            <label>Mật Khẩu Mới</label>
                                            <input style="" type="password" class="form-control" name="new_pass" required>
                                        </div>
                                        <div class="">
                                            <label>Nhập Lại Mật Khẩu Mới</label>
                                            <input type="password" class="form-control" name="renew_pass" required>
                                        </div>
                                    </div>
                                    <button style="margin-left: 45%;" class="btn btn-primary" type="submit">Cập Nhật Thông Tin</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
