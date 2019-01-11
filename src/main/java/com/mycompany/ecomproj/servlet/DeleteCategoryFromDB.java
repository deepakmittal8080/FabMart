
package com.mycompany.ecomproj.servlet;

import com.mycompany.ecomproj.dao.CategoryDAO;
import com.mycompany.ecomproj.impl.CategoryDAOImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCategoryFromDB extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
          int id = Integer.parseInt(request.getParameter("id"));
        CategoryDAO cdao = new CategoryDAOImpl();
        cdao.delete(id);
        response.sendRedirect("Category/ViewCategory.jsp");
        
        
    }
}
