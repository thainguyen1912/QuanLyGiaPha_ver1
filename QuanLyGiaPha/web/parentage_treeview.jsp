<%@page import="java.sql.Date"%>
<%@page import="Model.DBConnection"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="java.sql.ResultSet"%>
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

                        
<!--                        <div class="collapse show" id="a">
                            <div class="mt-3">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim
                            </div>
                        </div>-->
                        
                        <%      
                            int doiThu=0;
                            int doiCaoNhat=arr_ind.get(arr_ind.size()-1).getBranch().split("-").length;
                            for(int i=0;i<arr_ind.size();i++){
                                String temp = "";
                                int margin = 0;
                                String data="";
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
                                String id="a" + String.valueOf(arr_ind.get(i).getIdIndividual());
                                String target="";
                                String input=arr_ind.get(i).getBranch();
                                for(int j=i+1;j<arr_ind.size();j++){
                                    String branch=arr_ind.get(j).getBranch();
                                    if(branch.indexOf(input)!=-1){
                                        target+="#a"+arr_ind.get(j).getIdIndividual();
                                        
                                        Individual in=null;
                                        try {
                                                in = arr_ind.get(j + 1);
                                            } catch (Exception e) {
                                            }
                                        
                                        if(in!=null){
                                            if(arr_ind.get(j+1).getBranch().indexOf(input)!=-1) target+=",";
                                        }
                                    }
                                }
                                System.out.println("id-> "+id+ "    target->" + target);
                                
                                //success !! :)
                                
                                
                                for (int k = 1; k <= doiThu; k++) {
                                    margin += 4;
                                }
                                
                                temp+="<div class=\"collapse show\" id=\""+id+"\">";
                                temp+="<div style=\"margin-bottom:-1%\">";
                                temp += "<button class=\"btn btn-primary\" type=\"button\" data-toggle=\"collapse\" data-target='"+target+"' aria-expanded=\"false\" aria-controls=\"collapseExample\" style=\"margin-left:4%\">+</button>";
                                
                                temp += "<button class=\"mb-2 mr-2 btn btn-info\" style=\"width: 18%;margin-left:" + margin + "%;\"><div class=\"\" style=\"float:left\"><div class=\"font-icon-wrapper\"><i class=\"pe-7s-user\"> </i></div></div><p style=\"float:right; margin-bottom:0; margin-top:2.5%\">" + arr_ind.get(i).getName() + "</p></button>";
//                                    edit
                                temp += "<a href=\"EditIndividual?value=Redirect&idIndividual="+arr_ind.get(i).getIdIndividual()+"\"><button class=\"mb-2 mr-2 btn-transition btn btn-outline-warning\"><i class=\"pe-7s-tools\" style=\"font-size: 1.2rem\"></i></button></a>";
//                                    delete
                                temp += "<a href=\"edit_individual.jsp\"><button class=\"mb-2 mr-2 btn-transition btn btn-outline-danger\"><i class=\"pe-7s-trash\" style=\"font-size: 1.2rem\"></i></button></a>";
//                                    add
                                temp += "<a href=\"AddIndividual?value=Redirect&id="+arr_ind.get(i).getIdIndividual() +"\"><button class=\"mb-2 mr-2 btn-transition btn btn-outline-info\"><i class=\"pe-7s-add-user\" style=\"font-size: 1.2rem\"></i></button></a>";
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