package pageController;

import bean.LoginStaff;
import bean.Task;
import beanController.TaskListController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class tasksPageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        HttpSession session = request.getSession(false);
        if (session.getAttribute("CurrentUser") == null) {
            response.sendRedirect("index");
        } else {
            try {
                TaskListController tlc = new TaskListController();
                LoginStaff s = (LoginStaff)session.getAttribute("CurrentUser");
                ArrayList<Task> tasks = tlc.getTasksByStaff(s.getStaffID());
                session.setAttribute("tasklist", tasks);
                dispatcher = request.getRequestDispatcher("/WEB-INF/tasks.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
