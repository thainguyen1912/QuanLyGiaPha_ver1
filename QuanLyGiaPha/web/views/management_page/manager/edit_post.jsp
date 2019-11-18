<%@page import="Enity.Post"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Post pos=(Post)request.getAttribute("post");
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
                                        <form class="" style="width: 100%" action="PostControl?page=process_edit" method="post" enctype="multipart/form-data">
                                            <div>
                                                <div style="width: 60%; float: left">
                                                    <div class="position-relative row form-group">
                                                        <label for="title" class="col-sm-2 col-form-label">
                                                            Tiêu Đề
                                                        </label>
                                                        <div class="col-sm-8">
                                                            <input value="<%=pos.getTitle() %>" name="title" id="name" placeholder="" type="text" class="form-control" >
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="summary" class="col-sm-2 col-form-label">
                                                            Tóm Tắt
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=pos.getSummary()%>" name="summary" id="name" placeholder="" type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="detail" class="col-sm-2 col-form-label">
                                                            Chi Tiết
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <textarea rows="20" name="detail" id="moreinfo" class="form-control"><%=pos.getDetail()%></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="width: 40%; float: left">
                                                    <div>
                                                        <div class="file-upload" style="width: 85%;">
                                                            
                                                            <div style="margin-bottom: 10%">
                                                                <img style="max-width: 100%" src="resources/images/<%=pos.getImage()==null?"imagenotfound.png":pos.getImage() %>" alt="your image" />
                                                            </div>
                                                            
                                                            <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger('click')">Chọn Ảnh</button>

                                                            <div class="image-upload-wrap">
                                                                <input class="file-upload-input" type="file" name="avatar" size="50" onchange="readURL(this);" accept="image/*" />
                                                                <div class="drag-text">
                                                                    <h3>
                                                                        Kéo Và Thả một File Vào Đây
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                            <div class="file-upload-content">
                                                                <img class="file-upload-image" src="#" style="max-width: 100%"  alt="your image" />
                                                                <div class="image-title-wrap">
                                                                    <button type="button" onclick="removeUpload()" class="remove-image">Xóa Bỏ  <span class="image-title">Uploaded Image</span></button>
                                                                </div>
                                                            </div>

                                                        </div>
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
