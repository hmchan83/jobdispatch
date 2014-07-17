/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pageController;

import bean.Department;
import bean.UserRole;
import beanController.DepartmentController;
import beanController.UserRoleController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class bo_structControlPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        bo_redirectWithAuth(request.getSession(false), response);
        request.setAttribute("rolemap", new UserRoleController().getRoleMap());
        request.setAttribute("deptmap", new DepartmentController().getDeptMap());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/bo/bo_structcontrol.jsp");
        try{
            rd.forward(request, response);
        }catch(Exception e){}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("create_role")!=null && request.getParameter("create_role").equals("1")){
            UserRole ur = new UserRole();
            ur.setRoleID(Integer.parseInt(request.getParameter("roleid")));
            ur.setRoleName(request.getParameter("rolename"));
            new UserRoleController().addRole(ur);
        }
        if(request.getParameter("del_role")!=null && request.getParameter("del_role").equals("1")){
            new UserRoleController().delRole(Integer.parseInt(request.getParameter("roleid")));
        }
        if(request.getParameter("del_dept")!=null && request.getParameter("del_dept").equals("1")){
            new DepartmentController().delDept(Integer.parseInt(request.getParameter("deptid")));
        }
        if(request.getParameter("create_dept")!=null && request.getParameter("create_dept").equals("1")){
            Department d = new Department();
            d.setDeptID(Integer.parseInt(request.getParameter("deptid")));
            d.setDeptName(request.getParameter("deptname"));
            new DepartmentController().addDept(d);
        }
        response.sendRedirect("bo_structControl");
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
