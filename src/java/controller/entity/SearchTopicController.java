
package controller.entity;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SearchTopicController extends BaseRequiredAuthenticationController {

      @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        PostDAO postDB = new PostDAO();
//        ArrayList<Post> listPost = postDB.getPosts();
//        ToppicDAO tdb = new ToppicDAO();
//        ArrayList<Toppic> listToppic = tdb.getToppic();
//        System.out.println("toppic ---------------:" + listToppic.size());
        
//        req.setAttribute("listToppic", listToppic);
//        req.setAttribute("listPost", listPost);
resp.getWriter().println("Hihi");
        
        //req.getRequestDispatcher("homepage.jsp").forward(req, resp);
    }
}
