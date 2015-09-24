<%-- 
    Document   : Maps3-Page1
    Created on : 09 22, 15, 12:27:02 PM
    Author     : jasmi_000
--%>

<html>
    <head>
        <title>Customizable Savable Map</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing,geometry,places&ext=.js"></script>

        <script type="text/javascript">
            var map;
            var drawingManager;
            var elements;
            var infoWindow, infoWindow2;
            var contentsJSON;
            //Overlays
            var polygons = [];
            var polylines = [];
            var infoContent = [];

            var newPolygons = '<%=request.getAttribute("polygons")%>';
            var newContents = '<%=request.getAttribute("labels")%>';
            var editedPolygons = JSON.parse(newPolygons);
            var editedContents = JSON.parse(newContents);

            function initialize() {

                //Map
                var mapProp = {
                    center: new google.maps.LatLng(14.5667, 120.9927),
                    zoom: 18,
                    mapTypeId: google.maps.MapTypeId.ROADMAP

                };
                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                infoWindow = new google.maps.InfoWindow({
                    content: '<textarea id="content" rows="2" cols="25"></textarea>' +
                            '<p>' + '<button onclick="saveToArray()">Save</button>'
                });

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
                    },
                    polygonOptions: {
                        clickable: true,
                        editable: false
                    }
                });

                drawingManager.setMap(map);


                //Triggers
                google.maps.event.addDomListener(drawingManager, 'polygoncomplete', function (polygon) {
                    drawingManager.setDrawingMode(null);
                    var polypath = polygon.getPath().getArray();
                    infoWindowPolygon(polygon);
                    var encodeString = google.maps.geometry.encoding.encodePath(polypath);
                    polygons.push(polypath);

                });

                google.maps.event.addDomListener(drawingManager, 'polylinecomplete', function (polyline) {
                    var polypath = polyline.getPath().getArray();
                    alert(polypath);
                    polylines.push(polypath);
                });

                for (var f = 0; f < editedPolygons.length; f++) {
                    var updatePolygon = new google.maps.Polygon({
                        paths: editedPolygons[f],
                        strokeColor: '#FF0000',
                        strokeOpacity: 0.8,
                        strokeWeight: 3,
                        fillColor: '#FF0000',
                        fillOpacity: 0.35,
                        map: map

                    });

//                    for (var g = 0; g < editedContents.length; g++) {
//                        google.maps.event.addListener(updatePolygon, 'click', function () {
//                            var infoWindow2 = new google.maps.InfoWindow();
//                            infoWindow2.setContent(editedContents[g]);
//                            var vertices2 = updatePolygon.getPath();
//                            var bounds2 = new google.maps.LatLngBounds();
//                            vertices2.forEach(function (xy, i) {
//                                bounds2.extend(xy);
//                            });
//                            infoWindow2.setPosition(bounds.getCenter());
//                        });
//                        infoWindow2.open(map);
//                    }
                }

                updatePolygon.setMap(map);

            }

            //Print Results
            function saveToArray() {
                var contents = document.getElementById("content").value;
                infoContent.push(contents);
                contentsJSON = JSON.stringify(infoContent);
            }
            function showElements() {
                document.getElementById("savedata").value = "";
                document.getElementById("showContents").value = "";
                for (var j = 0; j < polygons.length; j++) {
                    document.getElementById("savedata").value += polygons[j] + "\n";
                }
                for (var l = 0; l < infoContent.length; l++) {
                    document.getElementById("showContents").value += infoContent[l] + "\n";
                }

            }


            function sendElements() {
                var elementsJSON = JSON.stringify(polygons);
                alert(elementsJSON);
                window.location.assign("LoadSecondPageMaps3?polygons=" + elementsJSON + "&labels=" + contentsJSON);
            }

            function infoWindowPolygon(polygon) {
                var vertices = polygon.getPath();

                var bounds = new google.maps.LatLngBounds();
                vertices.forEach(function (xy, i) {
                    bounds.extend(xy);
                });
//                drawingManager.setDrawingMode(null);

                infoWindow.setPosition(bounds.getCenter());
                infoWindow.open(map);
            }



        </script>
    </head>
    <body onload='initialize()'>
        <div id="googleMap" style="height: 510px; width: 100%; margin-top: 5px 5px 5px 5px;"></div>
        <button id="savebutton" onclick='showElements()'>SHOW</button>
        <button id="showbutton" onclick="sendElements()">SEND</button>
        <textarea id="savedata" rows="5" cols="40"></textarea>
        <textarea id="showContents" rows="5" cols="40"></textarea>
    </body>
</html>