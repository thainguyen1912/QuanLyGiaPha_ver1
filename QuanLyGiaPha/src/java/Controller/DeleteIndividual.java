
package Controller;

import Enity.Individual;
import Model.DBConnection;
import Model.Individual_DAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DeleteIndividual", urlPatterns = {"/DeleteIndividual"})
public class DeleteIndividual extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        int id=Integer.valueOf(request.getParameter("id"));
        String page=request.getParameter("page");
        DBConnection db=new DBConnection();
        Individual_DAO ind_dao=new Individual_DAO(db);
        boolean check=ind_dao.checkChild(id);
        if(check==true){
            request.setAttribute("delete-error", "Không Thể Xóa Thành Viên Này Vì Có Liên Kết Với Thành Viên Khác");
            if(page.equals("parentage_treeview")){
                RequestDispatcher rd=request.getRequestDispatcher("ParentageViewTree");
                rd.forward(request, response);
            }
            if(page.equals("list_individual")){
                RequestDispatcher rd=request.getRequestDispatcher("ListIndividual");
                rd.forward(request, response);
            }
        }
        else{
            Individual ind=ind_dao.getIndividualById(id);
            ind_dao.deleteIndividual(id);
            request.setAttribute("delete-success", "Thực Hiện Xóa Thành Công Thành Viên: "+ind.getName());
            if(page.equals("parentage_treeview")){
                RequestDispatcher rd=request.getRequestDispatcher("ParentageViewTree");
                rd.forward(request, response);
            }
            if(page.equals("list_individual")){
                RequestDispatcher rd=request.getRequestDispatcher("ListIndividual");
                rd.forward(request, response);
            }
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
