package pageController;

import bean.LoginStaff;
import beanController.LoginStaffController;
import java.io.IOException;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joseph
 */
public class editprofilePageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        redirectWithAuth(request.getSession(false), response);
        try {
            dispatcher = request.getRequestDispatcher("/WEB-INF/editprofile.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        LoginStaffController lsc = new LoginStaffController();
        Map<String, String[]> map = request.getParameterMap();
        if(Integer.parseInt(map.get("staffid")[0])==((LoginStaff)session.getAttribute("CurrentUser")).getStaffID() && lsc.updateStaffByMap(map)){
            session.setAttribute("CurrentUser", lsc.getStaff(Integer.parseInt(map.get("staffid")[0])));
            response.sendRedirect("editprofile");
        }else{
            request.setAttribute("invalid_change", true);
            request.getRequestDispatcher("/WEB-INF/editprofile.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
