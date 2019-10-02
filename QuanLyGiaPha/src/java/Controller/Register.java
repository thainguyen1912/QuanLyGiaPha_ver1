
package Controller;

import Enity.Account;
import Model.Account_DAO;
import Model.DBConnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Register extends HttpServlet {

    final int roleManagerDefault=1;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String userName=request.getParameter("username");
        String passWord1=request.getParameter("password1");
        String passWord2=request.getParameter("password2");
        if(passWord1.equals(passWord2)==false){
            request.setAttribute("PasswordFalse", "Mật Khẩu Bạn Nhập Không Giống Nhau");
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
        else{
            DBConnection db=new DBConnection();
            Account_DAO acc_dao=new Account_DAO(db);
            if(acc_dao.getOneAccountByUserName(userName)!=null){
                request.setAttribute("UserNameExist", "Tài Khoản Này Đã Tồn Tại");
                RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            }
            else{
                acc_dao.Insert(new Account(userName, passWord1, roleManagerDefault));
                request.setAttribute("CreateSuccess", "Bạn Vừa Tạo Tài Khoản Thành Công");
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
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
