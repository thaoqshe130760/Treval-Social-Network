
package controller.entity;

import dal.PostDAO;
import dal.ToppicDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Post;
import model.Toppic;

/**
 *
 * @author thaoq
 */
public class HomepageController extends HttpServlet {
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
        PostDAO postDB = new PostDAO();
        ArrayList<Post> listPost = postDB.getPosts();
        ToppicDAO tdb = new ToppicDAO();
        ArrayList<Toppic> listToppic = tdb.getToppic();
        System.out.println("toppic ---------------:" + listToppic.size());
        
        request.setAttribute("listToppic", listToppic);
        request.setAttribute("listPost", listPost);
        
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    



}
