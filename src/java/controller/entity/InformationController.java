/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.entity;

import dal.PhotoDao;
import dal.UserDAO;
import dal.User_PhotoDAO;
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
public class InformationController extends BaseRequiredAuthenticationController {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String uid = request.getParameter("uid");
        if (uid == null) {
            uid = (String) request.getAttribute("uid");
        }
        User us = (User) request.getSession().getAttribute("user");
        boolean canEdit = false;
        if (uid.equals(us.getId())) {
            canEdit = true;
        }
        User_PhotoDAO upDB = new User_PhotoDAO();
        UserDAO userDB = new UserDAO();
        PhotoDao photoDB = new PhotoDao();
        User u = userDB.getUserByID(uid);
        request.setAttribute("canEdit", canEdit);
        request.setAttribute("user_photo", upDB.getUser_PhotoByUid(uid));
        request.getRequestDispatcher("infor.jsp").forward(request, response);
        
    }
    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
