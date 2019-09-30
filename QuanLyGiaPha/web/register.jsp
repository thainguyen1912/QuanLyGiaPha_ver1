<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dang Ky</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="public/images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="public/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="public/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="public/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="public/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="public/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="public/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="public/css/util.css">
        <link rel="stylesheet" type="text/css" href="public/main.css">
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178">
                        <span class="login100-form-title">
                            Đăng ký Mới
                        </span>
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Nhập tên tài khoản">
                            <input class="input100" type="text" name="username" placeholder="Tên tài khoản">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Nhập mật khẩu">
                            <input class="input100" type="password" name="pass" placeholder="Nhập mật khẩu">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Nhập lại mật khẩu">
                            <input class="input100" type="password" name="pass" placeholder="Nhập lại mật khẩu">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="text-right p-t-13 p-b-23">

                        </div>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Đăng ký
                            </button>
                        </div>
                    </form>
                    <div class="container-login100-form-btn" style="width: 60%; margin-left: 20%">
                        <button class="login100-form-btn" onclick="location.href = 'login.jsp';">
                            Huỷ
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <script src="public/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="public/vendor/animsition/js/animsition.min.js"></script>
        <script src="public/vendor/bootstrap/js/popper.js"></script>
        <script src="public/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="public/vendor/select2/select2.min.js"></script>
        <script src="public/vendor/daterangepicker/moment.min.js"></script>
        <script src="public/vendor/daterangepicker/daterangepicker.js"></script>
        <script src="public/vendor/countdowntime/countdowntime.js"></script>
        <script src="public/login.js"></script>
    </body>
</html>