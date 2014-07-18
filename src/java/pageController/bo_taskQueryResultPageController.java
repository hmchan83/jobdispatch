package pageController;

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

/**
 *
 * @author Joseph
 */
public class bo_taskQueryResultPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        bo_redirectWithAuth(request.getSession(false), response);
        ArrayList<Task> tasks = new TaskListController().getTasksByMap(request.getParameterMap());
        if (request.getAttribute("result") == null) {
            request.setAttribute("result", tasks);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/bo/bo_taskquery_result.jsp");
        try{
            rd.forward(request, response);
        }catch(Exception e){}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("bo_staffQueryResult");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
