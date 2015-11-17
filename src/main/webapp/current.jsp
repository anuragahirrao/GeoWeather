<%-- 
    Document   : newjsp
    Created on : Nov 13, 2015, 11:12:54 PM
    Author     : anuragahirrao
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body  {
                background-image: url("http://anewscafe.com/wp-content/uploads/2011/03/rainbow-weather.jpg");
                background-color: #cccccc;
            }
        </style>
    </head>
    <body><center>
        <h2>Current Weather conditions in the area are:</h2>

        <table>
            <c:forEach var="key" items="${sessionScope.map}">
                <tr> 

                    <td>   <option><c:out value="${key.key}"/></option></td>
                <td> <option>  <c:out value="${key.value}"/></option></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="index.jsp">Click to enter another location</a><br>
        <a href="history.jsp">Location History</a></center>
</body>
</html>
