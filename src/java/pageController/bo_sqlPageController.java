package pageController;

import beanController.BeanController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joseph
 */
public class bo_sqlPageController extends pageController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        try {
            bo_redirectWithAuth(request.getSession(false), response);
            dispatcher = request.getRequestDispatcher("/WEB-INF/bo/bo_sql.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = request.getParameter("sql");
        String mode = request.getParameter("mode");
        if(mode.toLowerCase().equals("query"))
            request.setAttribute("result", new BeanController().executeStmt(sql));
        else if(mode.toLowerCase().equals("update"))
            request.setAttribute("update_result", new BeanController().executeStmtUpdate(sql));
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
