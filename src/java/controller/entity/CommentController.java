
package controller.entity;

import dal.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

public class CommentController extends BaseRequiredAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String pid = req.getParameter("pid");
        User u = (User) req.getSession().getAttribute("user");
        String text = req.getParameter("comment");
        CommentDAO cdb = new CommentDAO();
        if (req.getParameter("submit") != null) {
            cdb.addComment(u.getId(), pid, text);
            resp.sendRedirect("post?pid=" + pid);
        }
    }


}
