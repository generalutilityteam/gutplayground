<%-- 
    Document   : second-page
    Created on : 09 15, 15, 10:22:47 PM
    Author     : jasmi_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <script type="text/javascript" src="web/maps2.js"></script>
        <script type="text/javascript" src="web/second-page.js"></script>
        <script>
            var polygons = '<%=request.getAttribute("elements")%>';
           
            function showElements() {
                document.getElementById("savedata").value = "";
                for (var i = 0; i < polygons.length; i++) {
                    document.getElementById("savedata").value += "polygon((" + polygons[i] + ")\n";
                }
            }
        </script>
    </head>
    <body onload="showElements()">
       Polygons:
       <textarea id="savedata"></textarea>
       <button onClick="saveElements()">Save</button>
    </body>
</html>
