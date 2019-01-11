
package com.mycompany.ecomproj.servlet;

import com.mycompany.ecomproj.dao.CategoryDAO;
import com.mycompany.ecomproj.impl.CategoryDAOImpl;
import com.mycompany.ecomproj.model.Category;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateCategoryToDB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      int id = Integer.parseInt(request.getParameter("id"));
      String name = request.getParameter("name");
      String description = request.getParameter("description");
      
    
       Category c = new Category();
       c.setId(id);
       c.setName(name);
       c.setDescription(description);
      
       CategoryDAO cdao = new CategoryDAOImpl();
       cdao.update(c);
       response.sendRedirect("Category/ViewCategory.jsp");


    }

}
