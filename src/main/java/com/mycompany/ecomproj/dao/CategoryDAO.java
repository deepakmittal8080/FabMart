
package com.mycompany.ecomproj.dao;

import com.mycompany.ecomproj.model.Category;
import java.util.List;

public interface CategoryDAO {

void insert(Category c);      
void update(Category c);
void delete(int cid);
List<Category> getCategory();
Category getCategory(int cid);
}
