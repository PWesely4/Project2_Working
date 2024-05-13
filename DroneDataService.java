package com.dronerecon.ws;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.URL;
import java.util.*;
import java.security.SecureRandom;

/**
 *
 * Paul Wesely
 */
public class DroneDataService extends HttpServlet{
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=utf-8");
        response.addHeader("Access-Control-Allow-Origin", "*");

        PrintWriter out = response.getWriter();

        String area_id = request.getParameter("area_id");
        int tilex = Integer.parseInt(request.getParameter("tilex"));
        int tiley = Integer.parseInt(request.getParameter("tiley"));
        int totalcols = Integer.parseInt(request.getParameter("totalcols"));
        int totalrows = Integer.parseInt(request.getParameter("totalrows"));
        int r = Integer.parseInt(request.getParameter("r"));
        int g = Integer.parseInt(request.getParameter("g"));

        try {

            URL url = new URL("http://127.0.0.1:8080/dronereconportal/PortalDBService?area_id=" + area_id + "&tilex=" + tilex + "&tiley=" + tiley + "&r=" + r + "&g=" + g);
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
        }
        catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("An error occurred in doGet() in DroneDataService: " + ex.toString());
        }

        String sDirection = "right";


        if(tiley % 2 == 0){
            if(tilex == totalcols - 1){
                tiley++;
                sDirection = "left";
            }
            else{
                tilex++;
            }
        }
        else {
            if(tilex == 0){
                tiley++;
                sDirection = "right";
            }
            else{
                tilex--;
                sDirection = "left";
            }
        }
        if(tiley == totalrows ){
            sDirection = "stop";
        }

        String sReturnJson = "{\"area_id\":\"" + area_id + "\", \"nextTileX\":\"" + tilex + "\", \"nextTileY\":\"" + tiley  + "\", \"direction\":\"" + sDirection + "\"}\n";out.print(sReturnJson);

    }
}