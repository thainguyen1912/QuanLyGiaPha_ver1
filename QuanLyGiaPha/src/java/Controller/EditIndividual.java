
package Controller;

import Enity.Individual;
import Model.DBConnection;
import Model.Individual_DAO;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/EditIndividual")
@MultipartConfig(maxFileSize = 16177215)
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
            int id=Integer.valueOf(request.getParameter("id"));
            String name=request.getParameter("name");
            int gender=Integer.valueOf(request.getParameter("gender").toString());
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
            
            Part filePart=request.getPart("avatar");
            InputStream inputSteam=null;
            
            if(filePart!=null){
                inputSteam=filePart.getInputStream();
            }
            DBConnection db=new DBConnection();
            Individual_DAO ind_dao=new Individual_DAO(db);
            Individual ind=new Individual(id, id, name, wifeOrHusbandName, dateBirth, datedeath==null?0:1, datedeath, childth, id, id, gender, null, null, moreInfo);
            ind_dao.update(ind, inputSteam);
//            Individual ind=new Individual(id, id, name, wifeOrHusbandName, dateBirth, datedeath==null?0:1, datedeath, childth, id, id, gender, null, null, moreInfo);
//            DBConnection db=new DBConnection();
//            Individual_DAO ind_dao=new Individual_DAO(db);
//            ind_dao.update(ind, fis, image);
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
