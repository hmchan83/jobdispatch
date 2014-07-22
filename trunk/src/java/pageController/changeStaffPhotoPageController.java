package pageController;

import bean.LoginStaff;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class changeStaffPhotoPageController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //process only if its multipart content
        String absolutePath = getServletContext().getRealPath("/img/staffphoto");
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = ((LoginStaff) request.getSession(false).getAttribute("CurrentUser")).getStaffID() + "";
                        item.write(new File(absolutePath + File.separator + name + ".jpg"));
                    }
                }
            } catch (Exception ex) {
                response.sendRedirect("editprofile");
            }
            response.sendRedirect("editprofile");
        } else {
            response.sendRedirect("editprofile");
        }

    }

}
