package pageController;

import bean.LoginStaff;
import bean.Staff;
import bean.Task;
import beanController.StaffController;
import beanController.TaskController;
import beanController.TaskListController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class tasksPageController extends HttpServlet {

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
                session.setAttribute("tasklist", tlc.getTasksByStaff(s.getStaffID()));
                dispatcher = request.getRequestDispatcher("/WEB-INF/tasks.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Enumeration pNames = request.getParameterNames();
        ParameterMap pMap = new ParameterMap();
        HttpSession session = request.getSession(false);
        while (pNames.hasMoreElements()){
            String pName = (String)pNames.nextElement();
            if(pName.equals("assignee")){
                //find the name of the assignee
                StaffController sc = new StaffController();
                Staff a = sc.getStaff(request.getParameter(pName));
                pMap.put("assigneeid", a.getStaffID());
            }else
                pMap.put(pName, request.getParameter(pName));
        }
        LoginStaff s = (LoginStaff)session.getAttribute("CurrentUser");
        pMap.put("reporterid", s.getStaffID());
        TaskController tc = new TaskController();
        if(tc.createTask(pMap)){
            response.sendRedirect("tasks");
        }else{
            request.setAttribute("invalid_add_task", true);
            request.getRequestDispatcher("/WEB-INF/tasks.jsp").forward(request, response);
        }
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
