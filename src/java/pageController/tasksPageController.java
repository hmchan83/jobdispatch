package pageController;

import bean.LoginStaff;
import bean.Staff;
import bean.Task;
import beanController.PriorityController;
import beanController.StaffController;
import beanController.TaskController;
import beanController.TaskListController;
import beanController.TaskTypeController;
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
public class tasksPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        HttpSession session = request.getSession(false);
        redirectWithAuth(session, response);
        try {
            TaskListController tlc = new TaskListController();
            LoginStaff s = (LoginStaff)session.getAttribute("CurrentUser");
            session.setAttribute("tasklist", tlc.getTasksByStaff(s.getStaffID()));
            request.setAttribute("tasktypelist", new TaskTypeController().getTypeList());
            request.setAttribute("taskprioritylist", new PriorityController().getPriorityList());
            dispatcher = request.getRequestDispatcher("/WEB-INF/tasks.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration pNames = request.getParameterNames();
        ParameterMap pMap = new ParameterMap();
        HttpSession session = request.getSession(false);
        boolean invalid_assignee = false;
        boolean valid_add_task = false;
        while (pNames.hasMoreElements()){
            String pName = (String)pNames.nextElement();
            if(pName.equals("assignee")){
                //find the assignee according to the name
                Staff a = new StaffController().getStaff(request.getParameter(pName));
                if(a!=null)
                    pMap.put("assigneeid", a.getStaffID());
                else
                    invalid_assignee = true;
            }else
                pMap.put(pName, request.getParameter(pName));
        }
        LoginStaff s = (LoginStaff)session.getAttribute("CurrentUser");
        pMap.put("reporterid", s.getStaffID());
        TaskController tc = new TaskController();
        if(!invalid_assignee && tc.createTask(pMap)){
            valid_add_task = true;
        }
        request.setAttribute("invalid_assignee", invalid_assignee);
        request.setAttribute("valid_add_task", valid_add_task);
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Prepare data for and process data from the task page";
    }

}
