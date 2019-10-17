/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet(value= "/EditIndividual")
public class EditIndividual extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String value=request.getParameter("value");
        if(value.equals("Redirect")){
            String idIndividual=request.getParameter("idIndividual");
            request.setAttribute("idIndividual", idIndividual);
            request.setAttribute("title", "edit_individual");
            RequestDispatcher rd=request.getRequestDispatcher("edit_individual.jsp");
            rd.forward(request, response);
        }
        if(value.equals("Process")){
            String name=request.getParameter("name");
            String gender=request.getParameter("gender");
            int childth=Integer.valueOf(request.getParameter("childth"));
            String wifeOrHusbandName=request.getParameter("wifeorhusbandname");
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date dateBirth=Date.valueOf(request.getParameter("datebirth"));
            Date datedeath=null;
            try {
                datedeath = Date.valueOf(request.getParameter("datedeath"));
            } catch (Exception e) {
            }
            String moreInfo=request.getParameter("moreinfo");
            Part part=request.getPart("avatar");
            System.out.println(part.toString());

            request.setAttribute("value", "edit_individual");
            RequestDispatcher rd=request.getRequestDispatcher("edit_individual.jsp");
            rd.forward(request, response);
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
