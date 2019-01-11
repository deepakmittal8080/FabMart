
package com.mycompany.ecomproj.servlet;

import com.mycompany.ecomproj.dao.ProductDAO;
import com.mycompany.ecomproj.impl.ProductDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProductFromDB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ProductDAO pdao = new ProductDAOImpl();
        pdao.delete(id);
        response.sendRedirect("Product/ViewProduct.jsp");
        
        
    }
}
