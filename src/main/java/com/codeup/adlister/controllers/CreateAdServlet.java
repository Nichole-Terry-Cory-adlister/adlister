package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
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

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("all", DaoFactory.getCategoryDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            javax.validation.ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            Validator validator = factory.getValidator();
            User user = (User) request.getSession().getAttribute("user");

            Ad ad = new Ad(
                user.getId(),
                Long.parseLong(request.getParameter("catId")),
                request.getParameter("title"),
                request.getParameter("description"),
                    request.getParameter("date"),
                request.getParameter("location")
            );

            Set<ConstraintViolation<Ad>> violations = validator.validate(ad);
            if(violations.size() == 0) {
                DaoFactory.getAdsDao().insert(ad);
                response.sendRedirect("/profile");
            }else {
                request.setAttribute("all", DaoFactory.getCategoryDao().all());
                request.getSession().setAttribute("createViolations", violations);
                request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            }
        }else {
            response.sendRedirect("/login");
        }
    }
}
