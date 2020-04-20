
package controller.entity;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author thaoq
 */

public abstract class BaseRequiredAuthenticationController extends HttpServlet {


    private boolean isAuthenticated(HttpServletRequest request) {
        User account = (User) request.getSession().getAttribute("user");
        
        if (account != null) {
            return true;
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies == null) {
                return false;
            } else {
                String username = null;
                String password = null;
                for (Cookie cooky : cookies) {
                    if (cooky.getName().equals("username")) {
                        username = cooky.getValue();
                    }
                    if (cooky.getName().equals("password")) {
                        password = cooky.getValue();
                    }
                    if (username != null && password != null) {
                        break;
                    }
                }
                if (username != null && password != null) {
                    UserDAO userDB = new UserDAO();
                    ArrayList<User> listUser = userDB.getUser();
                    int index = indexOf(username, listUser);
                    if (index == -1) {
                        return false;
                    }
                    
                    if (username.equals(listUser.get(index).getUsername()) && password.equals(listUser.get(index).getPassword())) {
                        account = new User();
                        account.setId(listUser.get(index).getId());
                        account.setAccountType(listUser.get(index).isAccountType());
                        account.setUsername(username);
                        account.setPassword(password);
                        account.setDob(listUser.get(index).getDob());
                        account.setDisplayName(listUser.get(index).getDisplayName());
                        account.setHobbies(listUser.get(index).getHobbies());
                        request.getSession().setAttribute("user", account);
                        return true;
                    }
                }
                return false;
            }
        }
    }

    protected abstract void processPost(HttpServletRequest req,
            HttpServletResponse resp) throws ServletException, IOException;

    protected abstract void processGet(HttpServletRequest req,
            HttpServletResponse resp) throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(isAuthenticated(req));
        if (isAuthenticated(req)) {
            processPost(req, resp);
        } else {
            resp.sendRedirect("login");
//            req.getRequestDispatcher("homepage.jsp").forward(req, resp);
//            resp.getWriter().println("access denied!");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(isAuthenticated(req));
        if (isAuthenticated(req)) {
            processGet(req, resp);
        } else {
            resp.sendRedirect("login");
//            req.getRequestDispatcher("homepage.jsp").forward(req, resp);
//            resp.getWriter().println("access denied!");
        }
    }
    
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

}
