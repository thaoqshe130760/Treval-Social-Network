/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.entity;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author thaoq
 */
public class UpdateInforController extends BaseRequiredAuthenticationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        String name = req.getParameter("name");
        String dob = req.getParameter("dob");
        String hobbies = req.getParameter("hobbies");
        UserDAO uDB = new UserDAO();
        if (req.getParameter("submit") != null) {
            uDB.updateUser(u.getId(), name, dob, hobbies);

        }
        req.setAttribute("uid", u.getId());
        req.getRequestDispatcher("info").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("update.jsp");
    }

}
