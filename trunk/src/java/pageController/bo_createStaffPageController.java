/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pageController;

import beanController.DepartmentController;
import beanController.StaffController;
import beanController.UserRoleController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class bo_createStaffPageController extends pageController {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        try {
            bo_redirectWithAuth(request.getSession(false), response);
            request.setAttribute("userrole", new UserRoleController().getRoleList());
            request.setAttribute("departments", new DepartmentController().getDeptList());
            dispatcher = request.getRequestDispatcher("/WEB-INF/bo/bo_createstaff.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String[]> pMap = request.getParameterMap();
        StaffController sc = new StaffController();
        request.setAttribute("create_success", sc.createStaff(pMap)); 
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
