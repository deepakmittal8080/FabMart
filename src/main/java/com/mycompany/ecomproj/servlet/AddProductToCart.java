package com.mycompany.ecomproj.servlet;

import com.mycompany.ecomproj.dao.CartDAO;
import com.mycompany.ecomproj.impl.CartDAOImpl;
import com.mycompany.ecomproj.model.Cart;
import com.mycompany.ecomproj.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddProductToCart", urlPatterns = {"/AddProductToCart"})
public class AddProductToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           User u = (User)request.getSession().getAttribute("userObject");
           
           if(u == null){
               response.sendRedirect("User/Login.jsp");
           }
           
           else{
   
            int prodId = Integer.parseInt(request.getParameter("prodId"));          
            int userId = u.getId();
            
               System.out.println("UserId: " + userId);
            
            int qty = 1;
       
            
            CartDAO cdao = new CartDAOImpl();
            boolean status = cdao.checkProductInCart(prodId,userId);
            if(status){
              response.sendRedirect("Cart/ViewCart.jsp");
            }
            else{
            Cart c = new Cart();
            c.setProductId(prodId);
            c.setUserId(userId);
            c.setQty(qty);
            
            
            cdao.insert(c);
            
            response.sendRedirect("Cart/ViewCart.jsp");
            }
            }
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
