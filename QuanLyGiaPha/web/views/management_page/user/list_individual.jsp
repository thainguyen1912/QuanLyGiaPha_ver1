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
    ArrayList<Individual> arr_ind=(ArrayList<Individual>)request.getAttribute("arr_ind");
%>
<!doctype html>
<html lang="en">
    <jsp:include page="../import_page/import.jsp" flush="true"/>
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="../import_page/header.jsp" flush="true"/> 
            <jsp:include page="../import_page/setting_ui.jsp" flush="true"/>
            <div class="app-main" style="overflow: auto">
                <jsp:include page="../import_page/left_menu.jsp" flush="true"/>
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="../import_page/page_title.jsp" flush="true"/>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-card mb-3 card">
                                    <div class="card-body">
                                        <div style="text-align: center; margin-bottom: 2%">
                                            <h6 style="color: red">
                                                <%=request.getAttribute("delete-error")==null?"": request.getAttribute("delete-error")%>
                                            </h6>
                                            <h6 style="color: green">
                                                <%=request.getAttribute("delete-success")==null?"": request.getAttribute("delete-success")%>
                                            </h6>
                                        </div>
                                        <table class="mb-0 table table-hover" style="text-align: center">
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Ảnh</th>
                                                    <th>Họ Và Tên</th>
                                                    <th>Tên Vợ/ Chồng</th>
                                                    <th>Đời Thứ</th>
                                                    <th>Giới Tính</th>
                                                    <th>Ngày Sinh</th>
                                                    <th>Ngày Mất</th>
                                                    <th>Thao Tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <%
                                                    for(int i=0;i<arr_ind.size();i++){
                                                %>
                                                <tr>
                                                    <th><%=i+1 %></th>
                                                    <td>
                                                        <img src="images/<%=arr_ind.get(i).getAvatar()==null?"imagenotfound.png": arr_ind.get(i).getAvatar()%>" width="100px">
                                                    </td>
                                                    <td><%=arr_ind.get(i).getName()%></td>
                                                    <td><%=arr_ind.get(i).getWifeOrHusbandName()%></td>
                                                    <td><%=arr_ind.get(i).getFloor()%></td>
                                                    <td><%=arr_ind.get(i).getGender()==1?"Nam":"Nữ"%></td>
                                                    <td><%=arr_ind.get(i).getDateBirth()%></td>
                                                    <td><%=arr_ind.get(i).getDateDeath()%></td>
                                                    <td>
                                                        <div class="dropdown d-inline-block">
                                                            <button type=button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown" class="mb-2 mr-2 dropdown-toggle btn btn-outline-info"></button>
                                                            <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu">
                                                                <a href="EditIndividual?value=Redirect&idIndividual=<%=arr_ind.get(i).getIdIndividual()%>">
                                                                    <button class="dropdown-item mb-2 mr-2 btn-transition btn btn-outline-warning">
                                                                        <i class="pe-7s-tools" style="font-size: 1.2rem">
                                                                            <span style="font-size:16px">   Sửa</span>
                                                                        </i>
                                                                    </button>
                                                                </a>
                                                                    <a onclick="return xacNhan()" href="DeleteIndividual?page=list_individual&id=<%=arr_ind.get(i).getIdIndividual()%>">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>