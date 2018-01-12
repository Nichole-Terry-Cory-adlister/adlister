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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String adId = request.getParameter("id");
        request.setAttribute("categories", DaoFactory.getCategoryDao().all());

        User user = (User) request.getSession().getAttribute("user");
        int adID = Integer.parseInt(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().searchByAdId(adID);

        if (user == null || user.getId() != ad.getUserId()) {
            response.sendRedirect("/login");
            return;
        }

        if (adId != null) {
            int convertedAdId = Integer.parseInt(adId);
            //Search for ads from a user input
            request.setAttribute("ad", DaoFactory.getAdsDao().searchByAdId(convertedAdId));
            request.setAttribute("categories", DaoFactory.getCategoryDao().all());
            request.getRequestDispatcher("/WEB-INF/editAds.jsp").forward(request, response);
        } else {
            response.sendRedirect("/profile");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String id = request.getParameter("adID");
        javax.validation.ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        int adID = Integer.parseInt(id);
        Date date = new Date();
        String modifiedDate= new SimpleDateFormat("MM-dd-yyyy").format(date);
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        Ad currentAd = DaoFactory.getAdsDao().searchByAdId(adID);

        if (user.getId() == currentAd.getUserId()) {
            Ad ad = new Ad(
                    Long.parseLong(id),
                    user.getId(),
                    Long.parseLong(request.getParameter("catId")),
                    request.getParameter("title"),
                    request.getParameter("description"),
                    modifiedDate,
                    currentAd.getLocation()
            );

            Set<ConstraintViolation<Ad>> violations = validator.validate(ad);

            if (violations.size() == 0) {
                System.out.println("no violation");
                DaoFactory.getAdsDao().updateAd(ad);
                response.sendRedirect("/ads/ad?id=" + id);
            }else {
                System.out.println("violation");
                request.setAttribute("ad", DaoFactory.getAdsDao().searchByAdId(adID));
                request.setAttribute("categories", DaoFactory.getCategoryDao().all());
                request.setAttribute("all", DaoFactory.getCategoryDao().all());
                request.getSession().setAttribute("editViolations", violations);
                request.getRequestDispatcher("/WEB-INF/editAds.jsp").forward(request, response);
            }
        }
    }
}