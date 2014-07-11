package pageController;

import beanController.LoginStaffController;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class indexPageController extends pageController {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!authentication(request.getSession(false)))
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        else
            response.sendRedirect("main");            
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //do authentication first
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = null;
        LoginStaffController lsc = new LoginStaffController();
        if(lsc.Verify(username, password)){
            if(lsc.getUser() != null){
                session = request.getSession(true);
                session.setMaxInactiveInterval(-1);
                session.setAttribute("CurrentUser", lsc.getUser());
                response.sendRedirect("main");   
            }
        }else{
            request.setAttribute("invalid_login", true);
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "prepare data for and handle request from indexPage";
    }

}
