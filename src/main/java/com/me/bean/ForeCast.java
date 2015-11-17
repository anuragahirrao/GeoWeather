/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.me.bean;

import com.github.dvdme.ForecastIOLib.FIOCurrently;
import com.github.dvdme.ForecastIOLib.ForecastIO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author anuragahirrao
 */
public class ForeCast {

    public Map<String,String> ForeCast(String lat, String lon) {
        ForecastIO fio = new ForecastIO("05e62f76475de27e61f87cc0ad566ddf");
        fio.setUnits(ForecastIO.UNITS_SI);             //sets the units as SI - optional
        fio.setExcludeURL("hourly,minutely");             //excluded the minutely and hourly reports from the reply
        fio.getForecast(lat, lon);   //sets the latitude and longitude - not optional
        //it will fail to get forecast if it is not set
        //this method should be called after the options were set

        //instantiate the class with the API key. 
        FIOCurrently currently = new FIOCurrently(fio);
        //Print currently data
        System.out.println("\nCurrently\n");
        String[] json = currently.get().getFieldsArray();
        Map<String,String> myMap = new HashMap<String, String>();
         for (int i = 0; i < json.length; i++) {
         System.out.println(json[i] + ": " + currently.get().getByKey(json[i]));
         myMap.put(json[i],currently.get().getByKey(json[i]));
         }
         
        return myMap;
    }

}
