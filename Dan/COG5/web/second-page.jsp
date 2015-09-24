<%-- 
    Document   : second-page
    Created on : Sep 11, 2015, 3:20:07 PM
    Author     : Dan Torres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script type="text/javascript" src="js/vis.js"></script>
        <link href="css/vis.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/pagescript/second-page.js"></script>
        <script>
            var nodesArray = '<%=request.getAttribute("nodes")%>';
            var edgesArray = '<%=request.getAttribute("edges")%>';
        </script>

    </head>
    <body onload="initialize()">
        Nodes:
        <textarea id="nodesContent">
            
        </textarea>
        Edges:
        <textarea id="edgesContent">
            
        </textarea>
        <button onclick="saveChanges()">Save Nodes and Edges</button>
    </body>
</html>
