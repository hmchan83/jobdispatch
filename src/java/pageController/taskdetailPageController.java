package pageController;

import bean.Comment;
import bean.Task;
import bean.LoginStaff;
import beanController.CommentController;
import beanController.StaffController;
import beanController.TaskController;
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
public class taskdetailPageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        HttpSession session = request.getSession(false);
        if (session.getAttribute("CurrentUser") == null) {
            response.sendRedirect("index");
        } else {
            try {
                int taskid = Integer.parseInt(request.getParameter("taskid"));
                
                TaskController taskcon = new TaskController();
                Task detail = taskcon.getTaskDetail(taskid);
                request.setAttribute("task", detail);
                
                CommentController comcon = new CommentController();
                ArrayList<Comment> commentList = comcon.getComments(taskid);
                request.setAttribute("commentList", commentList);
                
                dispatcher = request.getRequestDispatcher("/WEB-INF/task-detail.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String content = request.getParameter("com_content");
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        HttpSession session = request.getSession(false);
        CommentController comcon = new CommentController();
        StaffController stacon = new StaffController();
        if(!comcon.newComment(taskid, content, ((LoginStaff)session.getAttribute("CurrentUser")).getStaffID())){
            
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
