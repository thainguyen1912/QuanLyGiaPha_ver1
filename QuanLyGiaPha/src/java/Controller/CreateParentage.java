package Controller;

import Enity.Account;
import Enity.Individual;
import Enity.ParentAge;
import Model.DBConnection;
import Model.Individual_DAO;
import Model.ParentAge_DAO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value = "/CreateParentage")
public class CreateParentage extends HttpServlet {

    DBConnection db = new DBConnection();
    ParentAge_DAO par_dao = new ParentAge_DAO(db);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String value = "";
        try {
            value = request.getParameter("value");
        } catch (Exception e) {
        }
        if (value.equals("CreatePage")) {
            RequestDispatcher rd = request.getRequestDispatcher("first_create_parentage.jsp");
            rd.forward(request, response);
        } else {
            if (value.equals("CheckCreate")) {
                String parentageName = request.getParameter("parentagename");
                String individualName=request.getParameter("individualname");
                Date dateBirth=Date.valueOf(request.getParameter("datebirth"));
                Date dateDeath=Date.valueOf(request.getParameter("datedeath"));
                String address = request.getParameter("address");
                
                //getusername before login
                HttpSession session = request.getSession();
                Account acc = (Account) session.getAttribute("Account");
                String userName = acc.getUserName();
                //
                //getdatenow
                LocalDate date = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                Date dateNow = (Date.valueOf(date.format(formatter)));
                //
                ParentAge par = new ParentAge(parentageName, individualName, address, null, null, null, dateNow, null, null, null, userName);
                par_dao.Insert(par);
                
                //get idparentage foreign key
                int idParentage=par_dao.getOneParentAge(userName).getId();
                //
                
                Individual ind=new Individual(idParentage, individualName, null, dateBirth, dateDeath==null?0:1, dateDeath, 1, -1, 0, 1, null, null, null);
                Individual_DAO ind_dao=new Individual_DAO(db);
                ind_dao.Insert(ind);
                
                session.setAttribute("Parentage", par);

                RequestDispatcher rd = request.getRequestDispatcher("parentage_info.jsp");
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
