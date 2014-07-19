package pageController;

import bean.Comment;
import bean.Log;
import bean.Task;
import bean.LoginStaff;
import beanController.CommentController;
import beanController.LogController;
import beanController.StaffController;
import beanController.StatusController;
import beanController.TaskController;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joseph
 */
public class taskdetailPageController extends pageController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher;
        redirectWithAuth(request.getSession(false), response);
        try {
            int taskid = Integer.parseInt(request.getParameter("taskid"));

            TaskController taskcon = new TaskController();
            Task detail = taskcon.getTaskDetail(taskid);
            request.setAttribute("task", detail);

            LogController logCon = new LogController();
            Log lastestLog = logCon.getLastestLog(detail);
            request.setAttribute("LastLog", lastestLog);

            CommentController comcon = new CommentController();
            ArrayList<Comment> commentList = comcon.getComments(taskid);
            request.setAttribute("commentList", commentList);

            request.setAttribute("buttontype", displaybutton(detail));
            dispatcher = request.getRequestDispatcher("/WEB-INF/task-detail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        HttpSession session = request.getSession(false);
        if (action.equals("comment")) {
            String content = request.getParameter("com_content");
            CommentController comcon = new CommentController();
            if (!comcon.newComment(taskid, content, ((LoginStaff) session.getAttribute("CurrentUser")).getStaffID())) {

            }
        } else if (action.equals("change")) {
            String newstatus = request.getParameter("NewStatus");
            String reporter = request.getParameter("reportername");
            String assignee = request.getParameter("assigneename");
            TaskController taskCon = new TaskController();
            //LogController logCon= new LogController();
            StaffController staffCon = new StaffController();
            //Task task = taskCon.get(taskid);
            StatusController statusCon = new StatusController();
            request.setAttribute("assign_success", taskCon.updateStatus(taskid, statusCon.getStatus(newstatus), staffCon.getStaff(assignee), staffCon.getStaff(reporter)));
            //logCon.logTask(statusCon.getStatus(newstatus),task,((Staff)session.getAttribute("CurrentUser")),staffCon.getStaff(reporter),new Timestamp(System.currentTimeMillis()));
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String displaybutton(Task t) {
        String type;
        if (t.getStatus().getStatusID() == 2) { //Assigned
            type = "assigned";
        } else if (t.getStatus().getStatusID() == 3) {
            type = "started";
        } else if ((t.getStatus().getStatusID() == 4 || t.getStatus().getStatusID() == 8) && t.getAssignee().getUserName().equals(t.getReporter().getUserName())) {
            type = "completed";
        } else if (t.getStatus().getStatusID() == 4 || t.getStatus().getStatusID() == 8) {
            type = "reported";
        } else {
            type = null;
        }
        return type;
    }

}
