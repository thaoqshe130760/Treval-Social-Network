
package controller.auth;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author thaoq
 */
public class AuthenticationController extends HttpServlet {
    
        public int indexOf(String username, ArrayList<User> listUser) {
        if (listUser.size() == 0) {
            return -1;
        }
        for (int i = 0; i < listUser.size(); i++) {
            if (username.equals(listUser.get(i).getUsername())) {
                return i;
            }
        }
        return -1;
    }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        UserDAO userDB = new UserDAO();
        ArrayList<User> listUser = userDB.getUser();
        if (indexOf(username, listUser) != -1) {
            int index = indexOf(username, listUser);
            if (username.equals(listUser.get(index).getUsername()) && password.equals(listUser.get(index).getPassword())) {
                request.getSession().setAttribute("user", listUser.get(index));
                if (remember != null) {
                    Cookie cookyUser = new Cookie("username", username);
                    cookyUser.setMaxAge(24 * 3600);
                    Cookie cookyPass = new Cookie("password", password);
                    cookyPass.setMaxAge(24 * 3600);
                    response.addCookie(cookyUser);
                    response.addCookie(cookyPass);
                }
                response.sendRedirect("homepage");
//                request.getRequestDispatcher("homepage").forward(request, response);
            } else {
                response.getWriter().println("Login failed!");
            }

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
