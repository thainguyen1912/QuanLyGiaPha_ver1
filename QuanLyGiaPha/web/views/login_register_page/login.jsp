<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng Nhập</title>
	<meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="import_page/import_css.jsp" flush="true" />
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="Login?value=CheckLogin" method="post">
                        <span class="login100-form-title">
                            Đăng Nhập
                        </span>
                        
                        <div class="text-center p-t-13 p-b-23">
                            <p class="txt3">
                                <%=request.getAttribute("CreateSuccess")==null?"":request.getAttribute("CreateSuccess") %>
                            </p>
                            <p class="txt3" style="color: red">
                                <%=request.getAttribute("filter_mess")==null?"":request.getAttribute("filter_mess") %>
                            </p>
                        </div>
                        
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Bạn Chưa Nhập Tài Khoản">
                            <input class="input100" type="text" name="username" placeholder="Tên tài khoản">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Bạn Chưa Nhập Mật Khẩu">
                            <input class="input100" type="password" name="password" placeholder="Nhập mật khẩu">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="text-center p-t-13 p-b-23">
                            <p class="txt3" style="color: red">
                                <%=request.getAttribute("LoginFalse")==null?"":request.getAttribute("LoginFalse") %>
                            </p>
                        </div>
                        <div class="container-login100-form-btn m-b-16">
                            <button class="login100-form-btn">
                                Đăng Nhập
                            </button>
                        </div>
                    </form>
                    <div class="container-login100-form-btn" style="width: 60%; margin-left: 20%">
                        <button class="login100-form-btn" onclick="location.href = 'HomePage?page=index';">
                            Huỷ
                        </button>
                    </div>
                    <div class="flex-col-c p-t-170 p-b-40">
                        <span class="txt1 p-b-9">
                            Chưa có tài khoản
                        </span>

                        <a href="Register?value=redirect" class="txt3">
                            Đăng ký mới
                        </a>
                    </div>
                </div>
            </div>
        </div>
	<jsp:include page="import_page/import_js.jsp" flush="true" />
    </body>
</html>