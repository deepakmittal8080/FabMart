
package com.mycompany.ecomproj.servlet;

import com.mycompany.ecomproj.dao.CategoryDAO;
import com.mycompany.ecomproj.impl.CategoryDAOImpl;
import com.mycompany.ecomproj.model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddCategoryToDB extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        Category c = new Category();
        c.setName(name);
        c.setDescription(description);
        
              System.out.println(name + "," + description);
            System.out.println( c );
        
        CategoryDAO obj = new CategoryDAOImpl();
        obj.insert(c);
        
        response.sendRedirect("Category/ViewCategory.jsp");
        
        
    }

    
}
