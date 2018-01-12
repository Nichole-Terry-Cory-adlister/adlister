package com.codeup.adlister.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.PositiveOrZero;

public class Image {

    private int id;

    @PositiveOrZero
    private int userId;


    @PositiveOrZero
    private int adId;

    @NotEmpty
    private String url;

    public Image(@PositiveOrZero int userId, @PositiveOrZero int catId, @NotEmpty String url) {
        this.userId = userId;
        this.adId = catId;
        this.url = url;
    }


    public Image(int id, @PositiveOrZero int userId, @PositiveOrZero int catId, @NotEmpty String url) {
        this.id = id;
        this.userId = userId;
        this.adId = catId;
        this.url = url;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
