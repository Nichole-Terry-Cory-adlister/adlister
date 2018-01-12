package com.codeup.adlister.dao;

import com.codeup.adlister.models.Image;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLImagesDao implements Images {
    private Connection connection = null;

    public MySQLImagesDao(Config config) {
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

    public Image getImage(int id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM images WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            return new Image(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getString(4)
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    public Image searchByUserId(Long userId){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM images WHERE user_id = ?  LIMIT 1");
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            Image img = new Image(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getString(4)
            );
            return img;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving requested image.", e);
        }
    }

    public List<Image> searchByAdId(Long adId){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM images WHERE ad_id = ?");
            stmt.setLong(1, adId);
            ResultSet rs = stmt.executeQuery();
            return createImagesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving requested images.", e);
        }
    }

    public Long insert(Image image) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, ad_id, url) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, image.getUserId());
            stmt.setLong(2, image.getAdId());
            stmt.setString(3, image.getUrl());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new image.", e);
        }
    }

    public void updateUserImage(Image image) {
        String query = "UPDATE images SET url = ? WHERE user_id = ?";
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, image.getUrl());
            stmt.setInt(2, image.getUserId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating the image.", e);
        }
    }

    public void updateAdImage(Image image) {
        String query = "UPDATE images SET url = ? WHERE ad_id = ?";
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, image.getUrl());
            stmt.setInt(2, image.getAdId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating the image.", e);
        }
    }


    private List<Image> createImagesFromResults(ResultSet rs) throws SQLException {
        List<Image> images = new ArrayList<>();
        while (rs.next()) {
            images.add(extractImage(rs));
        }
        rs.close();
        return images;
    }

    private Image extractImage(ResultSet rs) throws SQLException {
        Image img = new Image(
                rs.getInt(1),
                rs.getInt(2),
                rs.getInt(3),
                rs.getString(4)
        );
        return img;
    }

}