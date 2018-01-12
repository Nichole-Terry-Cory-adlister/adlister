package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.io.IOException;
import java.util.Set;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        javax.validation.ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();

        boolean inputHasErrors = password.isEmpty() || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            request.getSession().setAttribute("passViolation", "Password invalid");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
        // validate input

        // create and save a new user
        User user = new User(username, email, password);
        Set<ConstraintViolation<User>> violations = validator.validate(user);

        if (violations.size() == 0) {
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        }else {
            request.getSession().setAttribute("registerViolations", violations);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }

    }
}
