<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
    <jsp:include page="import.jsp" />
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="header.jsp" /> 
            <jsp:include page="setting_ui.jsp" />
            <div class="app-main">
                <jsp:include page="left_menu.jsp" />
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="page_title.jsp" />
                        <div class="main-card mb-3 card" style="width: 100%">
                            <div class="card-body">
                                <form class="needs-validation" novalidate>
                                    <div class="form-row" style="margin-bottom: 4%">
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip01">Tên Dòng Họ</label>
                                            <input type="text" class="form-control" id="validationTooltip01" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Tên Dòng Họ
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip02">Tổ Tiên</label>
                                            <input type="text" class="form-control" id="validationTooltip02" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Tên Tổ Tiên
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip03">Địa Chỉ</label>
                                            <input type="text" class="form-control" id="validationTooltip03" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Địa Chỉ
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="form-row" style="margin-bottom: 4%">
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip04">Ngày Giỗ</label>
                                            <input type="date" class="form-control" id="validationTooltip04" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Ngày Giỗ
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip05">Lịch Sử Dòng Họ</label>
                                            <input type="text" class="form-control" id="validationTooltip05" value="">
                                            <div class="valid-tooltip">
                                                Bạn Có Thể Bỏ Qua Trường Này
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip06">Ghi Chú Thêm</label>
                                            <input type="text" class="form-control" id="validationTooltip06" value="">
                                            <div class="valid-tooltip">
                                                Bạn Có Thể Bỏ Qua Trường Này
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row" style="margin-bottom: 4%">
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip07">Tên Người Đứng Đầu Dòng Họ</label>
                                            <input type="text" class="form-control" id="validationTooltip07" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Tên
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip08">Địa Chỉ Người Đứng Đầu Dòng Họ</label>
                                            <input type="text" class="form-control" id="validationTooltip08" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Địa Chỉ
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="validationTooltip09">Email Người Đứng Đầu Dòng Họ</label>
                                            <input type="text" class="form-control" id="validationTooltip09" value="" required>
                                            <div class="invalid-tooltip">
                                                Bạn Chưa Nhập Email
                                            </div>
                                        </div>
                                    </div>
                                    <button style="margin-left: 45%;" class="btn btn-primary" type="submit">Cập Nhật Thông Tin</button>
                                </form>
                            </div>
                        </div>
                    </div>
                <jsp:include page="footer.jsp" />
            </div>
        </div>
    </div>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>


    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="./public/assets/scripts/main.js"></script>
</body>
</html>
