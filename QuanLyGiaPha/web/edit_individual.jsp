<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="PrintfTree.PrintTree"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.Individual"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Enity.ParentAge"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int idIndividual=Integer.valueOf(request.getAttribute("idIndividual").toString());

%>
<!doctype html>
<html lang="en">
    <jsp:include page="import.jsp" />
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="header.jsp" /> 
            <jsp:include page="setting_ui.jsp" />
            <div class="app-main" style="overflow: auto">
                <jsp:include page="left_menu.jsp" />
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="page_title.jsp" />
                        <div class="tab-content">
                            <div class="tab-pane tabs-animation fade active show" id="tab-content-1" role="tabpanel">
                                <div class="main-card mb-3 card">
                                    <div class="card-body">
                                        <form class="" style="width: 100%" action="EditIndividual" method="post" enctype="multipart/form-data">
                                            <div style="width: 60%; float: left">
                                                <div class="position-relative row form-group">
                                                    <label for="name" class="col-sm-2 col-form-label">
                                                        Họ Và Tên
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input name="name" id="name" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <label for="gender" class="col-sm-2 col-form-label">
                                                        Giới Tính
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <select name="gender" id="gender" class="form-control">
                                                            <option>Nam</option>
                                                            <option>Nữ</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <label for="childth" class="col-sm-2 col-form-label">
                                                        Con Thứ
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input name="childth" id="childth" placeholder="" type="number" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <label for="wifeorhusbandname" class="col-sm-2 col-form-label">
                                                        Tên Vợ Hoặc Chồng
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input name="wifeorhusbandname" id="wifeorhusbandname" placeholder="" type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <label for="datebirth" class="col-sm-2 col-form-label">
                                                        Ngày Sinh
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input name="datebirth" id="datebirth" placeholder="" type="date" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <label for="datedeath" class="col-sm-2 col-form-label">
                                                        Ngày Mất
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input name="datedeath" id="datedeath" placeholder="" type="date" class="form-control">
                                                    </div>
                                                </div>

                                                <div class="position-relative row form-group">
                                                    <label for="moreinfo" class="col-sm-2 col-form-label">
                                                        Thông Tin Thêm
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <textarea name="moreinfo" id="moreinfo" class="form-control">
                                                        
                                                        </textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="float: left; width: 40%">
                                                <div>
                                                    <jsp:include page="upload_image.jsp" flush="true" />
                                                </div>
                                            </div>
                                            <div class="position-relative row form-check" style="clear: both">
                                                <div class="col-sm-10 offset-sm-2">
                                                    <button style="margin-left: 32%;" class="btn btn-primary" type="submit">
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
                    <jsp:include page="footer.jsp" />
                </div>
            </div>
        </div>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="assets/scripts/main.js"></script>
    </body>
</html>
