<%@page import="Enity.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    ArrayList<Post> arr_post=(ArrayList<Post>)request.getAttribute("arr_pos");
%>
<!doctype html>
<html lang="en">
    <jsp:include page="../import_page/import.jsp" flush="true"/>
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="import_page/header_admin.jsp" flush="true"/> 
            <jsp:include page="../import_page/setting_ui.jsp" flush="true"/>
            <div class="app-main" style="overflow: auto">
                <jsp:include page="import_page/left_menu_admin.jsp" flush="true"/>
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
                                                for (int i = 0; i < arr_post.size(); i++) {
                                            %>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card">
                                                    <div class="widget-content">
                                                        <div class="widget-content-outer" style="text-align: center">
                                                            <div class="widget-content-wrapper">
                                                                <div class="">
                                                                    <%
                                                                        boolean check=true;
                                                                        if(arr_post.get(i).getImage()==null || arr_post.get(i).getImage().equals("")) check=false;
                                                                    %>
                                                                    <img src="resources/images/post/<%=check==false?"imagenotfound.png":arr_post.get(i).getImage() %>" width="50%"> 
                                                                </div>
                                                                <div class="">
                                                                </div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1 mt-2">
                                                                <div class="text-muted opacity-6">Tiêu Đề: <%=arr_post.get(i).getTitle()%></div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1">
                                                                <div class="text-muted opacity-6">Tóm Tắt: <%= arr_post.get(i).getSummary()%></div>
                                                            </div>
                                                            <div class="mt-2" style="margin-left: 32%">
                                                                <div class="mr-2" style="float: left; margin-bottom: 4px">
                                                                    <a href="ComingSoon"><button class="btn-wide btn btn-success">Xem Chi Tiết</button></a>
                                                                </div>
                                                                <div class="mr-2 mb-2" style="float: left; margin-bottom: 4px">
                                                                    <a href="PostControl?page=processpost&id=<%=arr_post.get(i).getIdPost() %>"><button class="btn-wide btn btn-primary">Duyệt</button></a>
                                                                </div>
                                                                <div class="mr-2 mb-2" style="float: left; margin-bottom: 4px">
                                                                    <a href="ComingSoon"><button class="btn-wide btn btn-danger">Xóa</button></a>
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