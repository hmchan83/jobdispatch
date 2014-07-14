package pageController;

import beanController.LoginStaffController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joseph
 */
public class bo_indexPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!authAdmin(request.getSession(false)))
            request.getRequestDispatcher("/WEB-INF/bo/bo_index.jsp").forward(request, response);
        else
            response.sendRedirect("bo_main");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //do authentication first
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = null;
        LoginStaffController lsc = new LoginStaffController();
        if(lsc.VerifyAdmin(username, password)){
            if(lsc.getUser() != null){
                session = request.getSession(true);
                session.setMaxInactiveInterval(-1);
                session.setAttribute("CurrentUser", lsc.getUser());
                response.sendRedirect("bo_main");   
            }
        }else{
            request.setAttribute("invalid_login", true);
            doGet(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
