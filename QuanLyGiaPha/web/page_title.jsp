<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String title="";
    String value=request.getAttribute("value").toString();
    switch(value){
        case "parentage_info":
           title ="Thông Tin Dòng Họ";
            break;
        case "parentage_treeview":
            title ="Quản Lý Phả Đồ";
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