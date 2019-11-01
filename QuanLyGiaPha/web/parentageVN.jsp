<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.ParentAge_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.ParentAge"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<ParentAge> arr_par=(ArrayList<ParentAge>)request.getAttribute("arr_par");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>GIAPHAVIETNAM</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body class="goto-here">
        <div class="py-1 bg-primary">
            <div class="container">
                <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                    <div class="col-lg-12 d-block">
                        <div class="row d-flex">
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                                <span class="text">+ 8432 758 2233</span>
                            </div>
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                                <span class="text">quanlygpvn@gmail.com</span>
                            </div>
                            <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                                <span class="text">Quản Lý Gia Phả &amp; Tin Tức</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">GiaPhaVietNam</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index.jsp" class="nav-link">Trang Chủ</a></li>
                        <li class="nav-item"><a href="parentageVN.jsp" class="nav-link">Gia Phả Việt Nam</a></li>
                        <li class="nav-item"><a href="news.jsp" class="nav-link">Tin Tức</a></li>
                        <li class="nav-item"><a href="about.jsp" class="nav-link">Giới Thiệu</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Liên Hệ &amp; Góp Ý</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

       <div class="hero-wrap hero-bread" style="background-image: url('images/58005.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">
          	
                <h1 class="mb-0 bread" style="font-family: serif ; font-size: 50px">HỆ THỐNG CÁC DÒNG HỌ VIỆT NAM</h1>
          </div>
        </div>
      </div>
    </div>
    <table class="mb-0 table table-hover" style="text-align: center">
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tên Dòng họ</th>
                                                    <th>Trưởng họ</th>
                                                    <th>Nguyên quán</th>
                                                    <th>Ngày lập</th>
                                                    <th>Số thành viên</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <%
                                                    for(int i=0;i<arr_par.size();i++){
                                                %>
                                                <tr>
                                                    <th><%=i+1 %></th>                          
                                                    <td><%=arr_par.get(i).getName()%></td>
                                                    <td><%=arr_par.get(i).getHeadName()%></td>
                                                    <td><%=arr_par.get(i).getAddress()%></td>
                                                    <td><%=arr_par.get(i).getDateCreate()%></td>
                                                    <td><%=arr_par.get(i).getHeadName()%></td>
                                                    <td>
                                                        <div class="dropdown d-inline-block">
                                                            <button type=button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="mb-2 mr-2 dropdown-toggle btn btn-outline-info"></button>
                                                            <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu">
                                                                <a href="EditIndividual?value=Redirect&idIndividual=<%=arr_par.get(i).getId()%>">
                                                                    <button class="dropdown-item mb-2 mr-2 btn-transition btn btn-outline-warning">
                                                                        <i class="pe-7s-tools" style="font-size: 1.2rem">
                                                                            <span style="font-size:16px">   Sửa</span>
                                                                        </i>
                                                                    </button>
                                                                </a>
                                                                    <a onclick="return xacNhan()" href="DeleteIndividual?page=list_individual&id=<%=arr_par.get(i).getId()%>">
                                                                    <button class="dropdown-item mb-2 mr-2 btn-transition btn btn-outline-danger"><i class="pe-7s-trash" style="font-size: 1.2rem">
                                                                            <span style="font-size:16px">   Xóa</span>
                                                                        </i>
                                                                    </button>
                                                                </a>
                                                                <a>
                                                                    <button class="dropdown-item mb-2 mr-2 btn-transition btn btn-outline-info">
                                                                        <i class="pe-7s-add-user" style="font-size: 1.2rem">
                                                                            <span style="font-size:16px">   Thêm Con</span>
                                                                        </i>
                                                                    </button>
                                                                </a>
                                                            </div>
                                                    </td>
                                                </tr>
                                                <%
                                                }
                                                %>
                                            </tbody>
    </table>

        <hr>

        
        <footer class="ftco-footer ftco-section">
            <div class="container">
                <div class="row">
                    <div class="mouse">
                        <a href="#" class="mouse-icon">
                            <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
                        </a>
                    </div>
                </div>
                <div class="row mb-5">
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">GIAPHAVIETNAM</h2>
                            <p>Quản lý Gia phả dễ dàng và tiện lợi. Liên tục cập nhật tin tức mới nhất của các dòng họ.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Trang chủ</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Gia phả Việt Nam</a></li>
                                <li><a href="#" class="py-2 d-block">Tin Tức</a></li>
                                <li><a href="#" class="py-2 d-block">Giới Thiệu</a></li>
                                <li><a href="#" class="py-2 d-block">Liên hệ - Góp ý</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Đặt câu hỏi?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Đại học Công Nghiệp Hà Nội, Nhổn, Minh Khai, Từ Liêm, Hà Nội</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+8432 758 2233</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">quanlygiaphavn@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 text-center">
                <h5><a href="https://www.haui.edu.vn/vn">Trường Đại Học Công Nghiệp Hà Nội</a></h5>
                <h4>Nhóm thực hiện: Nhóm 02 ĐH-KTPM1-K11</h4>
                <h4>Giảng viên hướng dẫn: <span class="text-info font-weight-bold">ThS. Hoàng Quang Huy</span>
                </h4>
                <div class="text-center lead" style="font-weight: bold;font-size: 18px">Các thành viên trong nhóm</div>
                <br />
                <div class="row">
                    <div class="col-sm-6 col-md-6 pb-3 text-center">
                        <h5>Nguyen Van Thai</h5>
                        <h5>1141360205</h5>
                        <p>0333 385 398</p>
                        <p>thainguyenvan@gmail.com</p>
                    </div>
                    <div class="col-sm-6 col-md-6 pb-3 text-center border-left ">
                        <h5>Phung Dang Khoa</h5>
                        <h5>1141360077</h5>
                        <p>0327582233</p>
                        <p>phungdangkhoa97@gmail.com</p>
                    </div>

                </div>
            </div>

        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>