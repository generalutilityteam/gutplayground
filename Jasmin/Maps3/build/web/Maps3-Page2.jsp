<%-- 
    Document   : Maps3-Page2
    Created on : 09 22, 15, 12:27:24 PM
    Author     : jasmi_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing,geometry,places&ext=.js"></script>
        <script>
            var elementsJSON = '<%=request.getAttribute("polygons")%>';
            var contentsJSON = '<%=request.getAttribute("labels")%>';
            var contentsArray = [];
            var contents;
            var contentsNew;
            var elements;
            var elementsArray = [];
            var encodedArray = ""

            function init() {

                document.getElementById('savedata').value = elementsJSON;
                document.getElementById('contents').value = contentsJSON;

            }


            function saveChanges() {
                elements = document.getElementById('savedata').value;
                contents = document.getElementById('contents').value;
                elementsArray = JSON.parse(elements);
                
                alert(elementsArray);

                var sampleArray = [];

                for (var k = 0; k < elementsArray.length; k++) {
                    var tempArray = [];

                    for (var i = 0; i < elementsArray[k].length; i++) {
                        tempArray.push({
                            "lat": elementsArray[k][i].H,
                            "lng": elementsArray[k][i].L
                        })
                    }
                    sampleArray.push(tempArray);
                }
                elementsNew = JSON.stringify(sampleArray)
            
                window.location.assign("LoadMaps3?polygons=" + elementsNew + "&labels=" + contents);

            }


        </script>
    </head>
    <body onload="init()">
        Polygons:
        <textarea id="savedata"></textarea>
        Labels:
        <textarea id="contents"></textarea>
        <button onClick="saveChanges()">Save</button>
    </body>
</html>
