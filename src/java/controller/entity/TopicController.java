
package controller.entity;

import dal.PostDAO;
import dal.ToppicDAO;
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
public class TopicController extends BaseRequiredAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDAO pDB = new PostDAO();
        ToppicDAO tDB = new ToppicDAO();
        String tip = req.getParameter("tid");
        
        req.setAttribute("listTopic", tDB.getToppic());
        req.setAttribute("listPostByTopic", pDB.getPostsByTopic(tip));
        
        req.getRequestDispatcher("topic.jsp").forward(req, resp);
        
    }

    

}
