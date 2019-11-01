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
    ArrayList<Individual> arr_ind = (ArrayList<Individual>) request.getAttribute("arr_ind");
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

                                        </div>
                                        <div class="row">
                                            <%
                                                if (arr_ind.size() == 0) {
                                            %>
                                                <h5 style="color: red">Không Có Ảnh Nào Để Hiển Thị</h5>
                                            <%}%>
                                            <%
                                                for (int i = 0; i < arr_ind.size(); i++) {
                                            %>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="card-shadow-cuccess mb-3 widget-chart widget-chart2 text-left card">
                                                    <div class="widget-content">
                                                        <div class="widget-content-outer" style="text-align: center">
                                                            <div class="widget-content-wrapper">
                                                                <div class="">
                                                                    <img src="images/<%=arr_ind.get(i).getAvatar()%>" width="100%"> 
                                                                </div>
                                                                <div class="">
                                                                </div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1 mt-2">
                                                                <div class="text-muted opacity-6"><%=arr_ind.get(i).getName()%></div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1">
                                                                <div class="text-muted opacity-6">Đời Thứ: <%= arr_ind.get(i).getFloor()%></div>
                                                            </div>
                                                            <div class="widget-content-left fsize-1 mt-2" style="">
                                                                <a href="EditIndividual?value=Redirect&idIndividual=<%=arr_ind.get(i).getIdIndividual()%>"><button class="btn-wide btn btn-success">Xem Chi Tiết</button></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%}%>
                                        </div>
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