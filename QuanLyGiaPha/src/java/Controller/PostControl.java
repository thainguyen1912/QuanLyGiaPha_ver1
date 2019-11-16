/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Enity.Account;
import Enity.Post;
import Model.DBConnection;
import Model.Post_DAO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author thain
 */
@WebServlet(name = "PostControl", urlPatterns = {"/PostControl"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100, // 100 MB
        location = "D:/Stored/netbean_workspace/QuanLyGiaPha/QuanLyGiaPha/web/resources/images/post")
public class PostControl extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        String page=request.getParameter("page");
        DBConnection db = new DBConnection();
        RequestDispatcher rd=null;
        switch(page){
            case "redirect":
                request.setAttribute("title", "add_post");
                rd=request.getRequestDispatcher("views/management_page/manager/add_post.jsp");
                rd.forward(request, response);
                break;
            case "process_add":
                String title=request.getParameter("title");
                String summary=request.getParameter("summary");
                String detail=request.getParameter("detail");
                
                LocalDate date = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                Date dateNow = (Date.valueOf(date.format(formatter)));
                
                HttpSession session=request.getSession();
                Account acc=(Account)session.getAttribute("Account");
                String username=acc.getUserName();
                
                String fileName = "";
                for (Part part : request.getParts()) {
                    if (part.getName().equals("avatar")) {
                        fileName = extractFileName(part);
                        Post_DAO pos_dao=new Post_DAO(db);
                        Post pos=new Post(title, summary, detail, "0", "0", fileName, dateNow, username);
                        pos.toString();
                        pos_dao.insert(pos);
                        if (fileName != null && fileName.length() > 0) {
                            part.write(fileName);
                        }
                        try {
                            Thread.sleep(5000);
                        } catch (InterruptedException ex) { 
                            Logger.getLogger(PostControl.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("ParentageViewTree");
                    }
                }
                break;
            case "listpost":
                Post_DAO pos_dao=new Post_DAO(db);
                ArrayList<Post> list_post=pos_dao.selectAll();
                request.setAttribute("list_post", list_post);
                request.setAttribute("title", "list_post");
                rd=request.getRequestDispatcher("views/management_page/manager/list_post.jsp");
                rd.forward(request, response);
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
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
