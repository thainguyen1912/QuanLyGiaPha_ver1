<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login V8</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="import_page/import_css.jsp" flush="true" />
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="Register?value=process" method="post">
                        <span class="login100-form-title">
                            Đăng ký Mới
                        </span>
                        <div class="wrap-input100 validate-input m-b-16" data-validate="Nhập tên tài khoản">
                            <input class="input100" type="text" name="username" placeholder="Tên tài khoản">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Nhập mật khẩu">
                            <input class="input100" type="password" name="password1" placeholder="Nhập mật khẩu">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Nhập lại mật khẩu">
                            <input class="input100" type="password" name="password2" placeholder="Nhập lại mật khẩu">
                            <span class="focus-input100"></span>
                        </div>
                        <div class="text-center p-t-13 p-b-23">
                            <p class="txt3">
                                <%=request.getAttribute("PasswordFalse")==null?"":request.getAttribute("PasswordFalse") %>
                                <%=request.getAttribute("UserNameExist")==null?"":request.getAttribute("UserNameExist") %>
                            </p>
                        </div>
                        <div class="container-login100-form-btn m-b-16">
                            <button class="login100-form-btn">
                                Đăng ký
                            </button>
                        </div>
                    </form>
                    <div class="container-login100-form-btn m-b-16" style="width: 60%; margin-left: 20%">
                        <button class="login100-form-btn" onclick="location.href = 'Login?value=LoginPage';">
                            Huỷ
                        </button>
                    </div>
                </div>
            </div>
        </div>
	<jsp:include page="import_page/import_js.jsp" flush="true" />
    </body>
</html>