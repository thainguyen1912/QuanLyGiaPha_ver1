<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String title="";
    String value=request.getAttribute("title").toString();
    switch(value){
        case "parentage_info":
           title ="Thông Tin Dòng Họ";
            break;
        case "parentage_treeview":
            title ="Quản Lý Phả Đồ";
            break;
        case "edit_individual":
            title="Sửa Thông Tin Thành Viên";
            break;
        case "add_individual":
            title="Thêm Thành Viên";
            break;
        case "list_individual":
            title="Danh Sách Thành Viên";
            break;
        case "list_avatar":
            title="Danh Sách Ảnh";
            break;
        case "user_info":
            title="Thông Tin Người Dùng";
            break;
        case "change_pass":
            title="Đổi Mật Khẩu Tài Khoản";
            break;
        case "list_parentage":
            title="Danh Sách Gia Phả Đang Quản Lý";
            break;
        case "add_post":
            title="Thêm Bài Viết";
            break;
        case "list_post":
            title="Danh Sách Bài Viết";
            break;
        default:
            title="null";
            break;
    }
%>
<div class="app-page-title">
    <div class="page-title-wrapper">
        <div class="page-title-heading">
            <div>
                <%=title %>
            </div>
        </div> 
    </div>
</div>