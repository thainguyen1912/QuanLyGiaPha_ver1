
package Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "HomePage", urlPatterns = {"/HomePage"})
public class HomePage extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String pathInfo = request.getRequestURI().substring(request.getContextPath().length());
        System.out.println(pathInfo);
        String page=request.getParameter("page");
        RequestDispatcher rd=null;
        switch(page){
            case "index":
                rd = request.getRequestDispatcher("views/home_page/index.jsp");
                rd.forward(request, response);
                break;
            case "parentageVN":
                
                rd = request.getRequestDispatcher("views/home_page/parentageVN.jsp");
                rd.forward(request, response);
                break;
            case "news":
                rd = request.getRequestDispatcher("views/home_page/news.jsp");
                rd.forward(request, response);
                break;
            case "about":
                rd = request.getRequestDispatcher("views/home_page/about.jsp");
                rd.forward(request, response);
                break;
            case "newsdetail":
                int id =Integer.valueOf(request.getParameter("id"));
                request.setAttribute("id", id);
                rd = request.getRequestDispatcher("views/home_page/newsdetail.jsp");
                rd.forward(request, response);
                break;
            default:
                rd = request.getRequestDispatcher("views/home_page/newsdetail.jsp");
                rd.forward(request, response);
                break;
            //default:
               // rd = request.getRequestDispatcher("views/home_page/index.jsp");
               // rd.forward(request, response);
               // break;
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
