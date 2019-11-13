<%@page import="java.sql.Blob"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Enity.Individual"%>
<%@page import="Enity.Parentage"%>

<%
%>
<!doctype html>
<html lang="en">
    <jsp:include page="../import_page/import.jsp" flush="true"/>
    <script src="resources/js/upload_image.js"></script>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/upload_image.css">
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="../import_page/header.jsp" flush="true"/> 
            <jsp:include page="../import_page/setting_ui.jsp" flush="true"/>
            <div class="app-main" style="overflow: auto">
                <jsp:include page="../import_page/left_menu.jsp" flush="true"/>
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="../import_page/page_title.jsp" flush="true"/>
                        <div class="tab-content">
                            <div class="tab-pane tabs-animation fade active show" id="tab-content-1" role="tabpanel">
                                <div class="main-card mb-3 card">
                                    <div class="card-body">
                                        <form class="" style="width: 100%" action="Post?page=process" method="post">
                                            <div>
                                                <div style="width: 100%; float: left">
                                                    <div class="position-relative row form-group">
                                                        <label for="title" class="col-sm-2 col-form-label">
                                                            Tiêu Đề
                                                        </label>
                                                        <div class="col-sm-5">
                                                            <input value="" name="title" id="name" placeholder="" type="text" class="form-control" >
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="summary" class="col-sm-2 col-form-label">
                                                            Tóm Tắt
                                                        </label>
                                                        <div class="col-sm-8">
                                                            <input value="" name="summary" id="name" placeholder="" type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="detail" class="col-sm-2 col-form-label">
                                                            Chi Tiết
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <textarea rows="5" name="detail" id="moreinfo" class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-check" style="clear: both">
                                                    <div class="col-sm-10 offset-sm-2">
                                                        <button style="margin-left: 30%;" class="btn btn-primary" type="submit">
                                                            Cập Nhật Thông Tin
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
