<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Network | Manipulation</title>

        <style type="text/css">
            body, select {
                font: 10pt sans;
            }
            #mynetwork {
                position:relative;
                width: 900px;
                height: 600px;
                border: 1px solid #444444;
            }
            table.legend_table {
                font-size: 11px;
                border-width:1px;
                border-color:#d3d3d3;
                border-style:solid;
            }
            table.legend_table,td {
                border-width:1px;
                border-color:#d3d3d3;
                border-style:solid;
                padding: 2px;
            }
            div.table_content {
                width:80px;
                text-align:center;
            }
            div.table_description {
                width:100px;
            }

            #operation {
                font-size:28px;
            }
            #network-popUp {
                display:none;
                position:absolute;
                top:350px;
                left:170px;
                z-index:299;
                width:250px;
                height:150px;
                background-color: #f9f9f9;
                border-style:solid;
                border-width:3px;
                border-color: #5394ed;
                padding:10px;
                text-align: center;
            }
        </style>
        <script type="text/javascript" src="js/vis.js"></script>
        <link href="css/vis.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/pagescript/cog5.js"></script>
        <script>
            var editNodes = '<%=request.getAttribute("nodes")%>';
            var editEdges = '<%=request.getAttribute("edges")%>';
            var nodesArray = JSON.parse(editNodes);
            var edgesArray = JSON.parse(editEdges);
        </script>

    </head>

    <body onload="draw();">
        <h2>Center of Gravity Analysis</h2>
        <button onclick="clearAll()">Clear Network</button>
        <button onclick="addNode()">Add Node</button>
        <button onclick="saveCOG()">Save Center of Gravity</button>
        <div id="network-popUp">
            <span id="operation">node</span> <br>
            <table style="margin:auto;"><tr>
                    <td>id</td><td><input id="node-id" value="new value" /></td>
                </tr>
                <tr>
                    <td>label</td><td><input id="node-label" value="new value" /></td>
                </tr>
                <tr>
                    <td>group</td><td>
                        <select id="node-group">
                            <option value="cog">Center of Gravity</option>
                            <option value="cc">Critical Capability</option>
                            <option value="cr">Critical Requirement</option>
                            <option value="cv">Critical Vulnerability</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="button" value="save" id="saveButton"/>
            <input type="button" value="cancel" id="cancelButton" />
        </div>
        <br />
        <div id="mynetwork"></div>
        <div id="legend" style="font-size:20px;">
            <ul class="fa-ul">
                <li><i class="fa-li fa fa-heartbeat" style="color:#CC0000"></i>Center of Gravity</li>
                <li><i class="fa-li fa fa-bomb" style="color:#202020"></i>Critical Capability</li>
                <li><i class="fa-li fa fa-exclamation-circle" style="color:#FF4500"></i>Critical Requirement</li>
                <li><i class="fa-li fa fa-unlock-alt" style="color:#DAA520"></i>Critical Vulnerability</li>
            </ul>
        </div>
    </body>
</html>

