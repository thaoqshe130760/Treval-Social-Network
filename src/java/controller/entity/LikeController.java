/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.entity;

import dal.LikeDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author thaoq
 */
public class LikeController extends BaseRequiredAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");
        User u = (User) req.getSession().getAttribute("user");
        LikeDao cdb = new LikeDao();
        if (req.getParameter("submit") != null) {
            cdb.deleteLike(u.getId(),pid);
            resp.sendRedirect("post?pid=" + pid);
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String pid = req.getParameter("pid");
        User u = (User) req.getSession().getAttribute("user");
        LikeDao cdb = new LikeDao();
        if (req.getParameter("submit") != null) {
            cdb.addLike(u.getId(), pid);
            resp.sendRedirect("post?pid=" + pid);
        }
    }

}
