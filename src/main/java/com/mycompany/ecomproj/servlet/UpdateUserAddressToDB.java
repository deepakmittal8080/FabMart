
package com.mycompany.ecomproj.servlet;

import com.mycompany.ecomproj.dao.UserAddressDAO;
import com.mycompany.ecomproj.impl.UserAddressDAOImpl;
import com.mycompany.ecomproj.model.UserAddress;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateUserAddressToDB extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int userid = Integer.parseInt(request.getParameter("userid"));
            String shipto = request.getParameter("shipto");
            String billto = request.getParameter("billto");
            
            UserAddress ua = new UserAddress();
            ua.setUserId(userid);
            ua.setShipTo(shipto);
            ua.setBillTo(billto);
            
            
            System.out.println(ua);
            
            UserAddressDAO uad = new UserAddressDAOImpl();
            uad.update(ua);
            
            response.sendRedirect("Cart/ViewShipandBill.jsp?userId="+userid);



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
