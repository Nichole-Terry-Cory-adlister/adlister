package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DisplayAdServlet", urlPatterns = "/ads/ad")
public class DisplayAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adId = request.getParameter("id");
        request.setAttribute("categories", DaoFactory.getCategoryDao().all());
        System.out.println(adId);
        if (adId != null) {
            int  convertedAdId = Integer.parseInt(adId);
            //Search for ads from a user input
            request.setAttribute("ads", DaoFactory.getAdsDao().searchByAdId(convertedAdId));
            request.getRequestDispatcher("/WEB-INF/displayAds.jsp").forward(request, response);
        } else {
            response.sendRedirect("/ads");
        }
    }
}
