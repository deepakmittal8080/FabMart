
package com.mycompany.ecomproj.dao;

import com.mycompany.ecomproj.model.User;
import java.util.List;

public interface UserDAO {
    
    void insert(User u);
    void update(User u);
    void update(String email, String pass);
    void delete(int id);
    User getUserById(int uid);
    List<User> getUsers();
    User getUser(String username, String password);
}
