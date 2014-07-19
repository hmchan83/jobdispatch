/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pageController;

import bean.TaskType;
import beanController.TaskTypeController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class bo_taskDetailPageController extends pageController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        try {
            bo_redirectWithAuth(request.getSession(false), response);
            TaskTypeController tasktypeCon = new TaskTypeController();
            HashMap<TaskType, Boolean> tasktype= tasktypeCon.getTaskTypeMap();
            request.setAttribute("typemap", tasktype);
            dispatcher = request.getRequestDispatcher("/WEB-INF/bo/bo_taskdetail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("create_type")!=null && request.getParameter("create_type").equals("1")){
           //TaskType tt = new TaskType();
            //tt.setTypeID(Integer.parseInt(request.getParameter("tasktypeid")));
            String tt=request.getParameter("typename");
            new TaskTypeController().addTaskType(tt);
        }if(request.getParameter("del_type")!=null && request.getParameter("del_type").equals("1")){
            new TaskTypeController().dropTaskType(Integer.parseInt(request.getParameter("typeid")));
        }
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
