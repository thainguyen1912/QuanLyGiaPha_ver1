<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tao gia pha</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main-login.css">
</head>
<body>
    
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="CreateParentage?value=CheckCreate" method="post">
                    <span class="login100-form-title">
                        Khởi Tạo Gia Phả Dòng Họ
                    </span>
                    <div class="">
                        <p class="txt3" style="text-align: center">
                            Gia Phả Của Bạn Chưa Có Thành Viên Gốc
                        </p>
                    </div>
                    <div class="text-center p-t-13 p-b-23">
                        </div>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Chưa Nhập Tên Dòng họ">
                        <input class="input100" type="text" name="parentagename" placeholder="Tên Dòng họ">
                        <span class="focus-input100"></span>
                    </div>
                    
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Chưa Nhập Tên Tổ Tiên">
                        <input class="input100" type="text" name="individualname" placeholder="Tên Tổ Tiên">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Chưa Nhập Năm Sinh">
                        <input class="input100" type="text" name="datebirth" placeholder="Ngày Sinh">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Chưa Nhập Năm Mất">
                        <input class="input100" type="text" name="datedeath" placeholder="Ngày Mất">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-16" data-validate = "Chưa Nhập Địa Chỉ">
                        <input class="input100" type="text" name="address" placeholder="Nhập Địa Chỉ">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="text-right p-t-13 p-b-23">
                        
                    </div>

                    <div class="container-login100-form-btn m-b-16">
                        <button class="login100-form-btn">
                            Lưu Và Tiếp Tục
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/daterangepicker/moment.min.js"></script>
    <script src="vendor/daterangepicker/daterangepicker.js"></script>
    <script src="vendor/countdowntime/countdowntime.js"></script>
    <script src="js/login.js"></script>

</body>
</html>