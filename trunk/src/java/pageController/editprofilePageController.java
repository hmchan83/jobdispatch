package pageController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joseph
 */
public class editprofilePageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        HttpSession session = request.getSession(false);
        if (session.getAttribute("CurrentUser") == null) {
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
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int tel = Integer.parseInt(request.getParameter("tel"));
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
