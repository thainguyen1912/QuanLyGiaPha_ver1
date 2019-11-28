/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Enity.Image;
import Enity.Parentage;
import Model.DBConnection;
import Model.Image_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UploadAvatar", urlPatterns = {"/UploadAvatar"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100, // 100 MB
        location = "D:/Stored/netbean_workspace/QuanLyGiaPha/QuanLyGiaPha/web/resources/images/avatar")
public class UploadAvatar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        String fileName = "";
            for (Part part : request.getParts()) {
                if (part.getName().equals("avatar")) {
                    fileName = extractFileName(part);
                    DBConnection db = new DBConnection();
                    Image_DAO ima_dao=new Image_DAO(db);
                    String note=request.getParameter("note");
                    
                    LocalDate date = LocalDate.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    Date dateNow = (Date.valueOf(date.format(formatter)));
                    
                    HttpSession session = request.getSession();
                    Parentage par = (Parentage) session.getAttribute("Parentage");
                    int idPar = par.getId();
                    Image ima=new Image(fileName, note, dateNow, idPar);
                    ima_dao.Insert(ima);
                    
                    if (fileName != null && fileName.length() > 0) {
                        part.write(fileName);
                    }
                    try {
                        Thread.sleep(5000);
                    } catch (InterruptedException ex) { 
                        Logger.getLogger(UploadAvatar.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("ListAvatar");
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
