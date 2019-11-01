<%@page import="Model.Individual_DAO"%>
<%@page import="Enity.Individual"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.ParentAge_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.ParentAge"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Enity.ParentAge"%>
<%
    DBConnection db= new DBConnection();
    ParentAge_DAO parentVN = new ParentAge_DAO(db);
    List<ParentAge> arr_paVN=parentVN.getAllParentAge();
    Individual_DAO indi= new Individual_DAO(db);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>GIAPHAVIETNAM</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="resources/import_css.jsp" flush="true" />
    </head>
    <body class="goto-here">
        <jsp:include page="resources/header1.jsp" flush="true" />
        <jsp:include page="resources/header2.jsp" flush="true" />

        <div class="hero-wrap hero-bread mb-3" style="background-image: url('images/58005.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center fadeInUp ftco-animated">
                        <h1 class="mb-0 bread" style="font-family: serif ; font-size: 50px">HỆ THỐNG CÁC DÒNG HỌ VIỆT NAM</h1>
                    </div>
                </div>
            </div>
        </div>
        
        
         <table class="mb-0 table table-hover" style="text-align: center">
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th style="font-weight:bold; font-family: sans-serif; color: black">Tên Dòng họ</th>
                                                    <th>Trưởng họ</th>
                                                    <th>Nguyên quán</th>
                                                    <th>Ngày lập</th>
                                                    <th>Số thành viên</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <%
                                                    for(int i=0;i<arr_paVN.size();i++){
                                                %>
                                                <tr>
                                                    <th><%=i+1 %></th>
                        
                                                    <td><%=arr_paVN.get(i).getName()%></td>
                                                    <td><%=arr_paVN.get(i).getHeadName()%></td>
                                                    <td><%=arr_paVN.get(i).getAddress()%></td>
                                                    <td><%=arr_paVN.get(i).getDateCreate()%></td>
                                                    <td><%=indi.getNumber(arr_paVN.get(i).getId()) %></td>
                                                
                                                </tr>
                                                <%
                                                }
                                                %>
                                            </tbody>
                                        </table>
        
        
        <hr>
        <jsp:include page="resources/footer.jsp" flush="true" />
        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <jsp:include page="resources/import_js.jsp" flush="true" />
    </body>
</html>