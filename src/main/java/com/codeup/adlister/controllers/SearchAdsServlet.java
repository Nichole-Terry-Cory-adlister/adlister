package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Catergory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.SearchAdsServlet", urlPatterns = "/search")
public class SearchAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        String catId = request.getParameter("catid");
        if (input != null) {
            request.setAttribute("categories", DaoFactory.getCategoryDao().all());
            request.setAttribute("term", input);
            request.setAttribute("ads", DaoFactory.getAdsDao().search(input));
            request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
        }else if (catId != null){
            int catInt = Integer.parseInt(catId);
            List<Catergory> all = DaoFactory.getCategoryDao().all();
            request.setAttribute("categories", all);
            for (Catergory cat : all)
            {
                 if(cat.getId() == catInt){
                     request.setAttribute("term", cat.getName());
                 }
            }
            request.setAttribute("ads", DaoFactory.getAdsDao().searchByCat(catInt));
            request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
           }else {
            response.sendRedirect("/");
        }
    }
}
