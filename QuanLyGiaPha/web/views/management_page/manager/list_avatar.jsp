<%@page import="Enity.Image"%>
<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.Individual"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Enity.Parentage"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    ArrayList<Image> arr_ava = (ArrayList<Image>) request.getAttribute("arr_ava");
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
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-card mb-3 card">
                                    <div class="card-body">
                                        <div class="file-upload mb-4" style="width: 100%;margin: 0px;">
                                            <form action="UploadAvatar" method="post" enctype="multipart/form-data">
                                                <button hidden="true" class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger('click')"></button>

                                                <div class="image-upload-wrap">
                                                    <input class="file-upload-input" type="file" name="avatar" size="50" onchange="readURL(this);" accept="image/*" />
                                                    <div class="drag-text">
                                                        <h5>
                                                            Thêm ảnh
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="file-upload-content" style="overflow: auto; width: 100%">
                                                    
                                                    <img class="file-upload-image" src="#" style="width: 28%; float: left; margin: 20px"  alt="your image" />
                                                    
                                                    <div class="image-title-wrap" style="padding: 0px; float: left; width: 67%">
                                                        <div class="" style="margin-bottom: 10px">
                                                            <textarea rows="10" name="note" id="moreinfo" class="form-control" placeholder="ghi chú.."></textarea>
                                                        </div>
                                                        <button type="button" onclick="removeUpload()" class="remove-image">Xóa Bỏ</button>
                                                        <!--<span class="image-title">Uploaded Image</span>-->
                                                        <button type="submit" class="file-upload-btn mt-2">Thêm</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="row" style="clear: both">
                                            <%
                                                if (arr_ava.size() == 0) {
                                            %>
                                            <h5 style="color: red">Không Có Ảnh Nào Để Hiển Thị</h5>
                                            <%}%>
                                            <%
                                                for (int i = 0; i < arr_ava.size(); i++) {
                                            %>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card">
                                                    <div class="widget-content">
                                                        <div class="widget-content-outer" style="text-align: center">
                                                            <div class="widget-content-wrapper">
                                                                <div class="">
                                                                    <%
                                                                        boolean check = true;
                                                                        if (arr_ava.get(i).getUrl()== null || arr_ava.get(i).getUrl().equals("")) {
                                                                            check = false;
                                                                        }
                                                                    %>
                                                                    <img src="resources/images/avatar/<%=check == false ? "imagenotfound.png" : arr_ava.get(i).getUrl()%>" width="100%"> 
                                                                </div>
                                                                <div class="">
                                                                </div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1 mt-2">
                                                                <div class="text-muted opacity-6"><%=arr_ava.get(i).getDateCreate()%></div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1">
                                                                <div class="text-muted opacity-6"><%=arr_ava.get(i).getNote() %></div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1 mt-2" style="">
                                                                <!--<a href="EditIndividual?value=Redirect&idIndividual=<%=arr_ava.get(i).getIdImage()%>"><button class="btn-wide btn btn-success">Xem Chi Tiết</button></a>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%}%>
                                        </div>
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