package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cog4_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Network | Manipulation</title>\n");
      out.write("\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body, select {\n");
      out.write("                font: 10pt sans;\n");
      out.write("            }\n");
      out.write("            #mynetwork {\n");
      out.write("                position:relative;\n");
      out.write("                width: 900px;\n");
      out.write("                height: 600px;\n");
      out.write("                border: 1px solid #444444;\n");
      out.write("            }\n");
      out.write("            table.legend_table {\n");
      out.write("                font-size: 11px;\n");
      out.write("                border-width:1px;\n");
      out.write("                border-color:#d3d3d3;\n");
      out.write("                border-style:solid;\n");
      out.write("            }\n");
      out.write("            table.legend_table,td {\n");
      out.write("                border-width:1px;\n");
      out.write("                border-color:#d3d3d3;\n");
      out.write("                border-style:solid;\n");
      out.write("                padding: 2px;\n");
      out.write("            }\n");
      out.write("            div.table_content {\n");
      out.write("                width:80px;\n");
      out.write("                text-align:center;\n");
      out.write("            }\n");
      out.write("            div.table_description {\n");
      out.write("                width:100px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #operation {\n");
      out.write("                font-size:28px;\n");
      out.write("            }\n");
      out.write("            #network-popUp {\n");
      out.write("                display:none;\n");
      out.write("                position:absolute;\n");
      out.write("                top:350px;\n");
      out.write("                left:170px;\n");
      out.write("                z-index:299;\n");
      out.write("                width:250px;\n");
      out.write("                height:150px;\n");
      out.write("                background-color: #f9f9f9;\n");
      out.write("                border-style:solid;\n");
      out.write("                border-width:3px;\n");
      out.write("                border-color: #5394ed;\n");
      out.write("                padding:10px;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/vis.js\"></script>\n");
      out.write("        <link href=\"css/vis.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"js/pagescript/cog4.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            var editNodes = '");
      out.print(request.getAttribute("nodes"));
      out.write("';\n");
      out.write("            var editEdges = '");
      out.print(request.getAttribute("edges"));
      out.write("';\n");
      out.write("            var nodesJSON = JSON.parse(editNodes);\n");
      out.write("            var edgesJSON = JSON.parse(editEdges);\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body onload=\"draw();\">\n");
      out.write("        <h2>Center of Gravity Analysis</h2>\n");
      out.write("        <button onclick=\"clearAll()\">Clear Network</button>\n");
      out.write("        <button onclick=\"resetAll()\">Reset Network</button>\n");
      out.write("        <button onclick=\"addNode()\">Add Node</button>\n");
      out.write("        <button onclick=\"saveCOG()\">Save Center of Gravity</button>\n");
      out.write("        <div id=\"network-popUp\">\n");
      out.write("            <span id=\"operation\">node</span> <br>\n");
      out.write("            <table style=\"margin:auto;\"><tr>\n");
      out.write("                    <td>id</td><td><input id=\"node-id\" value=\"new value\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>label</td><td><input id=\"node-label\" value=\"new value\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>group</td><td>\n");
      out.write("                        <select id=\"node-group\">\n");
      out.write("                            <option value=\"cog\">Center of Gravity</option>\n");
      out.write("                            <option value=\"cc\">Critical Capability</option>\n");
      out.write("                            <option value=\"cr\">Critical Requirement</option>\n");
      out.write("                            <option value=\"cv\">Critical Vulnerability</option>\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"button\" value=\"save\" id=\"saveButton\"/>\n");
      out.write("            <input type=\"button\" value=\"cancel\" id=\"cancelButton\" />\n");
      out.write("        </div>\n");
      out.write("        <br />\n");
      out.write("        <div id=\"mynetwork\"></div>\n");
      out.write("        <div id=\"legend\" style=\"font-size:20px;\">\n");
      out.write("            <ul class=\"fa-ul\">\n");
      out.write("                <li><i class=\"fa-li fa fa-heartbeat\" style=\"color:#CC0000\"></i>Center of Gravity</li>\n");
      out.write("                <li><i class=\"fa-li fa fa-bomb\" style=\"color:#202020\"></i>Critical Capability</li>\n");
      out.write("                <li><i class=\"fa-li fa fa-exclamation-circle\" style=\"color:#FF4500\"></i>Critical Requirement</li>\n");
      out.write("                <li><i class=\"fa-li fa fa-unlock-alt\" style=\"color:#DAA520\"></i>Critical Vulnerability</li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
