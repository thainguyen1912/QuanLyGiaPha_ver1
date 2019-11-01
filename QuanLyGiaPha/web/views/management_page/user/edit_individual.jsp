<%@page import="java.sql.Blob"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Enity.Individual"%>
<%@page import="Enity.Parentage"%>

<%
    DBConnection db = new DBConnection();
    Individual_DAO ind_dao = new Individual_DAO(db);
    int idIndividual = Integer.valueOf(request.getAttribute("idIndividual").toString());
    Individual ind = ind_dao.getIndividualById(idIndividual);
    request.setAttribute("individual", ind);//send to editindividual to update infomation
%>
<!doctype html>
<html lang="en">
    <jsp:include page="import_page/import.jsp" flush="true"/>
    <script src="js/upload_image.js"></script>
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/upload_image.css">
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
                                        <form class="" style="width: 100%" action="EditIndividual?value=Process" method="post" enctype="multipart/form-data">
                                            <div>
                                                <div style="width: 60%; float: left">
                                                    <div class="position-relative row form-group">
                                                        <label for="name" class="col-sm-2 col-form-label">
                                                            Họ Và Tên
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=ind.getIdIndividual() %>" name="id" id="id" placeholder="" type="text" class="form-control" hidden="true">
                                                            <input value="<%=ind.getName()%>" name="name" id="name" placeholder="" type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="gender" class="col-sm-2 col-form-label">
                                                            Giới Tính
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <select name="gender" id="gender" class="form-control">
                                                                <option value="1" <%=ind.getGender() == 1 ? "selected" : ""%>>Nam</option>
                                                                <option value="0" <%=ind.getGender() == 0 ? "selected" : ""%>>Nữ</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="childth" class="col-sm-2 col-form-label">
                                                            Con Thứ
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=ind.getChildth()%>" name="childth" id="childth" placeholder="" type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="wifeorhusbandname" class="col-sm-2 col-form-label">
                                                            Tên Vợ
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=ind.getWifeOrHusbandName()%>" name="wifeorhusbandname" id="wifeorhusbandname" placeholder="" type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="datebirth" class="col-sm-2 col-form-label">
                                                            Ngày Sinh
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=ind.getDateBirth()%>" name="datebirth" id="datebirth" placeholder="" type="date" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="position-relative row form-group">
                                                        <label for="datedeath" class="col-sm-2 col-form-label">
                                                            Ngày Mất
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <input value="<%=ind.getDateDeath()%>" name="datedeath" id="datedeath" placeholder="" type="date" class="form-control">
                                                        </div>
                                                    </div>

                                                    <div class="position-relative row form-group">
                                                        <label for="moreinfo" class="col-sm-2 col-form-label">
                                                            Thông Tin Thêm
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <textarea name="moreinfo" id="moreinfo" class="form-control"><%=ind.getMoreInfo() == null ? "Không Có" : ind.getMoreInfo()%></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div style="float: left; width: 40%">
                                                        <div>
                                                            <div class="file-upload" style="width: 85%;">

                                                                <div style="margin-bottom: 10%">
                                                                    <img style="max-width: 100%" src="images/<%=ind.getAvatar()==null?"imagenotfound.png":ind.getAvatar() %>" alt="your image" />
                                                                </div>

                                                                <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger('click')">Thay Đổi Ảnh</button>

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
                                                    <div class="position-relative row form-check" style="clear: both">
                                                        <div class="col-sm-10 offset-sm-2">
                                                            <button style="margin-left: 30%;" class="btn btn-primary" type="submit">
                                                                Cập Nhật Thông Tin
                                                            </button>
                                                        </div>
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
