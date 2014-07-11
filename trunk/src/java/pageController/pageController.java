package pageController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joseph
 */
@WebServlet(name = "pageController", urlPatterns = {"/pageController"})
public abstract class pageController extends HttpServlet {

    @Override
    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    @Override
    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    protected boolean authentication(HttpSession session){
        return session != null && session.getAttribute("CurrentUser") != null;
    }
    protected void redirectWithAuth(HttpSession session, HttpServletResponse response) throws ServletException, IOException{
        if(!authentication(session))
            response.sendRedirect("index");
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
