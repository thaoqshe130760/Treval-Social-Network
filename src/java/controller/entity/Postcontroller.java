package controller.entity;

import dal.CommentDAO;
import dal.LikeDao;
import dal.PostDAO;
import dal.Post_TopicDAO;
import dal.ToppicDAO;
import dal.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Comment;
import model.Like;
import model.Post;
import model.Toppic;
import model.User;

public class Postcontroller extends BaseRequiredAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User u = (User) req.getSession().getAttribute("user");
        String uid = u.getId();
        String img = req.getParameter("img");
        if (img.equals("")) {
            img = "wordpress.png";
        }
        String title = req.getParameter("title");
        String text = req.getParameter("content");
        String[] topic = req.getParameterValues("topic");

        if (!title.trim().equals("") && !text.trim().equals("")) {
            PostDAO pdb = new PostDAO();

            pdb.addPost(uid, img, text, title);
            String pid = pdb.getPidCurrent();
            if (topic != null) {
                for (String string : topic) {
                    Post_TopicDAO ptDB = new Post_TopicDAO();
                    ptDB.addPost_Topic(pid, string);
                }
            }

            resp.sendRedirect("homepage");

        } else {
            resp.sendRedirect("homepage");
        }

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");
        User u = (User) req.getSession().getAttribute("user");
        PostDAO pdb = new PostDAO();
        Post p = pdb.getPost(pid);
        LikeDao ldb = new LikeDao();
        boolean checkLike = ldb.checkLike(pid, u.getId());
        ArrayList<Like> listLike = ldb.getLikeOfPost(pid);
        CommentDAO cdb = new CommentDAO();
        ArrayList<Comment> listCmt = cdb.getCommentOfPost(pid);
        ToppicDAO tdb = new ToppicDAO();
        ArrayList<Toppic> listToppic = tdb.getToppicByPost(pid);
        String name = p.getUser().getDisplayName();
        System.out.println("toppic ---------------:" + listToppic.size());
        req.setAttribute("checkLike", checkLike);
        req.setAttribute("listPost", pdb.getPosts());
        req.setAttribute("listToppic", listToppic);
        req.setAttribute("listCmt", listCmt);
        req.setAttribute("listLike", listLike);
        req.setAttribute("post", p);
        req.setAttribute("username", name);
        req.getRequestDispatcher("post.jsp").forward(req, resp);
    }

}
