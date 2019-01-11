package com.mycompany.ecomproj.impl;

import com.mycompany.ecomproj.dao.UserDAO;
import com.mycompany.ecomproj.model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {
    
    @Override
    public void insert(User u) {
        String query = "insert into user (username, email, phoneno, password, role) values (?,?,?,?,'ROLE-USER')";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getEmail());
            pstmt.setString(3, u.getPhoneno());
            pstmt.setString(4, u.getPassword());
            pstmt.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("");
        }        
    }
    
    @Override
    public void update(User u) {
        String query = "update user set username=?, password=?, email=?, phoneno=? where id=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getPassword());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getPhoneno());
            pstmt.setInt(5, u.getId());
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    @Override
    public void delete(int id) {
        String query = "delete from user where id =?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public User getUserById(int uid) {
        String query = "select * from user where id=?";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, uid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhoneno(rs.getString("phoneno"));
                user.setPassword(rs.getString("password"));
                user.setRol(User.rol);
                
                return user;
            }
            con.close();
            
        } catch (Exception ex) {
            System.out.println("");
        }        
        return null;
    }
    
    @Override
    public List<User> getUsers() {
        List<User> list = new ArrayList<>();
        
        String query = "select * from user";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setPhoneno(rs.getString("phoneno"));
                u.setRol(User.rol);
                
                list.add(0, u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    
    @Override
    public User getUser(String username, String password) {
        
        String query = "select * from user where username=? and password=?";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhoneno(rs.getString("phoneno"));
                user.setPassword(rs.getString("password"));
                user.setRol(rs.getString("role"));
    
                System.out.println("getUser");
                System.out.println( user );
                
                return user;
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }    
    
    @Override
    public void update(String email, String pass) {
        String query = "update user set password=? where email=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, pass);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
