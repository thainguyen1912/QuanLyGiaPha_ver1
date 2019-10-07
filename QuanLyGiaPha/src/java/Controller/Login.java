
package Controller;

import Enity.Account;
import Enity.ParentAge;
import Model.Account_DAO;
import Model.DBConnection;
import Model.ParentAge_DAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {

    DBConnection db=new DBConnection();
    Account_DAO acc_dao=new Account_DAO(db);
    ParentAge_DAO par_dao=new ParentAge_DAO(db);
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String userName=request.getParameter("username");
        String passWord=request.getParameter("password");
        Account acc=null;
        acc=acc_dao.getOneAccount(userName, passWord);
        if(acc==null){
            request.setAttribute("LoginFalse", "Tên Tài Khoản Hoặc Mật Khẩu Không Đúng!");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
        else{
            
            HttpSession session=request.getSession();
            session.setAttribute("Account", acc);
            
            ParentAge par=null;
            par=par_dao.getOneParentAge(userName);
            if(par==null){
                RequestDispatcher rd=request.getRequestDispatcher("first_create_parentage.jsp");
                rd.forward(request, response);
            }
            else{
                session.setAttribute("Parentage", par);
                request.setAttribute("value", "parentage_info");
                RequestDispatcher rd=request.getRequestDispatcher("parentage_info.jsp");
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