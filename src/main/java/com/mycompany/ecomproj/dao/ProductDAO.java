
package com.mycompany.ecomproj.dao;

import com.mycompany.ecomproj.model.Product;
import java.util.List;
import java.util.Map;

public interface ProductDAO {

    void delete(int pid);
    void insert(Product p);
    void update(Product p);
    List<Product> getProduct();
    List<Product> getProduct(String category);
    
    Product getProduct(int pid);
    
    Map<String, List<Product>> getProductsByCategory();
    Map<String, List<Product>> getProductsByCategory( String categoryName );
    
}
