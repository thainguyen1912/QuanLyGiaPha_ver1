<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Post_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.Post"%>
<%@page import="java.util.ArrayList"%>

<%
    DBConnection db = new DBConnection();
    Post_DAO pst = new Post_DAO(db);
    ArrayList<Post> arr_post = pst.selectAll();

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>GIAPHAVIETNAM</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="import_page/import_css.jsp" flush="true" />
    </head>
    <body class="goto-here">
        <jsp:include page="import_page/header1.jsp" flush="true" />
        <jsp:include page="import_page/header2.jsp" flush="true" />

        <div class="hero-wrap hero-bread" style="background-image: url('resources/images/home/58005.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">

                        <h1 class="mb-0 bread" style="font-family: serif ; font-size: 50px">TIN TỨC</h1>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section ftco-degree-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 ftco-animate fadeInUp ftco-animated">
                        <div class="row">
                            <tbody>

                                <%                                                    for (int i = arr_post.size() - 1; i > -1; i--) {
                                        if (arr_post.get(i).getStatus().equals("1")) {
                                %>
                            <div class="col-md-12 d-flex ftco-animate fadeInUp ftco-animated">
                                <div class="blog-entry align-self-stretch d-md-flex">
                                    <a href="#" class="block-20" style="background-image: url('resources/images/home/<%=arr_post.get(i).getImage()%>');">
                                    </a>
                                    <div class="text d-block pl-md-4">
                                        <div class="meta mb-3">
                                            <div><a href="#"><%=arr_post.get(i).getDatePost()%></a></div>

                                            <div><a href="#"><%=arr_post.get(i).getKey().equals("0") ? pst.getUser(arr_post.get(i).getIdPost()) : "Admin"%></a></div>
                                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                        </div>
                                        <h3 class="heading"><a href="HomePage?page=newsdetail&id=<%=arr_post.get(i).getIdPost()%>"><%=arr_post.get(i).getTitle()%></a></h3>
                                        <div style="height: 112px ; overflow: hidden">
                                            <p><%=arr_post.get(i).getSummary()%></p>
                                        </div>

                                        <p><a href="HomePage?page=newsdetail&id=<%=arr_post.get(i).getIdPost()%>" class="btn btn-primary py-2 px-3">Đọc thêm...</a></p>
                                    </div>
                                </div>
                            </div>

                            <%
                                    }
                                }
                            %>
                            </tbody>






                        </div>
                    </div> <!-- .col-md-8 -->
                    <div class="col-lg-4 sidebar ftco-animate fadeInUp ftco-animated">
                        <div class="sidebar-box">
                            <form action="#" class="search-form">
                                <div class="form-group">
                                    <span class="icon ion-ios-search"></span>
                                    <input type="text" class="form-control" placeholder="Tìm kiếm...">
                                </div>
                            </form>
                        </div>
                        <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
                            <h3 class="heading">Thể loại</h3>
                            <ul class="categories">
                                <li><a href="#">Gia Phả <span>(12)</span></a></li>
                                <li><a href="#">Phong Tục <span>(22)</span></a></li>
                                <li><a href="#">Khuyến Học <span>(37)</span></a></li>
                                <li><a href="#">Tin Lạ <span>(42)</span></a></li>
                            </ul>
                        </div>
                        <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
                            <h3 class="heading">Tin tức mới nhất</h3>
                            <%
                                for (int i = arr_post.size() - 1; i > arr_post.size() - 5; i--) {
                                    if (arr_post.get(i).getStatus().equals("1")) {
                            %>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url('resources/images/home/<%=arr_post.get(i).getImage()%>')"></a>
                                <div class="text">
                                    <h3 class="heading-1"><a href="HomePage?page=newsdetail&id=<%=arr_post.get(i).getIdPost()%>"><%=arr_post.get(i).getTitle()%></a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span><%=arr_post.get(i).getDatePost()%></a></div>
                                        <div><a href="#"><span class="icon-person"></span><%=arr_post.get(i).getKey().equals("0") ? pst.getUser(arr_post.get(i).getIdPost()) : "Admin"%></a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 3</a></div>
                                    </div>
                                </div>
                            </div>


                            <%
                                    }
                                }
                            %>

                        </div>
                        <div class="sidebar-box ftco-animate">
                            <h3 class="heading">Từ khoá tìm kiếm nhiều nhất</h3>
                            <div class="tagcloud">
                                <a href="#" class="tag-cloud-link">gia phả</a>
                                <a href="#" class="tag-cloud-link">họ Nguyễn</a>
                                <a href="#" class="tag-cloud-link">Tết</a>
                                <a href="#" class="tag-cloud-link">họ Trần</a>
                                <a href="#" class="tag-cloud-link">họ Văn</a>
                                <a href="#" class="tag-cloud-link">họ Phùng</a>
                                <a href="#" class="tag-cloud-link">họ Dương</a>
                                <a href="#" class="tag-cloud-link">phong tục</a>
                            </div>
                        </div>
                        <div class="sidebar-box ftco-animate">
                            <h3 class="heading">Các bạn thân mến!</h3>
                            <p>
                                Bậc tiền nhân từ xưa đã dạy : "Mọi vật tự trời sinh, mọi người đều có Tổ tiên, uống nước phải nhớ nguồn, đó là đạo lý cương thường vạn cổ. Đất nước có sử sách, biên cương được củng cố. Nhà có Gia phả lưu giữ phát huy công đức Tổ Tiên"
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr>
        <jsp:include page="import_page/footer.jsp" flush="true" />
        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <jsp:include page="import_page/import_js.jsp" flush="true" />

    </body>
</html>