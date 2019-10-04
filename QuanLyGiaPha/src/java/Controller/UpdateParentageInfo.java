
package Controller;

import Enity.Account;
import Enity.ParentAge;
import Model.DBConnection;
import Model.ParentAge_DAO;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateParentageInfo extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String name=request.getParameter("name");
        String ancestor=request.getParameter("ancestor");
        String address=request.getParameter("address");
        Date anniversary=Date.valueOf(request.getParameter("anniversary"));
        String history=request.getParameter("history");
        String note=request.getParameter("note");
        String headName=request.getParameter("headname");
        String headaddress=request.getParameter("headaddress");
        String headnumberphone=request.getParameter("headnumberphone");
        
        HttpSession session=request.getSession();
        Account acc=(Account)session.getAttribute("Account");
        ParentAge par_session = (ParentAge) session.getAttribute("Parentage");
        
        Date dateCreate=par_session.getDateCreate();
        String userName=acc.getUserName();
        
        ParentAge par=new ParentAge(name, ancestor, address, anniversary, history, note, dateCreate, headName, headaddress, headnumberphone, userName);
        
        DBConnection db=new DBConnection();
        ParentAge_DAO par_dao=new ParentAge_DAO(db);
        par_dao.Update(par);
        
        ParentAge par_session_update=par_dao.getOneParentAge(userName);
        session.setAttribute("Parentage", par_session_update);
        
        request.setAttribute("UpdateParentageSuccess", "Bạn Vừa Cập Nhật Thông Tin Thành Công");
        RequestDispatcher rd=request.getRequestDispatcher("parentage_info.jsp");
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
