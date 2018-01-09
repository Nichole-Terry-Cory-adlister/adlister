package com.codeup.adlister.dao;

import com.codeup.adlister.models.Catergory;

import java.util.List;

public interface Categories {
    // get a list of all the ads
    List<Catergory> all();
    // insert a new ad and return the new ad's id
    Long insert(Catergory catergory);

}