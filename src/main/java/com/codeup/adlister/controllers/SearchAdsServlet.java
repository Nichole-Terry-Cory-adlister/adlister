package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.SearchAdsServlet", urlPatterns = "/search")
public class SearchAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        String catId = request.getParameter("catid");

        System.out.println(input);
        System.out.println(catId);

        if (input != null) {
            //Search for ads from a user input
            request.setAttribute("ads", DaoFactory.getAdsDao().search(input));
            request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
        }

        if (catId != null){
            int catInt = Integer.parseInt(catId);
            //Search for Ads from a given category
            request.setAttribute("ads", DaoFactory.getCategoryDao().search(catInt));
            request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
           }

           response.sendRedirect("/home");
    }
}
