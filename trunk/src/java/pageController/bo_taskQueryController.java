/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pageController;

import bean.Priority;
import bean.Status;
import bean.Task;
import bean.TaskType;
import beanController.PriorityController;
import beanController.StatusController;
import beanController.TaskListController;
import beanController.TaskTypeController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Joseph
 */
public class bo_taskQueryController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        ArrayList<TaskType> types = new TaskTypeController().getTypeList();
        ArrayList<Priority> priority = new PriorityController().getPriorityList();
        ArrayList<Status> status = new StatusController().getStatusList();
        try {
            request.setAttribute("tasktype", types);
            request.setAttribute("taskpriority", priority);
            request.setAttribute("taskstatus", status);
            bo_redirectWithAuth(request.getSession(false), response);
            dispatcher = request.getRequestDispatcher("/WEB-INF/bo/bo_taskquery.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> pMap = request.getParameterMap();
        TaskListController tlc = new TaskListController();
        ArrayList<Task> tasks = tlc.getTasksByMap(pMap);
        doGet(request, response);
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
