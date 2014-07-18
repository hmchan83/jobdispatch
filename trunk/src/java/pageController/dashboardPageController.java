/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pageController;

import bean.Dashboard;
import beanController.DashboardController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class dashboardPageController extends pageController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        redirectWithAuth(request.getSession(false), response);
        Dashboard d = new DashboardController().getDashboard();
        try {
            request.setAttribute("high_workload_ppl", d.getHigh_workload_ppl());
            request.setAttribute("low_workload_ppl", d.getLow_workload_ppl());
            request.setAttribute("urgent_tasks", d.getUrgent_tasks());
            request.setAttribute("resolved_priority", d.getResolved_priority());
            request.setAttribute("unresolved_priority", d.getUnresolved_priority());
            request.setAttribute("resolved_type", d.getResolved_type());
            request.setAttribute("unresolved_type", d.getUnresolved_type());
            request.setAttribute("productive_ppl", d.getProductive_ppl());
            request.setAttribute("non_productive_ppl", d.getNon_productive_ppl());
            request.setAttribute("total_resolved_tasks", d.getTotal_resolved_tasks());
            request.setAttribute("total_unresolved_tasks", d.getTotal_unresolved_tasks());
            dispatcher = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
