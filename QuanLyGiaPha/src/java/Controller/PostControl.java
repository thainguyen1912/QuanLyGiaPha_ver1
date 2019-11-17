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
        
        HttpSession session=request.getSession();
        Account acc=(Account)session.getAttribute("Account");
        String username=acc.getUserName();
        Post_DAO pos_dao=new Post_DAO(db);
        
        switch(page){
            case "redirect_add":
                request.setAttribute("title", "add_post");
                rd=request.getRequestDispatcher("views/management_page/manager/add_post.jsp");
                rd.forward(request, response);
                break;
            case "redirect_edit":
                
                int id=Integer.valueOf(request.getParameter("id"));
                Post pos_re=pos_dao.selectByID(id);
                request.setAttribute("post", pos_re);
                request.setAttribute("title", "edit_post");
                rd=request.getRequestDispatcher("views/management_page/manager/edit_post.jsp");
                rd.forward(request, response);
                break;
            case "process_add":
                String title_pa=request.getParameter("title");
                String summary_pa=request.getParameter("summary");
                String detail_pa=request.getParameter("detail");
                
                LocalDate date_pa = LocalDate.now();
                DateTimeFormatter formatter_pa = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                Date dateNow_pa = (Date.valueOf(date_pa.format(formatter_pa)));
                
                String fileName_pa = "";
                for (Part part : request.getParts()) {
                    if (part.getName().equals("avatar")) {
                        fileName_pa = extractFileName(part);
                        Post pos_pa=new Post(title_pa, summary_pa, detail_pa, "0", "0", fileName_pa, dateNow_pa, username);
                        pos_dao.insert(pos_pa);
                        if (fileName_pa != null && fileName_pa.length() > 0) {
                            part.write(fileName_pa);
                        }
                        try {
                            Thread.sleep(5000);
                        } catch (InterruptedException ex) { 
                            Logger.getLogger(PostControl.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("PostControl?page=listpost");
                    }
                }
                break;
            case "process_edit":
                String title_pe=request.getParameter("title");
                String summary_pe=request.getParameter("summary");
                String detail_pe=request.getParameter("detail");
                
                LocalDate date_pe = LocalDate.now();
                DateTimeFormatter formatter_pe = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                Date dateNow_pe = (Date.valueOf(date_pe.format(formatter_pe)));
                
                String fileName_pe = "";
                for (Part part : request.getParts()) {
                    if (part.getName().equals("avatar")) {
                        fileName_pe = extractFileName(part);
                        Post pos_pe=new Post(title_pe, summary_pe, detail_pe, "0", "0", fileName_pe, dateNow_pe, username);
                        pos_dao.update(pos_pe);
                        if (fileName_pe != null && fileName_pe.length() > 0) {
                            part.write(fileName_pe);
                        }
                        try {
                            Thread.sleep(5000);
                        } catch (InterruptedException ex) { 
                            Logger.getLogger(PostControl.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.sendRedirect("PostControl?page=listpost");
                    }
                }
                break;
            case "delete":
                int id_d=Integer.valueOf(request.getParameter("id"));
                pos_dao.delete(id_d);
                response.sendRedirect("PostControl?page=listpost");
                break;
            case "listpost":
                ArrayList<Post> list_post=pos_dao.selectAllByUserName(username);
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
