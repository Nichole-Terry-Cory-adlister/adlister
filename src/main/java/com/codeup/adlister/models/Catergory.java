package com.codeup.adlister.models;

import org.hibernate.validator.constraints.SafeHtml;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class Catergory  {

    private int id;
    @NotEmpty(message = "category name cannot be empty")
    @Size(min = 2, max = 50)
    @SafeHtml()
    private String name;

    public Catergory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

