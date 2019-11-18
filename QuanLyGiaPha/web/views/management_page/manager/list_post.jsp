<%@page import="Enity.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    ArrayList<Post> list_post = (ArrayList<Post>) request.getAttribute("list_post");
%>
<!doctype html>
<html lang="en">
    <jsp:include page="../import_page/import.jsp" flush="true"/>
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
                                        <div style="text-align: center; margin-bottom: 2%">

                                        </div>
                                        <div class="row">
                                            <%
                                                if (list_post.size() == 0) {
                                            %>
                                                <h5 style="color: red">Không Có Bài Viết Nào Để Hiển Thị</h5>
                                            <%}%>
                                            <%
                                                for (int i = 0; i < list_post.size(); i++) {
                                            %>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card">
                                                    <div class="widget-content">
                                                        <div class="widget-content-outer" style="text-align: center">
                                                            <div class="widget-content-wrapper">
                                                                <div class="">
                                                                    <img src="resources/images/post/<%=list_post.get(i).getImage().equals("")?"imagenotfound.png":list_post.get(i).getImage() %>" width="100%"> 
                                                                </div>
                                                                <div class="">
                                                                </div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1 mt-2">
                                                                <div class="text-muted opacity-6">Tiêu Đề: <%=list_post.get(i).getTitle()%></div>
                                                            </div>
                                                            <div class="mt-2" style="margin-left: 18%">
                                                                <div class="mr-2" style="float: left">
                                                                    <a href="PostControl?page=redirect_edit&id=<%=list_post.get(i).getIdPost()%>"><button class="btn-wide btn btn-success">Xem Và Sửa</button></a>
                                                                </div>
                                                                <div class="mr-2" style="float: left">
                                                                    <a onclick="return xacNhan()" href="PostControl?page=delete&id=<%=list_post.get(i).getIdPost()%>"><button class="btn-wide btn btn-danger">Xóa</button></a>
                                                                </div>
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