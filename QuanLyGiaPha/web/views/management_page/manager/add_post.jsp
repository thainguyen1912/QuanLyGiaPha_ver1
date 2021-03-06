<%@ page contentType="text/html; charset=UTF-8" %>
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
                                        <form class="" style="width: 100%" action="PostControl?page=process_add" method="post" enctype="multipart/form-data">
                                            <div>
                                                <div style="width: 60%; float: left">
                                                    <div class="position-relative row form-group">
                                                        <label for="title" class="col-sm-2 col-form-label">
                                                            Tiêu Đề
                                                        </label>
                                                        <div class="col-sm-5">
                                                            <input value="" name="title" id="name" placeholder="" type="text" class="form-control" required="true">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="summary" class="col-sm-2 col-form-label">
                                                            Tóm Tắt
                                                        </label>
                                                        <div class="col-sm-8">
                                                            <input value="" name="summary" id="name" placeholder="" type="text" class="form-control" required="true">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="detail" class="col-sm-2 col-form-label">
                                                            Chi Tiết
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <textarea rows="20" name="detail" id="moreinfo" class="form-control" required="true"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="width: 40%; float: left">
                                                    <div>
                                                        <div class="file-upload" style="width: 85%;">
                                                            <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger('click')">Chọn ảnh</button>

                                                            <div class="image-upload-wrap">
                                                                <input class="file-upload-input" type="file" name="avatar" size="50" onchange="readURL(this);" accept="image/*" />
                                                                <div class="drag-text">
                                                                    <h5>
                                                                        Kéo và thả file
                                                                    </h5>
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
                                                <div class="col-sm-10" style="padding-left: 0px">
                                                    <button style="" class="btn btn-primary" type="submit">
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
