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

            //Overlays
            var polygons = [];
            var polylines = [];

            var newPolygons = '<%=request.getAttribute("polygons")%>';
            var editedPolygons = JSON.parse(newPolygons);


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
                }

                updatePolygon.setMap(map);
            }
            
            //Print Results
            function showElements() {
                document.getElementById("savedata").value = "";
                for (var j = 0; j < polygons.length; j++) {
                    document.getElementById("savedata").value += polygons[j] + "\n";
                }
                alert(editedPolygons);
            }

            function sendElements() {
                var elementsJSON = JSON.stringify(polygons);
                alert(elementsJSON);
                window.location.assign("LoadNextPage?polygons=" + elementsJSON);
            }
        </script>
    </head>
    <body onload='initialize()'>
        <div id="googleMap" style="height: 510px; width: 100%; margin-top: 5px 5px 5px 5px;"></div>
        <button id="savebutton" onclick='showElements()'>SHOW</button>
        <button id="showbutton" onclick="sendElements()">SEND</button>
        <textarea id="savedata" rows="5" cols="40"></textarea>
    </body>
</html>