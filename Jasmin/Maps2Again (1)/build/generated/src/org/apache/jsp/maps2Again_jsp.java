package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class maps2Again_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Customizable Savable Map</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maps.googleapis.com/maps/api/js?sensor=false&libraries=drawing,geometry,places&ext=.js\"></script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            var map;\n");
      out.write("            var drawingManager;\n");
      out.write("            var elements;\n");
      out.write("\n");
      out.write("            //Overlays\n");
      out.write("            var polygons = [];\n");
      out.write("            var polylines = [];\n");
      out.write("\n");
      out.write("            var newPolygons = '");
      out.print(request.getAttribute("polygons"));
      out.write("';\n");
      out.write("            var editedPolygons = JSON.parse(newPolygons);\n");
      out.write("\n");
      out.write("\n");
      out.write("            function initialize() {\n");
      out.write("\n");
      out.write("\n");
      out.write("                //Map\n");
      out.write("                var mapProp = {\n");
      out.write("                    center: new google.maps.LatLng(14.5667, 120.9927),\n");
      out.write("                    zoom: 18,\n");
      out.write("                    mapTypeId: google.maps.MapTypeId.ROADMAP\n");
      out.write("\n");
      out.write("                };\n");
      out.write("                map = new google.maps.Map(document.getElementById(\"googleMap\"), mapProp);\n");
      out.write("\n");
      out.write("                //Drawing Manager\n");
      out.write("                var drawingManager = new google.maps.drawing.DrawingManager({\n");
      out.write("                    drawingMode: google.maps.drawing.OverlayType.MARKER,\n");
      out.write("                    drawingControl: true,\n");
      out.write("                    drawingControlOptions: {\n");
      out.write("                        position: google.maps.ControlPosition.TOP_CENTER,\n");
      out.write("                        drawingModes: [\n");
      out.write("                            google.maps.drawing.OverlayType.POLYGON,\n");
      out.write("                            google.maps.drawing.OverlayType.POLYLINE\n");
      out.write("                        ]\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("                drawingManager.setMap(map);\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                //Triggers\n");
      out.write("                google.maps.event.addDomListener(drawingManager, 'polygoncomplete', function (polygon) {\n");
      out.write("                    drawingManager.setDrawingMode(null);\n");
      out.write("                    var polypath = polygon.getPath().getArray();\n");
      out.write("                    var encodeString = google.maps.geometry.encoding.encodePath(polypath);\n");
      out.write("                    polygons.push(polypath);\n");
      out.write("                });\n");
      out.write("                google.maps.event.addDomListener(drawingManager, 'polylinecomplete', function (polyline) {\n");
      out.write("                    var polypath = polyline.getPath().getArray();\n");
      out.write("                    alert(polypath);\n");
      out.write("                    polylines.push(polypath);\n");
      out.write("                });\n");
      out.write("                \n");
      out.write("                for (var f = 0; f < editedPolygons.length; f++) {\n");
      out.write("                    var updatePolygon = new google.maps.Polygon({\n");
      out.write("                        paths: editedPolygons[f],\n");
      out.write("                        strokeColor: '#FF0000',\n");
      out.write("                        strokeOpacity: 0.8,\n");
      out.write("                        strokeWeight: 3,\n");
      out.write("                        fillColor: '#FF0000',\n");
      out.write("                        fillOpacity: 0.35,\n");
      out.write("                        map: map\n");
      out.write("\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                updatePolygon.setMap(map);\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            //Print Results\n");
      out.write("            function showElements() {\n");
      out.write("                document.getElementById(\"savedata\").value = \"\";\n");
      out.write("                for (var j = 0; j < polygons.length; j++) {\n");
      out.write("                    document.getElementById(\"savedata\").value += polygons[j] + \"\\n\";\n");
      out.write("                }\n");
      out.write("                alert(editedPolygons);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function sendElements() {\n");
      out.write("                var elementsJSON = JSON.stringify(polygons);\n");
      out.write("                alert(elementsJSON);\n");
      out.write("                window.location.assign(\"LoadNextPage?polygons=\" + elementsJSON);\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body onload='initialize()'>\n");
      out.write("        <div id=\"googleMap\" style=\"height: 510px; width: 100%; margin-top: 5px 5px 5px 5px;\"></div>\n");
      out.write("        <button id=\"savebutton\" onclick='showElements()'>SHOW</button>\n");
      out.write("        <button id=\"showbutton\" onclick=\"sendElements()\">SEND</button>\n");
      out.write("        <textarea id=\"savedata\" rows=\"5\" cols=\"40\"></textarea>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
