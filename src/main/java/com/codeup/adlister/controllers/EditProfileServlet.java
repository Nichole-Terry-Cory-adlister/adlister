package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditProfileServlet", urlPatterns = "/profile/edit")

public class EditProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

        String userId = request.getParameter("username");
        String userEmail = request.getParameter("email");
        User user = (User) request.getSession().getAttribute("user");

        if (userId != null) {
            int convertedUserId = Integer.parseInt(userId);
        } else {
            response.sendRedirect("/profile");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String currentPassword = request.getParameter("current_password");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        User user = DaoFactory.getUsersDao().findByUsername(username);
        if (user == null) {
            response.sendRedirect("/profile");
            return;
        }
        boolean validAttempt = Password.check(currentPassword, user.getPassword());

        if (validAttempt && password.equals(passwordConfirmation))  {
            User newUser = new User(
                    user.getId(),
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("password")
            );
            DaoFactory.getUsersDao().updateUser(newUser);

            response.sendRedirect(request.getHeader("referer"));

        } else {
            request.getSession().setAttribute("errorMessage", "There was a problem with your credentials.");
            response.sendRedirect("/login");
        }
    }

    }
