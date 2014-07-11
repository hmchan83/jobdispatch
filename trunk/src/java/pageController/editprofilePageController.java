package pageController;

import bean.LoginStaff;
import beanController.LoginStaffController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.util.ParameterMap;

/**
 *
 * @author Joseph
 */
public class editprofilePageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        if (!authentication(request.getSession(false))) {
            response.sendRedirect("index");
        } else {
            try {
                dispatcher = request.getRequestDispatcher("/WEB-INF/editprofile.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration pNames = request.getParameterNames();
        ParameterMap pMap = new ParameterMap();
        HttpSession session = request.getSession(false);
        while (pNames.hasMoreElements()){
            String pName = (String)pNames.nextElement();
            if(!pName.equals("staffid"))
                if((pName.equals("password") && !request.getParameter("password").equals("")) || (!pName.equals("password")))
                    pMap.put(pName, request.getParameter(pName));
        }
        LoginStaffController lsc = new LoginStaffController((LoginStaff)session.getAttribute("CurrentUser"));
        if(lsc.update(pMap)){
            session.setAttribute("CurrentUser", lsc.getUser());
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
