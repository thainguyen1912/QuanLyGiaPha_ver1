<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tao gia pha</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="import_page/import_css.jsp" flush="true" />
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
                        <input class="input100" type="text" name="datebirth" placeholder="Ngày Sinh (yyyy-MM-dd)">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Chưa Nhập Năm Mất">
                        <input class="input100" type="text" name="datedeath" placeholder="Ngày Mất (yyyy-MM-dd)">
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
    <jsp:include page="import_page/import_js.jsp" flush="true" />

</body>
</html>