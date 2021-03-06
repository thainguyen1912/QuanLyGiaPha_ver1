<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int idFather = Integer.valueOf(request.getAttribute("idFather").toString());
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
                                        <form class="" style="width: 100%" action="AddIndividual?value=Process" method="post" enctype="multipart/form-data">
                                            <div>
                                                <div style="width: 60%; float: left">
                                                    <div class="position-relative row form-group">
                                                        <label for="name" class="col-sm-2 col-form-label">
                                                            Họ Và Tên
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=idFather%>" name="idFather" id="" placeholder="" type="text" class="form-control" hidden="true">
                                                            <input value="" name="name" id="name" placeholder="" type="text" class="form-control" required="true">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="gender" class="col-sm-2 col-form-label">
                                                            Giới Tính
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <select name="gender" id="gender" class="form-control">
                                                                <option value="1" >Nam</option>
                                                                <option value="0" >Nữ</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="childth" class="col-sm-2 col-form-label">
                                                            Con Thứ
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="" name="childth" id="childth" placeholder="" type="text" class="form-control" required="true">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="wifeorhusbandname" class="col-sm-2 col-form-label">
                                                            Tên Vợ
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="" name="wifeorhusbandname" id="wifeorhusbandname" placeholder="" type="text" class="form-control" required="true">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="datebirth" class="col-sm-2 col-form-label">
                                                            Ngày Sinh
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="" name="datebirth" id="datebirth" placeholder="" type="date" class="form-control" required="true">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="datedeath" class="col-sm-2 col-form-label">
                                                            Ngày Mất
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="" name="datedeath" id="datedeath" placeholder="" type="date" class="form-control" required="true">
                                                        </div>
                                                    </div>

                                                    <div class="position-relative row form-group">
                                                        <label for="moreinfo" class="col-sm-2 col-form-label">
                                                            Thông Tin Thêm
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <textarea name="moreinfo" id="moreinfo" class="form-control">Không Có</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="float: left; width: 40%">
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
                                                                <button type="button" onclick="removeUpload()" class="remove-image">Xóa Bỏ</button>
                                                                <!--<span class="image-title">Uploaded Image</span>-->
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
