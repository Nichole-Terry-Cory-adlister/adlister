package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;
import org.hibernate.validator.constraints.SafeHtml;

import javax.validation.constraints.*;

public class User {
    private static final String PASSWORD_PATTERN =
            "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";
    private long id;

    @NotEmpty(message = "username cannot be emtpy")
    @Max(value = 25, message = "Username should not be greater than 25 characters")
    @SafeHtml()
    private String username;

    @NotEmpty (message = "email cannot be emtpy")
    @Email (message = "invalid email")
    @Max(value = 240,message = "Username should not be greater than 240 characters")
    @SafeHtml()
    private String email;

    @NotEmpty (message = "password cannot be empty")
    @Pattern(regexp = PASSWORD_PATTERN, message = "your password does not meet complexity requirements")
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
