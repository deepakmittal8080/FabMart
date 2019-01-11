package com.mycompany.ecomproj.impl;

import com.mycompany.ecomproj.dao.CategoryDAO;
import com.mycompany.ecomproj.dao.ProductDAO;
import com.mycompany.ecomproj.model.Category;
import com.mycompany.ecomproj.model.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public Map<String, List<Product>> getProductsByCategory() {
        Map<String, List<Product>> map = new HashMap<>();

        CategoryDAO cdao = new CategoryDAOImpl();

        for (Category c : cdao.getCategory()) {

            List<Product> productList = this.getProduct(c.getName());

            if (!productList.isEmpty()) {

                map.put(c.getName(), productList);

            }

        }

        System.out.println(map);

        return map;
    }

    @Override
    public Map<String, List<Product>> getProductsByCategory(String categoryName) {
        Map<String, List<Product>> map = new HashMap<>();

        CategoryDAO cdao = new CategoryDAOImpl();

        for (Category c : cdao.getCategory()) {

            if (c.getName().equals(categoryName)) {
                List<Product> productList = this.getProduct(c.getName());

                if (!productList.isEmpty()) {

                    map.put(c.getName(), productList);

                }
            }
        }

        System.out.println(map);

        return map;
    }

    @Override
    public void insert(Product p) {
        String query = "insert into products (name, description,price, imagePath, qty, category) values (?,?,?,?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getName());
            pstmt.setString(2, p.getDescription());
            pstmt.setDouble(3, p.getPrice());
            pstmt.setString(4, p.getImagePath());
            pstmt.setInt(5, p.getQty());
            pstmt.setString(6, p.getCategory());
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getProduct(String category) {
        List<Product> list = new ArrayList<>();

        String query = "select * from products where category=?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, category);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagePath"));
                p.setQty(rs.getInt("qty"));
                p.setCategory(rs.getString("category"));

                list.add(0, p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();

        String query = "select * from products";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagePath"));
                p.setQty(rs.getInt("qty"));
                p.setCategory(rs.getString("category"));

                list.add(0, p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Product getProduct(int pid) {
        String query = "select * from products where id=?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("imagePath"));
                p.setQty(rs.getInt("qty"));
                p.setCategory(rs.getString("category"));

                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void delete(int pid) {
        String query = "delete from products where id =?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Product p) {
        String query = "update products set name=?, description=?,price =?,imagePath =?, qty =?,category = ? where id=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getName());
            pstmt.setString(2, p.getDescription());
            pstmt.setDouble(3, p.getPrice());
            pstmt.setString(4, p.getImagePath());
            pstmt.setInt(5, p.getQty());
            pstmt.setString(6, p.getCategory());
            pstmt.setInt(7, p.getId());

            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
