
package com.mycompany.ecomproj.impl;

import com.mycompany.ecomproj.dao.UserAddressDAO;
import com.mycompany.ecomproj.model.UserAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserAddressDAOImpl implements UserAddressDAO{

    @Override
    public void insert(UserAddress ua) {
    
        String query = "insert into useraddress (userid, shipto, billto) values (?,?,?)";
      
      try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, ua.getUserId());
            pstmt.setString(2, ua.getShipTo());
            pstmt.setString(3, ua.getBillTo());
            pstmt.executeUpdate();
            con.close();   
      }
      catch(Exception e){
          e.printStackTrace();
      }
        
    }

    @Override
    public void delete(int id) {
        
        String query= "delete from useraddress where userid =?";
       try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
           con.close();
       }
       catch(Exception e){
           e.printStackTrace();
       }
        
    }

    @Override
    public void update(UserAddress ua) {
                    String query = "update useraddress set userid=?, shipto=?,billto =? where userid=?";
        try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,ua.getUserId());
            pstmt.setString(2, ua.getShipTo());
            pstmt.setString(3, ua.getBillTo());            
            pstmt.setInt(4,ua.getUserId());
            pstmt.executeUpdate();
           con.close();
       }
       catch(Exception e){
           e.printStackTrace();
       }

    }

    @Override
    public UserAddress getUserAddressById(int id) {
        String query = "select * from useraddress where id=?";
        
         try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                UserAddress ua = new UserAddress();
                ua.setId(rs.getInt("id"));
                ua.setUserId(rs.getInt("userId"));
                ua.setBillTo(rs.getString("billTo"));
                ua.setShipTo(rs.getString("shipTo"));
                 
                return ua;
            }
           
      }
      catch(Exception e){
          e.printStackTrace();
      }
       return null;
    }

    @Override
    public UserAddress getUserAddressByUserId(int uid) {
        String query = "select * from useraddress where userid=?";
        
         try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, uid);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                UserAddress ua = new UserAddress();
                ua.setId(rs.getInt("id"));
                ua.setUserId(rs.getInt("userId"));
                ua.setBillTo(rs.getString("billTo"));
                ua.setShipTo(rs.getString("shipTo"));
                 
                return ua;
            }
           
      }
      catch(Exception e){
          e.printStackTrace();
      }
       return null;
    }
    
    
    
}
