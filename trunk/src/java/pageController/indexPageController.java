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

public class indexPageController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession(false) != null)
            response.sendRedirect("main");
        else
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //do authentication first
        String username = request.getParameter("username");
        byte[] password = request.getParameter("password").getBytes(Charset.forName("UTF-8"));
        String digested_password = new String(password, "UTF-8");
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            digested_password = new String(md5.digest(password), "UTF-8");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(indexPageController.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = null;
        LoginStaffController lsc = new LoginStaffController();
        if(lsc.Verify(username, digested_password)){
            if(lsc.getUser() != null){
                session = request.getSession(true);
                session.setAttribute("CurrentUser", lsc.getUser());
            }
        }else{
            request.setAttribute("invalid_login", true);
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        }
        response.sendRedirect("main");   
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
