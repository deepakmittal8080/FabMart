package com.mycompany.ecomproj.impl;
import com.mycompany.ecomproj.dao.CartDAO;
import com.mycompany.ecomproj.dao.ProductDAO;
import com.mycompany.ecomproj.model.Cart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO{

    @Override
    public void insert(Cart c) {
        String query = "insert into cart (userid, productid,qty) values (?,?,?)";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,c.getUserId() );
            pstmt.setInt(2, c.getProductId());
            pstmt.setInt(3, c.getQty());
            pstmt.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("");
        }   
    }

    @Override
    public List<Cart> getCartItemsForUser(int userId) {
       List<Cart> list = new ArrayList<>();
      
      String query="select * from cart where userid = ?";
      
      try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            ProductDAO pdao = new ProductDAOImpl();
            
            while(rs.next()){
                Cart c = new Cart();
                c.setId(rs.getInt("id"));
                c.setUserId(rs.getInt("userid"));
                c.setProductId(rs.getInt("productid"));
                c.setQty(rs.getInt("qty"));
                
                c.setProduct( pdao.getProduct( rs.getInt("productid") ) );
                
                System.out.println(c);
                list.add(0,c);
            }
           }
      catch(Exception e){
      e.printStackTrace();}
      return list;
    }

    @Override
    public void delete(int cid) {
        String query= "delete from cart where id =?";
       try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, cid);
            pstmt.executeUpdate();
           con.close();
       }
       catch(Exception e){
           e.printStackTrace();
       }

    }

    @Override
    public void deleteCartItemForUser(int uid) {
     
        String query= "delete from cart where userid =?";
       try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, uid);
            pstmt.executeUpdate();
           con.close();
           System.out.println("Deleted");
       }
       catch(Exception e){
           e.printStackTrace();
       }

    }

    @Override
    public boolean checkProductInCart(int pid, int uid) {
            String query = "select * from cart where productid=? and userid=?";
            String query2 = "update cart set qty=? where productid=?";
            try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Cart c = new Cart();
                c.setId(rs.getInt("id"));
                c.setUserId(rs.getInt("userid"));
                c.setProductId(rs.getInt("productid"));
                c.setQty(rs.getInt("qty"));
                
                if(c.equals(null)){
                    return false;
                }
                else{
                    PreparedStatement pstmt2 = con.prepareStatement(query2);
                    pstmt2.setInt(1, c.getQty()+1);
                    pstmt2.setInt(2, pid);
                    pstmt2.executeUpdate();
                       return true;
                }
            }
           con.close();
           System.out.println("Deleted");
       }
       catch(Exception e){
           e.printStackTrace();
       }
                return false;
    }

    @Override
    public void updateCartQty(int productid, int qty) {
                 String query = "update cart set qty=? where productid=?";
        try{
            
            System.out.println("updated"+productid+qty);
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,qty);
            pstmt.setInt(2, productid);
            pstmt.executeUpdate();
           con.close();
           System.out.println("updated"+productid+qty);
       }
       catch(Exception e){
           e.printStackTrace();
       }
    
    
   
    
    }

    
}
