package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }
        try {
            request.setAttribute("categories", DaoFactory.getCategoryDao().all());
            request.setAttribute("userAds", DaoFactory.getAdsDao().searchByUserId(user.getId()));
            request.setAttribute("userImage", DaoFactory.getImagesDao().searchByUserId(user.getId()));
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        }
    }
}
