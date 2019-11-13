<%@page import="Enity.Parentage"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Parentage par = (Parentage) session.getAttribute("Parentage");
    request.setAttribute("title", "parentage_info");
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
                                <form class="needs-validation" action="UpdateParentageInfo" method="post">
                                    <div class="form-row" style="">
                                        <div class="col-md-4 mb-3">
                                            
                                        </div>
                                        <div class="col-md-4 mb-3" style="text-align: center">
                                            <h6 class="text-primary">
                                                <%=request.getAttribute("UpdateParentageSuccess") == null ? "" : request.getAttribute("UpdateParentageSuccess")%>
                                            </h6>
                                        </div>
                                    </div>

                                    <div class="form-row" style="">
                                        <div class="col-md-4 mb-3">
                                        </div>
                                        <div class="col-md-4 mb-5" style="text-align: center">
                                            <h5>
                                                Ngày Tạo : <%=par.getDateCreate()%>
                                            </h5>
                                        </div>
                                    </div>
                                    <h5 class="card-title mt-2" style="text-align: center">-----Thông Tin Cơ Bản-----</h5>        
                                    <div class="position-relative form-row" style="margin-bottom: 8%">
                                        <div class="col-md-2-5 mb-2 mr-2">
                                            <label>Tên Dòng Họ</label>
                                            <input style="" type="text" class="form-control" name="name" value="<%=par.getName() == null ? "" : par.getName()%>" required>
                                        </div>
                                        <div class="col-md-2-5 mb-2 mr-2">
                                            <label>Tổ Tiên</label>
                                            <input style="" type="text" class="form-control" name="ancestor" value="<%=par.getAncestor() == null ? "" : par.getAncestor()%>" required>
                                        </div>
                                        <div class="col-md-4 mb-2 mr-2">
                                            <label>Địa Chỉ</label>
                                            <input type="text" class="form-control" name="address" value="<%=par.getAddress() == null ? "" : par.getAddress()%>" required>
                                        </div>
                                        <div class="col-md-2-5 mb-2">
                                            <label>Ngày Giỗ</label>
                                            <input style="" type="date" class="form-control" name="anniversary" value="<%=par.getAnniversary() == null ? "" : par.getAnniversary()%>" required>
                                        </div>
                                    </div>
                                    <h5 class="card-title mt-2" style="text-align: center">-----Trưởng Họ Hiện Tại-----</h5> 
                                    <div class="position-relative form-row" style="margin-bottom: 4%">
                                        <div class="col-md-3 mb-2 mr-4">
                                            <label>Tên Trưởng Họ</label>
                                            <input type="text" class="form-control" name="headname" value="<%=par.getHeadName() == null ? "" : par.getHeadName()%>" required>
                                        </div>
                                        <div class="col-md-5 mb-2 mr-4">
                                            <label>Địa Chỉ Trưởng Họ</label>
                                            <input type="text" class="form-control" name="headaddress" value="<%=par.getHeadAddress() == null ? "" : par.getHeadAddress()%>" required>
                                        </div>
                                        <div class="col-md-3 mb-2">
                                            <label>Số Điện Thoại Trưởng Họ</label>
                                            <input type="text" class="form-control" name="headnumberphone" value="<%=par.getHeadNumberPhone() == null ? "" : par.getHeadNumberPhone()%>">
                                        </div>
                                    </div>

                                    <h5 class="card-title mt-2" style="text-align: center">-----Thông Tin Thêm-----</h5> 
                                    <div class="position-relative form-row" style="margin-bottom: 4%">
                                        <div class="">
                                            <textarea cols="150" rows="5" type="text" class="form-control" name="note"><%=par.getNote() == null ? "" : par.getNote()%></textarea>
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
