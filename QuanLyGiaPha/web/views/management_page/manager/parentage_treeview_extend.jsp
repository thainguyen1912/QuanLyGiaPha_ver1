<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.Individual"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Enity.Parentage"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Parentage par = (Parentage) session.getAttribute("Parentage");
    ArrayList<Individual> arr_ind = (ArrayList<Individual>) request.getAttribute("arr_ind");
    DBConnection db = new DBConnection();
    Individual_DAO ind_dao = new Individual_DAO(db);
        
    Individual ind=(Individual)request.getAttribute("individual");
%>
<!doctype html>
<html lang="en">
    <jsp:include page="../import_page/import.jsp" flush="true"/>
    <script src="resources/js/upload_image.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/upload_image.css">
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="../import_page/header.jsp" flush="true"/> 
            <jsp:include page="../import_page/setting_ui.jsp" flush="true"/>
            <div class="app-main" style="overflow: auto">
                <jsp:include page="../import_page/left_menu.jsp" flush="true"/>
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="../import_page/page_title.jsp" flush="true"/>
                        <div style="float: left; width: 75%">
                            <div style="text-align: center; margin-bottom: 2%">
                                <h6 style="color: red">
                                    <%=request.getAttribute("delete-error") == null ? "" : request.getAttribute("delete-error")%>
                                </h6>
                                <h6 style="color: green">
                                    <%=request.getAttribute("delete-success") == null ? "" : request.getAttribute("delete-success")%>
                                </h6>
                            </div>

                            <%
                                int doiThu = 0;
                                int doiCaoNhat = arr_ind.get(arr_ind.size() - 1).getBranch().split("-").length;
                                for (int i = 0; i < arr_ind.size(); i++) {
                                    String temp = "";
                                    int margin = 0;
                                    String data = "";
                                    doiThu = arr_ind.get(i).getBranch().split("-").length;
                                    //                                for(int i=doiThu+1;i<=doiCaoNhat;i++){
                                    //                                    data+="#a";
                                    //                                    data+=i;
                                    //                                    data+=ind.getIdIndividual();
                                    //                                    if(i!=doiCaoNhat){
                                    //                                        data+=", ";
                                    //                                    }
                                    //                                    else{
                                    //                                        data+=" ";
                                    //                                    }
                                    //                                }
                                    String id = "a" + String.valueOf(arr_ind.get(i).getIdIndividual());
                                    String target = "";
                                    String input = arr_ind.get(i).getBranch();
                                    for (int j = i + 1; j < arr_ind.size(); j++) {
                                        String branch = arr_ind.get(j).getBranch();
                                        if (branch.indexOf(input) != -1) {
                                            target += "#a" + arr_ind.get(j).getIdIndividual();

                                            Individual in = null;
                                            try {
                                                in = arr_ind.get(j + 1);
                                            } catch (Exception e) {
                                            }

                                            if (in != null) {
                                                if (arr_ind.get(j + 1).getBranch().indexOf(input) != -1) {
                                                    target += ",";
                                                }
                                            }
                                        }
                                    }
                                    System.out.println("id-> " + id + "    target->" + target);

                                    //success !! :)
                                    for (int k = 1; k <= doiThu; k++) {
                                        margin += 4;
                                    }

                                    temp += "<div class=\"collapse show\" id=\"" + id + "\">";
                                    temp += "<div style=\"margin-bottom:-1%\">";
                            //số đời
                                    temp += "<button class=\"btn btn-primary\" type=\"button\" data-toggle=\"collapse\" data-target='" + target + "' aria-expanded=\"false\" aria-controls=\"collapseExample\" style=\"margin-left:4%\">" + doiThu + "</button>";
                            //button tên        
                                    temp += "<a href=\"ParentageViewTreeExtend?id="+arr_ind.get(i).getIdIndividual()+" \"><button onclick=\"showInfo()\" class=\"mb-2 mr-2 btn btn-info\" style=\"width: 18%;margin-left:" + margin + "%;\"><div class=\"\" style=\"float:left\"><div class=\"font-icon-wrapper\"><i class=\"pe-7s-user\"> </i></div></div><p style=\"float:right; margin-bottom:0; margin-top:2.5%\">" + arr_ind.get(i).getName() + "</p></button></a>";
                            //nhóm lựa chọn        
                                    temp += "<div class=\"dropdown d-inline-block\"><button type=\button\" aria-haspopup=\"true\" aria-expanded=\"false\" data-toggle=\"dropdown\" class=\"mb-2 mr-2 dropdown-toggle btn btn-outline-info\"></button><div tabindex=\"-1\" role=\"menu\" aria-hidden=\"true\" class=\"dropdown-menu\">";

                            //edit
                                    temp += "<a href=\"EditIndividual?value=Redirect&idIndividual=" + arr_ind.get(i).getIdIndividual() + "\"><button class=\"dropdown-item mb-2 mr-2 btn-transition btn btn-outline-warning\"><i class=\"pe-7s-tools\" style=\"font-size: 1.2rem\"><span style=\"font-size:16px\">   Sửa</span></i></button></a>";
                            //delete
                                    temp += "<a onclick=\"return xacNhan()\" href=\"DeleteIndividual?page=parentage_treeview&id=" + arr_ind.get(i).getIdIndividual() + "\"><button class=\"dropdown-item mb-2 mr-2 btn-transition btn btn-outline-danger\"><i class=\"pe-7s-trash\" style=\"font-size: 1.2rem\"><span style=\"font-size:16px\">   Xóa</span></i></button></a>";
                            //add
                                    temp += "<a href=\"AddIndividual?value=Redirect&id=" + arr_ind.get(i).getIdIndividual() + "\"><button class=\"dropdown-item mb-2 mr-2 btn-transition btn btn-outline-info\"><i class=\"pe-7s-add-user\" style=\"font-size: 1.2rem\"><span style=\"font-size:16px\">   Thêm Con</span></i></button></a>";

                                    temp += "</div></div></div></div>";
                                    temp += "<br>";
                            %>
                            <%=temp%>

                            <%
                                }
                            %>
                        </div>
                        <div id="info" style="float: left; width: 25%;">
                            <div style="margin-bottom: 10%">
                                    <img style="width: 70%; margin-left: 14%" src="resources/images/<%=ind.getAvatar()==null?"imagenotfound.png":ind.getAvatar() %>" alt="your image" />
                            </div>
                            <div class="position-relative row form-group mb-1-1">
                                <label for="name" class="col-sm-4 col-form-label">
                                    Họ Và Tên
                                </label>
                                <div class="col-sm-8">
                                    <input value="" name="id" id="id" placeholder="" type="text" class="form-control" hidden="true">
                                    <input value="<%=ind.getName() %>" name="name" id="name" placeholder="" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="position-relative row form-group mb-1-1">
                                <label for="gender" class="col-sm-4 col-form-label">
                                    Giới Tính
                                </label>
                                <div class="col-sm-8">
                                    <input value="<%=ind.getGender()==0?"Nữ":"Nam"%>" name="gender" id="name" placeholder="" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="position-relative row form-group mb-1-1">
                                <label for="childth" class="col-sm-4 col-form-label">
                                    Con Thứ
                                </label>
                                <div class="col-sm-8">
                                    <input value="<%=ind.getChildth()%>" name="childth" id="childth" placeholder="" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="position-relative row form-group mb-1-1">
                                <label for="wifeorhusbandname" class="col-sm-4 col-form-label">
                                    Tên Vợ
                                </label>
                                <div class="col-sm-8">
                                    <input value="<%=ind.getWifeOrHusbandName()%>" name="wifeorhusbandname" id="wifeorhusbandname" placeholder="" type="text" class="form-control">
                                </div>
                            </div>
                            <div class="position-relative row form-group mb-1-1">
                                <label for="datebirth" class="col-sm-4 col-form-label">
                                    Ngày Sinh
                                </label>
                                <div class="col-sm-8">
                                    <input value="<%=ind.getDateBirth()%>" name="datebirth" id="datebirth" placeholder="" type="date" class="form-control">
                                </div>
                            </div>
                            <div class="position-relative row form-group mb-1-1">
                                <label for="datedeath" class="col-sm-4 col-form-label">
                                    Ngày Mất
                                </label>
                                <div class="col-sm-8">
                                    <input value="<%=ind.getDateBirth()%>" name="datedeath" id="datedeath" placeholder="" type="date" class="form-control">
                                </div>
                            </div>

                            <div class="position-relative row form-group mb-1-1">
                                <label for="moreinfo" class="col-sm-4 col-form-label">
                                    Thông Tin Thêm
                                </label>
                                <div class="col-sm-8">
                                    <textarea name="moreinfo" id="moreinfo" class="form-control"><%=ind.getMoreInfo()%></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--    <script>
        function showInfo() {
            document.getElementById('info').style.display = "block";
         }
    </script>>-->
    </body>
</html>