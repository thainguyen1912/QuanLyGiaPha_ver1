package Controller;

import Enity.Account;
import Enity.Parentage;
import Model.Account_DAO;
import Model.DBConnection;
import Model.Parentage_DAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String pathInfo = request.getRequestURI().substring(request.getContextPath().length());
        System.out.println(request.getContextPath());
        System.out.println(pathInfo);
        
        String value = "";
        try {
            value = request.getParameter("value");
        } catch (Exception e) {
        }
        if (value.equals("LoginPage")) {
            RequestDispatcher rd = request.getRequestDispatcher("views/login_register_page/login.jsp");
            rd.forward(request, response);
        } else {
            if (value.equals("CheckLogin")) {
                DBConnection db = new DBConnection();
                Account_DAO acc_dao = new Account_DAO(db);
                Parentage_DAO par_dao = new Parentage_DAO(db);
                String userName = request.getParameter("username");
                String passWord = request.getParameter("password");
                Account acc = null;
                try {
                    acc = acc_dao.getOneAccount(userName, passWord);
                } catch (Exception e) {
                }

                if (acc == null) {
                    request.setAttribute("LoginFalse", "Tên Tài Khoản Hoặc Mật Khẩu Không Đúng!");
                    RequestDispatcher rd = request.getRequestDispatcher("views/login_register_page/login.jsp");
                    rd.forward(request, response);
                }else {
                    HttpSession session = request.getSession();
                    session.setAttribute("Account", acc);
                    
                    if(acc.getRole()==2){ //0-normal, 1-manager, 2-admin
                        response.sendRedirect("AdminControl?page=list_parentage");
                    }
                    else{
                        Parentage par = null;
                        par = par_dao.getOneParentAge(userName);
                        if (par == null) {
                            response.sendRedirect("CreateParentage?value=CreatePage");
                        } else {
                            session.setAttribute("Parentage", par);
                            response.sendRedirect("ParentageInfo");
                        }
                    }
                }
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