/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Enity.Parentage;
import Enity.Post;
import Model.DBConnection;
import Model.Parentage_DAO;
import Model.Post_DAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thain
 */
@WebServlet(name = "AdminControl", urlPatterns = {"/AdminControl"})
public class AdminControl extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        DBConnection db=new DBConnection();
        
        RequestDispatcher rd=null;
        String page=request.getParameter("page");
        
        switch(page){
            case "list_parentage":
                Parentage_DAO par_dao=new Parentage_DAO(db);
                request.setAttribute("title", "list_parentage");
                List<Parentage> list_par=par_dao.getAllParentAge();
                request.setAttribute("list_par", list_par);
                rd=request.getRequestDispatcher("views/management_page/admin/list_parentage.jsp");
                rd.forward(request, response);
                break;
                
            case "process_post":
                Post_DAO pos_dao=new Post_DAO(db);
                
                ArrayList<Post> arr_pos=pos_dao.getListPostByStatusAndKey("0", "0");
                
                request.setAttribute("arr_pos", arr_pos);
                request.setAttribute("title", "process_post");
                rd=request.getRequestDispatcher("views/management_page/admin/list_processpost.jsp");
                rd.forward(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
