package pageController;

import beanController.StaffController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class staffDetailPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        redirectWithAuth(request.getSession(false), response);
        int staffid = Integer.parseInt(request.getParameter("staffid"));
        request.setAttribute("staff", new StaffController().getStaff(staffid));
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/staff-detail.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
