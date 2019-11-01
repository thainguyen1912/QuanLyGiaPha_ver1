package Controller;

import static Controller.EditIndividual.SAVE_DIRECTORY;
import Enity.Individual;
import Enity.ParentAge;
import Model.DBConnection;
import Model.Individual_DAO;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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

@WebServlet("/AddIndividual")
@MultipartConfig(maxFileSize = 16177215)
public class AddIndividual extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String value = request.getParameter("value");
        int idFather = -1;

        if (value.equals("Redirect")) {
            idFather = Integer.valueOf(request.getParameter("id"));
            request.setAttribute("idFather", idFather);
            request.setAttribute("title", "add_individual");
            RequestDispatcher rd = request.getRequestDispatcher("views/management_page/user/add_individual.jsp");
            rd.forward(request, response);
        }
        if (value.equals("Process")) {
            HttpSession session = request.getSession();
            ParentAge par = (ParentAge) session.getAttribute("Parentage");
            int idPar = par.getId();
            System.out.println("id-> " + idPar);
            String name = request.getParameter("name");
            System.out.println("name -> " + name);
            int gender = Integer.valueOf(request.getParameter("gender").toString());
            System.out.println("gender-> " + gender);
            int childth = Integer.valueOf(request.getParameter("childth"));
            System.out.println("child->" + childth);
            String wifeOrHusbandName = request.getParameter("wifeorhusbandname");
            System.out.println("wifeOrHusbandName->" + wifeOrHusbandName);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateBirth = Date.valueOf(request.getParameter("datebirth"));
            System.out.println("dateBirth->" + dateBirth);
            Date datedeath = null;
            try {
                datedeath = Date.valueOf(request.getParameter("datedeath"));
            } catch (Exception e) {
            }
            System.out.println("datedeath->" + datedeath);
            String moreInfo = request.getParameter("moreinfo");
            System.out.println("moreInfo->" + moreInfo);
//            String appPath = request.getServletContext().getRealPath("");
//            appPath = appPath.replace('\\', '/');
//            System.out.println(appPath);
            String appPath = "D:/E/netbean_workspace/QuanLyGiaPha/QuanLyGiaPha/web/";
            String fullSavePath = null;
            if (appPath.endsWith("/")) {
                fullSavePath = appPath + SAVE_DIRECTORY;
            } else {
                fullSavePath = appPath + "/" + SAVE_DIRECTORY;
            }
            String filePath = "";
            String fileName = "";
            for (Part part : request.getParts()) {
                if (part.getName().equals("avatar")) {
                    fileName = extractFileName(part);
                    idFather = Integer.valueOf(request.getParameter("idFather"));
                    DBConnection db = new DBConnection();
                    Individual_DAO ind_dao = new Individual_DAO(db);
                    int fatherFloor = ind_dao.getFloorById(idFather);
                    System.out.println(fatherFloor);
                    Individual ind = new Individual(-1, idPar, name, wifeOrHusbandName, dateBirth, datedeath, childth, idFather, gender, null, fileName, moreInfo, fatherFloor + 1);

                    ind_dao.InsertIndividual(ind);

                    int maxid = ind_dao.maxId(idPar);
                    Individual i = ind_dao.getIndividualById(maxid);
                    String branchFather = ind_dao.getIndividualById(idFather).getBranch();
                    String branchChild = branchFather + "-" + i.getIdIndividual();
                    ind_dao.updateBranch(branchChild, maxid, idPar);

                    if (fileName != null && fileName.length() > 0) {
                        filePath = fullSavePath + File.separator + fileName;
                        System.out.println("Write attachment to file: " + filePath);

                        // Ghi vào file.
                        part.write(filePath);
                    }
                    String path = request.getServletContext().getRealPath("/images/" + fileName);
                    try {
                        Thread.sleep(5000);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(EditIndividual.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    response.sendRedirect("ParentageViewTree");
                }
            }
        }
    }

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
