/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ecomproj.impl;

import com.mycompany.ecomproj.dao.CategoryDAO;
import com.mycompany.ecomproj.model.Category;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDAOImpl implements CategoryDAO{

    @Override
    public void insert(Category c) {
        String query = "insert into categories (name, description) values (?,?)";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getDescription());
            pstmt.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("");
        }   
    }

    @Override
    public List<Category> getCategory() {
      List<Category> list = new ArrayList<>();
      
      String query="select * from categories";
      
      try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                
                list.add(0,c);
            }
           }
      catch(Exception e){
      e.printStackTrace();}
      return list;
    }

    @Override
    public Category getCategory(int cid) {
       String query= "select * from categories where id=?";
       
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, cid);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
            Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
          
                return c;
            }
             
       }
      catch(Exception e){
      e.printStackTrace();}
            return null;
           }

    @Override
    public void delete(int cid) {
       String query= "delete from categories where id =?";
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
    public void update(Category c) {
        String query = "update categories set name=?, description=? where id=?";
        try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,c.getName());
            pstmt.setString(2, c.getDescription());
            pstmt.setInt(3, c.getId());
            pstmt.executeUpdate();
           con.close();
       }
       catch(Exception e){
           e.printStackTrace();
       }
    
    
    }
       
    }

   

