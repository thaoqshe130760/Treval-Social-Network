
package controller.entity;

import dal.PhotoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thaoq
 */
public class UploadImageController extends BaseRequiredAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PhotoDao photoDB = new PhotoDao();
        
        String pid = (String) req.getSession().getAttribute("pid");
        String uid = (String) req.getSession().getAttribute("uid");
        String photoName = req.getParameter("img");
        if (photoName.equals("")) {
            photoName = "user_avatar.png";
        }
        String title = req.getParameter("title");
        System.out.println(uid + "  -  " + pid + "  -  " + photoName);
        
        photoDB.updatePhoto(pid, photoName, title);
        
 
        
        req.setAttribute("uid", uid);
        req.getRequestDispatcher("info").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String pid = req.getParameter("pid");
        String uid = req.getParameter("uid");
        req.getSession().setAttribute("uid", uid);
        req.getSession().setAttribute("pid", pid);
        req.getRequestDispatcher("uploadImg.jsp").forward(req, resp);
    }

   

}
