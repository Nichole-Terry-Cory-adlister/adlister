package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;
import org.hibernate.validator.constraints.SafeHtml;

import javax.validation.constraints.*;

public class User {
    private static final String PASSWORD_PATTERN =
            "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";
    private long id;

    @NotEmpty(message = "Username cannot be empty")
    @SafeHtml()
    private String username;

    @NotEmpty (message = "Email cannot be empty")
    @Email (message = "Invalid email")
    @SafeHtml()
    private String email;

    private String password;

    public User() {}

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        setPassword(password);
    }

    public User(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = Password.hash(password);
    }
}
