package com.codeup.adlister.models;


import org.hibernate.validator.constraints.SafeHtml;

import javax.validation.constraints.*;

public class Ad {
    private long id;


    @NotNull
    @PositiveOrZero
    private long userId;

    @NotNull
    @PositiveOrZero
    private long catId;

    @NotEmpty(message = "Title cannot be empty")
    @Size(min = 2, max = 50, message = "")
    @SafeHtml()
    private String title;

    @NotEmpty(message = "Description cannot be empty")
    @Size(min = 2, max = 10000, message = "")
    @SafeHtml()
    private String description;

    @NotEmpty(message = "Date cannot be empty")
    private String date;

    @NotEmpty(message = "Location cannot be empty")
    @Size(min = 2, max = 50, message = "")
    @SafeHtml()
    private String location;

    public Ad(long id, @NotNull @PositiveOrZero long userId, @NotNull @PositiveOrZero long catId, @NotEmpty(message = "Title cannot be empty") @Size(min = 2, max = 50, message = "") @SafeHtml() String title, @NotEmpty(message = "Description cannot be empty") @Size(min = 2, max = 10000, message = "") @SafeHtml() String description, @NotEmpty(message = "Date cannot be empty") String date, @NotEmpty(message = "Location cannot be empty") @Size(min = 2, max = 50, message = "") @SafeHtml() String location) {
        this.id = id;
        this.userId = userId;
        this.catId = catId;
        this.title = title;
        this.description = description;
        this.location = location;
        this.date = date;

    }

    public Ad(@NotNull @PositiveOrZero long userId, @NotNull @PositiveOrZero long catId, @NotEmpty(message = "Title cannot be empty") @Size(min = 2, max = 50, message = "") @SafeHtml() String title, @NotEmpty(message = "Description cannot be empty") @Size(min = 2, max = 10000, message = "") @SafeHtml() String description, @NotEmpty(message = "Date cannot be empty") String date, @NotEmpty(message = "Location cannot be empty") @Size(min = 2, max = 50, message = "") @SafeHtml() String location) {
        this.userId = userId;
        this.catId = catId;
        this.title = title;
        this.description = description;
        this.location = location;
        this.date = date;

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getCatId() {
        return catId;
    }

    public void setCatId(long catId) {
        this.catId = catId;
    }
}
