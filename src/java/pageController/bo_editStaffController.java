package pageController;

import beanController.DepartmentController;
import beanController.LoginStaffController;
import beanController.StaffController;
import beanController.UserRoleController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class bo_editStaffController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("currentStaff", new LoginStaffController().getStaff(Integer.parseInt(request.getParameter("staffid"))));
        request.setAttribute("userrole", new UserRoleController().getRoleList());
        request.setAttribute("departments", new DepartmentController().getDeptList());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/bo/bo_editstaff.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        new LoginStaffController().updateStaffByMap(request.getParameterMap());
        response.sendRedirect("bo_editStaff?staffid="+request.getParameter("staffid"));
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
