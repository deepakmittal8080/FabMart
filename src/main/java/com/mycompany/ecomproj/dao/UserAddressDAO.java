
package com.mycompany.ecomproj.dao;

import com.mycompany.ecomproj.model.UserAddress;

public interface UserAddressDAO {
    
    void insert(UserAddress ua);
    void delete(int id);
    void update(UserAddress ua);
    UserAddress getUserAddressById(int id);
    UserAddress getUserAddressByUserId(int uid);
}
