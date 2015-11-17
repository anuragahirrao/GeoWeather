<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <title>Geocoding service</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            #floating-panel {
                position: absolute;
                top: 10px;
                left: 40%;
                z-index: 5;
                background-color: #ACC4E6;
                padding: 5px;
                border: 1px solid #999;
                text-align: center;
                font-family: 'Roboto','sans-serif';
                line-height: 30px;
                padding-left: 10px;
            }
            body  {
                background-image: url("http://anewscafe.com/wp-content/uploads/2011/03/rainbow-weather.jpg");
                background-color: #cccccc;
            }

        </style>

    </head>
    <body> 
        <center>
            <br><br><br><br><br><br><br><br><br>

            <div id="floating-panel">
                <h3>Weather Forecasting</h3>

                <input id="address" type="text" placeholder="Enter address here">

                <input id="submit" type="submit" value="Confirm location">
                <form action="NewServlet" method="GET">
                    <input id="lat" type="hidden" name="lat" >
                    <input id="lon" type="hidden" name="lon" >
                    <input id="adr" type="hidden" name="adr" >
                    <input type="submit" value="check weather">

                </form> 
            </div>
            <div id="forecast"></div>
            <script>
                function initGeo() {

                    var geocoder = new google.maps.Geocoder();

                    document.getElementById('submit').addEventListener('click', function () {
                        var address = document.getElementById('address').value;

                        geocoder.geocode({'address': address}, function (results, status) {
                            if (status === google.maps.GeocoderStatus.OK) {

                                // alert(results[0].geometry.location);
                                var a = results[0].geometry.location.toString();
                                var b = a.slice(1, -1);
                                var c = b.split(",");
                                var d = (c[0]);
                                var e = (c[1]);
                                alert("Location is set to: " + address);


                                document.getElementById("lat").value = d;
                                document.getElementById("lon").value = e;
                                document.getElementById("adr").value = address;


                            } else {
                                alert('Geocode was not successful for the following reason: ' + status);
                            }
                        });
                    });
                }




            </script>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQ-f-BGGMS03En12Mm6Og0nYM50eZyIzI&signed_in=true&callback=initGeo"
            async defer></script>

            <a href="history.jsp">Location History</a>
        </center>
    </body>
</html>