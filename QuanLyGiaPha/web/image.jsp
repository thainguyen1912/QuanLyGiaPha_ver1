<%@page import="java.io.OutputStream"%>
<%@page import="Model.Individual_DAO"%>
<%@page import="Model.DBConnection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%
    DBConnection db = new DBConnection();
    Individual_DAO ind_dao = new Individual_DAO(db);
    ResultSet rs=ind_dao.getResultSetById(1);
    byte[ ] imgData = null ;
    Blob image = null;
    if(rs.next()){
        image = rs.getBlob("avatar");
        imgData = image.getBytes(1,(int)image.length());
    }
    response.setContentType("image/gif");
    OutputStream o = response.getOutputStream();
    o.write(imgData);
    o.flush();
    o.close();
%>
