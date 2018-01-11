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

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String adId = request.getParameter("id");
            request.setAttribute("categories", DaoFactory.getCategoryDao().all());
            System.out.println(adId);
            User user = (User) request.getSession().getAttribute("user");
            int adID = Integer.parseInt(request.getParameter("id"));
            Ad ad = DaoFactory.getAdsDao().searchByAdId(adID);
            if (user == null || user.getId() != ad.getUserId()) {
                response.sendRedirect("/login");
                return;
            }

            if (adId != null) {
                int  convertedAdId = Integer.parseInt(adId);
                //Search for ads from a user input
                request.setAttribute("ad", DaoFactory.getAdsDao().searchByAdId(convertedAdId));
                request.setAttribute("categories", DaoFactory.getCategoryDao().all());
                request.getRequestDispatcher("/WEB-INF/editAds.jsp").forward(request, response);
            } else {
                response.sendRedirect("/profile");
            }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String id = request.getParameter("adID");
        System.out.println(Integer.parseInt(id));
        Ad ad = new Ad(
                Long.parseLong(id),
                user.getId(),
                Long.parseLong(request.getParameter("catId")),
                request.getParameter("title"),
                request.getParameter("description"),
                request.getParameter("location"),
                request.getParameter("date")
        );
        DaoFactory.getAdsDao().updateAd(ad);
        response.sendRedirect("/ads/ad?id=" + id);
    }
}
