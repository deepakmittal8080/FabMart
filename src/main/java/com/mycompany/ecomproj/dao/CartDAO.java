
package com.mycompany.ecomproj.dao;

import com.mycompany.ecomproj.model.Cart;
import java.util.List;

public interface CartDAO {

    void insert(Cart c);
    void delete(int cid);
    void deleteCartItemForUser(int uid);
    List<Cart> getCartItemsForUser(int userId);
    boolean checkProductInCart(int pid,int uid);
    void updateCartQty(int productid, int qty);
}
