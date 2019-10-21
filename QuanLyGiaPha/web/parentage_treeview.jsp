<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="PrintfTree.PrintTree"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Enity.Individual"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Enity.ParentAge"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    ParentAge par = (ParentAge) session.getAttribute("Parentage");
    ArrayList<Individual> arr_ind = (ArrayList<Individual>) request.getAttribute("arr_ind");
    DBConnection db = new DBConnection();
    Individual_DAO ind_dao = new Individual_DAO(db);
    
%>
<!doctype html>
<html lang="en">
    <jsp:include page="import.jsp" />
    <body>
        <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
            <jsp:include page="header.jsp" /> 
            <jsp:include page="setting_ui.jsp" />
            <div class="app-main" style="overflow: auto">
                <jsp:include page="left_menu.jsp" />
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <jsp:include page="page_title.jsp" />

                        <div>
                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#a"
                                    aria-expanded="true" aria-controls="collapseExample">
                                Button with data-target
                            </button>
                        </div>
                        <!-- / Collapse buttons -->

                        <!-- Collapsible element -->
                        <div class="collapse show" id="a">
                            <div class="mt-3">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim
                            </div>
                        </div>
                        
                        <%      
                            int doiThu=0;
                            int doiCaoNhat=arr_ind.get(arr_ind.size()-1).getBranch().split("-").length;
                            for (Individual ind : arr_ind) {
                                doiThu = ind.getBranch().split("-").length;
                                
                                String temp = "";
                                int margin = 0;
                                String data="";
                                for(int i=doiThu+1;i<=doiCaoNhat;i++){
                                    data+="#a";
                                    data+=i;
                                    data+=ind.getIdIndividual();
                                    if(i!=doiCaoNhat){
                                        data+=", ";
                                    }
                                    else{
                                        data+=" ";
                                    }
                                }
                                for (int i = 1; i <= doiThu; i++) {
                                    margin += 8;
                                }
                                
                                temp+="<div class=\"collapse show\" id=\"a"+doiThu+ind.getIdFather()+"\">";
                                temp+="<div>";
                                temp += "<button class=\"btn btn-primary\" type=\"button\" data-toggle=\"collapse\" data-target='"+data+"' aria-expanded=\"false\" aria-controls=\"collapseExample\" style=\"margin-left:4%\">+</button>";
                                
//                                temp += "<button class=\"mb-2 mr-2 btn-transition btn btn-outline-info\" style=\"margin-left:4%\">" + doiThu + "</button>";
                                temp += "<button class=\"mb-2 mr-2 btn btn-info\" style=\"width: 18%;margin-left:" + margin + "%;\"><div class=\"col-md-2\"><div class=\"font-icon-wrapper\"><i class=\"pe-7s-user\"> </i></div></div><span>" + ind.getName() + "</span></button>";
//                                    edit
                                temp += "<a href=\"EditIndividual?value=Redirect&idIndividual="+ind.getIdIndividual()+"\"><button class=\"mb-2 mr-2 btn-transition btn btn-outline-warning\"><i class=\"pe-7s-tools\" style=\"font-size: 1.6rem\"></i></button></a>";
//                                    delete
                                temp += "<a href=\"edit_individual.jsp\"><button class=\"mb-2 mr-2 btn-transition btn btn-outline-danger\"><i class=\"pe-7s-trash\" style=\"font-size: 1.6rem\"></i></button></a>";
                                temp+="</div></div>";
                                temp += "<br>";
                        %>
                        <%=temp%>

                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="assets/scripts/main.js"></script>
    </body>
</html>
