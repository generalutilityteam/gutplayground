<%-- 
    Document   : maps2
    Created on : 09 15, 15, 10:20:19 PM
    Author     : jasmi_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customizable Savable Map</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing,geometry,places&ext=.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


        <script type="text/javascript">
            var map;
            var drawingManager;
            var editElements = '<%=request.getAttribute("elements")%>';
            ;
            //Overlays
            var polygons = [];
            var polylines = [];
            function initialize() {
                //Map
                var mapProp = {
                    center: new google.maps.LatLng(14.5667, 120.9927),
                    zoom: 18,
                    mapTypeId: google.maps.MapTypeId.ROADMAP

                };
                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
                //Drawing Manager
                var drawingManager = new google.maps.drawing.DrawingManager({
                    drawingMode: google.maps.drawing.OverlayType.MARKER,
                    drawingControl: true,
                    drawingControlOptions: {
                        position: google.maps.ControlPosition.TOP_CENTER,
                        drawingModes: [
                            google.maps.drawing.OverlayType.POLYGON,
                            google.maps.drawing.OverlayType.POLYLINE
                        ]
                    }
                });
                drawingManager.setMap(map);
                //Triggers
                google.maps.event.addDomListener(drawingManager, 'polygoncomplete', function (polygon) {
                    drawingManager.setDrawingMode(null);
                    var polypath = polygon.getPath().getArray();
                    polygons.push(polypath);
                });
                google.maps.event.addDomListener(drawingManager, 'polylinecomplete', function (polyline) {
                    var polypath = polyline.getPath().getArray();
                    alert(polypath);
                    polylines.push(polypath);
                });
                // Construct the polygon.
                var bermudaTriangle = new google.maps.Polygon({
                    paths: polypath,
                    strokeColor: '#FF0000',
                    strokeOpacity: 0.8,
                    strokeWeight: 3,
                    fillColor: '#FF0000',
                    fillOpacity: 0.35
                });
                bermudaTriangle.setMap(map);
            }

            //Print Results
            function saveElements() {
                document.getElementById("savedata").value = "";
                for (var i = 0; i < polygons.length; i++) {
                    elements = document.getElementById("savedata").value += "polygon((" + polygons[i] + ")\n";
                }

                elements = request.getParameter("elements");
                if (elements != null && elements.length() > 0) {
                    session.setAttribute("elements", elements);
                }
            }








        </script>
    </head>
    <body onload='initialize()'>
        <div id="googleMap" style="height: 510px; width: 100%; margin-top: 5px 5px 5px 5px;"></div>
        <button id="savebutton" onclick="saveElements()">SAVE</button>
        <button id="editbutton" onclick="window.location.href = 'second-page.jsp'">EDIT</button>
        <textarea id="savedata" rows="5" cols="40"></textarea>
    </body>
</html>
