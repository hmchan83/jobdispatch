package pageController;

import bean.Staff;
import beanController.StaffController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class bo_staffQueryResultPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        bo_redirectWithAuth(request.getSession(false), response);
        ArrayList<Staff> staffs = new StaffController().getStaffsByMap(request.getParameterMap());
        if (request.getAttribute("result") == null) {
            request.setAttribute("result", staffs);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/bo/bo_staffquery_result.jsp");
        try{
            rd.forward(request, response);
        }catch(Exception e){}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!isNullOrEmpty(request.getParameter("retire"))){
            int StaffID = Integer.parseInt(request.getParameter("retire"));
            new StaffController().retireStaff(StaffID);
        }
        if(!isNullOrEmpty(request.getParameter("hire"))){
            int StaffID = Integer.parseInt(request.getParameter("hire"));
            new StaffController().hireStaff(StaffID);
        }
        response.sendRedirect("bo_staffQueryResult");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
