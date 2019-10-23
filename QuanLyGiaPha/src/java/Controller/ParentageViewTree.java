/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Enity.Individual;
import Enity.ParentAge;
import Model.DBConnection;
import Model.Individual_DAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(value= "/ParentageViewTree")
public class ParentageViewTree extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        //value parentage_viewtree
            request.setAttribute("title", request.getParameter("title"));
        //
        //get all individual
            DBConnection db=new DBConnection();
            Individual_DAO ind_dao=new Individual_DAO(db);
            ArrayList<Individual> arr_ind=new ArrayList<Individual>();
            //get parentage id from session
                HttpSession session=request.getSession();
                ParentAge par=(ParentAge)session.getAttribute("Parentage");
                int idParentageSession=par.getId();
            //
            ResultSet rs=ind_dao.SelectByParentageId(idParentageSession);
            try {
                while(rs.next()){
                    int id=rs.getInt(1);
                    int idParentage=rs.getInt(2);
                    String name=rs.getString(3);
                    String wifeOrHusbandName=rs.getString(4);
                    Date dateBirth=rs.getDate(5);
                    Date dateDeath=rs.getDate(6);
                    int childth=rs.getInt(7);
                    int idFather=rs.getInt(8);
                    int gender=rs.getInt(9);
                    String brand=rs.getString(10);
                    String avatar=rs.getString(11);
                    String moreInfo=rs.getString(12);
                    Individual ind=new Individual(id, idParentage, name, wifeOrHusbandName, dateBirth, dateDeath, childth, idFather, gender, brand, avatar, moreInfo);
                    arr_ind.add(ind);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ParentageViewTree.class.getName()).log(Level.SEVERE, null, ex);
            }
        //
        request.setAttribute("arr_ind", arr_ind);
        RequestDispatcher rd=request.getRequestDispatcher("parentage_treeview.jsp");
        rd.forward(request, response);
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
