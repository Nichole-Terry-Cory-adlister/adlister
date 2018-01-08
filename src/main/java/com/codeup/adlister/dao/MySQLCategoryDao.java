package com.codeup.adlister.dao;

import com.codeup.adlister.models.Catergory;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MySQLCategoryDao implements Categories {
    private Connection connection = null;

    public MySQLCategoryDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Catergory> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Catergory catergory) {
        try {
            String insertQuery = "INSERT INTO categories(id, name) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, catergory.getId());
            stmt.setString(2, catergory.getName());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    //Searches for ads with a given category
    public List<Catergory> search(String cat_id){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id IN " +
                    "(SELECT ad_id FROM ad_cat WHERE cat_id IS ?)");
            stmt.setString(1, cat_id);
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving requested ads.", e);
        }

    }

    //Gets all the categories
    public List<Catergory> getCategories(){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving requested ads.", e);
        }

    }


    private Catergory extractCategory(ResultSet rs) throws SQLException {
        return new Catergory(
                rs.getInt("id"),
                rs.getString("name")
        );
    }

    private List<Catergory> createCategoriesFromResults(ResultSet rs) throws SQLException {
        List<Catergory> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(extractCategory(rs));
        }
        return categories;
    }
}

