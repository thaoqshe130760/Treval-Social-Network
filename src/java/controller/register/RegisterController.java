
package controller.register;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author thaoq
 */
public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        
        System.out.println("name:" + name);
        System.out.println("username:" + username);
        System.out.println("password:" + password);
        System.out.println("re_pass:" + re_password);
        System.out.println(checkPassword(password, re_password));
        System.out.println(!name.trim().equals("")+"" + !username.trim().equals(""));
        UserDAO userDB = new UserDAO();
        ArrayList<User> listUser = userDB.getUser();
        
        if (checkPassword(password, re_password) && !name.trim().equals("") && !username.trim().equals("")) {
            if (indexOf(username, listUser) == -1) {
                userDB.addUser(name, username, password);
                response.sendRedirect("login");
            } else {
                request.setAttribute("notify", "User name already exist");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("notify", "Password and Re-password are not the same");
                request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        
    }
    
    static boolean checkPassword(String password, String re_password) {
        if (!password.equals(re_password)) {
            return false;
        } else {
            if (password.trim().equals("")) {
                return false;
            }
        }
        
        return true;
    }

    static int indexOf(String username, ArrayList<User> listUser) {
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
