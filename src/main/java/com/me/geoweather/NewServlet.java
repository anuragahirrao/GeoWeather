package com.me.geoweather;

import com.me.bean.ForeCast;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anuragahirrao
 */
public class NewServlet extends HttpServlet {

    static int i = 0;
    List<String> lHist = new ArrayList<String>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String lat = request.getParameter("lat");
        String lon = request.getParameter("lon");
        String adr = request.getParameter("adr");
        lHist.add(adr);
        ForeCast fc = new ForeCast();
        Map<String, String> forecast = fc.ForeCast(lat, lon);
        HttpSession session = request.getSession();
        session.setAttribute("map", forecast);
        session.setAttribute("history", lHist);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("current.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
