package com.codeup.adlister.dao;

import com.codeup.adlister.models.Image;

import java.util.List;

public interface Images {
    Image getImage(int id);
    Image searchByUserId(Long userId);
    List<Image> searchByAdId(Long adId);
    Long insert(Image image);
    void updateUserImage(Image image);
    void updateAdImage(Image image);
}
