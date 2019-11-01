
package Controller;

import Enity.Account;
import Model.Account_DAO;
import Model.DBConnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "UserAction", urlPatterns = {"/UserAction"})
public class UserAction extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String page=request.getParameter("page");
        RequestDispatcher rd=null;
        HttpSession session = request.getSession();
        switch(page){
            case "info":
                request.setAttribute("title", "user_info");
                rd = request.getRequestDispatcher("views/management_page/user/user_info.jsp");
                rd.forward(request, response);
                break;
            case "change_pass":
                request.setAttribute("title", "change_pass");
                rd = request.getRequestDispatcher("views/management_page/user/user_pass.jsp");
                rd.forward(request, response);
                break;
            case "process_pass":
                request.setAttribute("title", "user_info");
                Account acc = (Account) session.getAttribute("Account");
                
                String oldPass=request.getParameter("old_pass");
                if(acc.getPassWord().equals(oldPass)==true){
                    String newPass=request.getParameter("new_pass");
                    String renewPass=request.getParameter("renew_pass");
                    if(newPass.equals(renewPass)==true){
                        DBConnection db=new DBConnection();
                        Account_DAO acc_dao=new Account_DAO(db);
                        acc_dao.updatePass(acc.getUserName(), newPass);
                        request.setAttribute("mess", "Sửa Đổi Mật Khẩu Thành Công");
                        rd = request.getRequestDispatcher("views/management_page/user/user_pass.jsp");
                        rd.forward(request, response);
                    }
                    else{
                        request.setAttribute("mess", "Mật Khẩu Mới Không Trùng Nhau");
                        rd = request.getRequestDispatcher("views/management_page/user/user_pass.jsp");
                        rd.forward(request, response);
                    }
                }
                else{
                    request.setAttribute("mess", "Mật Khẩu Cũ Không Đúng");
                    rd = request.getRequestDispatcher("views/management_page/user/user_pass.jsp");
                    rd.forward(request, response);
                }
                break;
            case "logout":
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect("HomePage?page=index");
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
