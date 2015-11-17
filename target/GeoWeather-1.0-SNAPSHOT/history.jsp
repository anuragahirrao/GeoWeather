<%-- 
    Document   : history
    Created on : Nov 14, 2015, 2:07:42 AM
    Author     : anuragahirrao
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body  {
                background-image: url("http://anewscafe.com/wp-content/uploads/2011/03/rainbow-weather.jpg");
                background-color: #cccccc;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body><center>
        <h1>Search History</h1>

        <c:forEach var="key" items="${sessionScope.history}">
            <c:out value="${key}"></c:out><br>

                <br/>
        </c:forEach>
        <a href="index.jsp">Click to select Location</a><br>

        <a href="current.jsp">Recent Current conditions</a>
    </center>

</body>
</html>
