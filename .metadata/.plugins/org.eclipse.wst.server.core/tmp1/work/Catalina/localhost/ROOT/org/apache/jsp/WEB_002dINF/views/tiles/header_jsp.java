/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2022-07-27 08:46:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.tiles;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/Java/06_Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/springProj/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1658880554900L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- Topbar -->\r\n");
      out.write("<nav class=\"navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Sidebar Toggle (Topbar) -->\r\n");
      out.write("   <button id=\"sidebarToggleTop\" class=\"btn btn-link d-md-none rounded-circle mr-3\">\r\n");
      out.write("       <i class=\"fa fa-bars\"></i>\r\n");
      out.write("   </button>\r\n");
      out.write("\r\n");
      out.write("   <!-- Topbar Search -->\r\n");
      out.write("   <form\r\n");
      out.write("       class=\"d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search\">\r\n");
      out.write("       <div class=\"input-group\">\r\n");
      out.write("           <input type=\"text\" class=\"form-control bg-light border-0 small\" placeholder=\"Search for...\"\r\n");
      out.write("               aria-label=\"Search\" aria-describedby=\"basic-addon2\">\r\n");
      out.write("           <div class=\"input-group-append\">\r\n");
      out.write("               <button class=\"btn btn-primary\" type=\"button\">\r\n");
      out.write("                   <i class=\"fas fa-search fa-sm\"></i>\r\n");
      out.write("               </button>\r\n");
      out.write("           </div>\r\n");
      out.write("       </div>\r\n");
      out.write("   </form>\r\n");
      out.write("\r\n");
      out.write("   <!-- Topbar Navbar -->\r\n");
      out.write("   <ul class=\"navbar-nav ml-auto\">\r\n");
      out.write("\r\n");
      out.write("       <!-- Nav Item - Search Dropdown (Visible Only XS) -->\r\n");
      out.write("       <li class=\"nav-item dropdown no-arrow d-sm-none\">\r\n");
      out.write("           <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"searchDropdown\" role=\"button\"\r\n");
      out.write("               data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("               <i class=\"fas fa-search fa-fw\"></i>\r\n");
      out.write("           </a>\r\n");
      out.write("           <!-- Dropdown - Messages -->\r\n");
      out.write("           <div class=\"dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in\"\r\n");
      out.write("               aria-labelledby=\"searchDropdown\">\r\n");
      out.write("               <form class=\"form-inline mr-auto w-100 navbar-search\">\r\n");
      out.write("                   <div class=\"input-group\">\r\n");
      out.write("                       <input type=\"text\" class=\"form-control bg-light border-0 small\"\r\n");
      out.write("                           placeholder=\"Search for...\" aria-label=\"Search\"\r\n");
      out.write("                           aria-describedby=\"basic-addon2\">\r\n");
      out.write("                       <div class=\"input-group-append\">\r\n");
      out.write("                           <button class=\"btn btn-primary\" type=\"button\">\r\n");
      out.write("                               <i class=\"fas fa-search fa-sm\"></i>\r\n");
      out.write("                           </button>\r\n");
      out.write("                       </div>\r\n");
      out.write("                   </div>\r\n");
      out.write("               </form>\r\n");
      out.write("           </div>\r\n");
      out.write("       </li>\r\n");
      out.write("\r\n");
      out.write("       <!-- Nav Item - Alerts -->\r\n");
      out.write("       <li class=\"nav-item dropdown no-arrow mx-1\">\r\n");
      out.write("           <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"alertsDropdown\" role=\"button\"\r\n");
      out.write("               data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("               <i class=\"fas fa-bell fa-fw\"></i>\r\n");
      out.write("               <!-- Counter - Alerts -->\r\n");
      out.write("               <span class=\"badge badge-danger badge-counter\">3+</span>\r\n");
      out.write("           </a>\r\n");
      out.write("           <!-- Dropdown - Alerts -->\r\n");
      out.write("           <div class=\"dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in\"\r\n");
      out.write("               aria-labelledby=\"alertsDropdown\">\r\n");
      out.write("               <h6 class=\"dropdown-header\">\r\n");
      out.write("                   Alerts Center\r\n");
      out.write("               </h6>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"mr-3\">\r\n");
      out.write("                       <div class=\"icon-circle bg-primary\">\r\n");
      out.write("                           <i class=\"fas fa-file-alt text-white\"></i>\r\n");
      out.write("                       </div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">December 12, 2019</div>\r\n");
      out.write("                       <span class=\"font-weight-bold\">A new monthly report is ready to download!</span>\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"mr-3\">\r\n");
      out.write("                       <div class=\"icon-circle bg-success\">\r\n");
      out.write("                           <i class=\"fas fa-donate text-white\"></i>\r\n");
      out.write("                       </div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">December 7, 2019</div>\r\n");
      out.write("                       $290.29 has been deposited into your account!\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"mr-3\">\r\n");
      out.write("                       <div class=\"icon-circle bg-warning\">\r\n");
      out.write("                           <i class=\"fas fa-exclamation-triangle text-white\"></i>\r\n");
      out.write("                       </div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">December 2, 2019</div>\r\n");
      out.write("                       Spending Alert: We've noticed unusually high spending for your account.\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item text-center small text-gray-500\" href=\"#\">Show All Alerts</a>\r\n");
      out.write("           </div>\r\n");
      out.write("       </li>\r\n");
      out.write("\r\n");
      out.write("       <!-- Nav Item - Messages -->\r\n");
      out.write("       <li class=\"nav-item dropdown no-arrow mx-1\">\r\n");
      out.write("           <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"messagesDropdown\" role=\"button\"\r\n");
      out.write("               data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("               <i class=\"fas fa-envelope fa-fw\"></i>\r\n");
      out.write("               <!-- Counter - Messages -->\r\n");
      out.write("               <span class=\"badge badge-danger badge-counter\">7</span>\r\n");
      out.write("           </a>\r\n");
      out.write("           <!-- Dropdown - Messages -->\r\n");
      out.write("           <div class=\"dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in\"\r\n");
      out.write("               aria-labelledby=\"messagesDropdown\">\r\n");
      out.write("               <h6 class=\"dropdown-header\">\r\n");
      out.write("                   Message Center\r\n");
      out.write("               </h6>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"dropdown-list-image mr-3\">\r\n");
      out.write("                       <img class=\"rounded-circle\" src=\"/resources/sbadmin2/img/undraw_profile_1.svg\"\r\n");
      out.write("                           alt=\"...\">\r\n");
      out.write("                       <div class=\"status-indicator bg-success\"></div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div class=\"font-weight-bold\">\r\n");
      out.write("                       <div class=\"text-truncate\">Hi there! I am wondering if you can help me with a\r\n");
      out.write("                           problem I've been having.</div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">Emily Fowler · 58m</div>\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"dropdown-list-image mr-3\">\r\n");
      out.write("                       <img class=\"rounded-circle\" src=\"/resources/sbadmin2/img/undraw_profile_2.svg\"\r\n");
      out.write("                           alt=\"...\">\r\n");
      out.write("                       <div class=\"status-indicator\"></div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div>\r\n");
      out.write("                       <div class=\"text-truncate\">I have the photos that you ordered last month, how\r\n");
      out.write("                           would you like them sent to you?</div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">Jae Chun · 1d</div>\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"dropdown-list-image mr-3\">\r\n");
      out.write("                       <img class=\"rounded-circle\" src=\"/resources/sbadmin2/img/undraw_profile_3.svg\"\r\n");
      out.write("                           alt=\"...\">\r\n");
      out.write("                       <div class=\"status-indicator bg-warning\"></div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div>\r\n");
      out.write("                       <div class=\"text-truncate\">Last month's report looks great, I am very happy with\r\n");
      out.write("                           the progress so far, keep up the good work!</div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">Morgan Alvarez · 2d</div>\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
      out.write("                   <div class=\"dropdown-list-image mr-3\">\r\n");
      out.write("                       <img class=\"rounded-circle\" src=\"https://source.unsplash.com/Mv9hjnEUHR4/60x60\"\r\n");
      out.write("                           alt=\"...\">\r\n");
      out.write("                       <div class=\"status-indicator bg-success\"></div>\r\n");
      out.write("                   </div>\r\n");
      out.write("                   <div>\r\n");
      out.write("                       <div class=\"text-truncate\">Am I a good boy? The reason I ask is because someone\r\n");
      out.write("                           told me that people say this to all dogs, even if they aren't good...</div>\r\n");
      out.write("                       <div class=\"small text-gray-500\">Chicken the Dog · 2w</div>\r\n");
      out.write("                   </div>\r\n");
      out.write("               </a>\r\n");
      out.write("               <a class=\"dropdown-item text-center small text-gray-500\" href=\"#\">Read More Messages</a>\r\n");
      out.write("           </div>\r\n");
      out.write("       </li>\r\n");
      out.write("\r\n");
      out.write("       <div class=\"topbar-divider d-none d-sm-block\"></div>\r\n");
      out.write("\r\n");
      out.write("       <!-- Nav Item - User Information -->\r\n");
      out.write("       <li class=\"nav-item dropdown no-arrow\">\r\n");
      out.write("           <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"userDropdown\" role=\"button\"\r\n");
      out.write("               data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("               <span class=\"mr-2 d-none d-lg-inline text-gray-600 small\">Douglas McGee</span>\r\n");
      out.write("               <img class=\"img-profile rounded-circle\"\r\n");
      out.write("                   src=\"/resources/sbadmin2/img/undraw_profile.svg\">\r\n");
      out.write("           </a>\r\n");
      out.write("           <!-- Dropdown - User Information -->\r\n");
      out.write("            <div class=\"dropdown-menu dropdown-menu-right shadow animated--grow-in\"\r\n");
      out.write("                aria-labelledby=\"userDropdown\">\r\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\">\r\n");
      out.write("                    <i class=\"fas fa-user fa-sm fa-fw mr-2 text-gray-400\"></i>\r\n");
      out.write("                    Profile\r\n");
      out.write("                </a>\r\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\">\r\n");
      out.write("                    <i class=\"fas fa-cogs fa-sm fa-fw mr-2 text-gray-400\"></i>\r\n");
      out.write("                    Settings\r\n");
      out.write("                </a>\r\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\">\r\n");
      out.write("                    <i class=\"fas fa-list fa-sm fa-fw mr-2 text-gray-400\"></i>\r\n");
      out.write("                    Activity Log\r\n");
      out.write("                </a>\r\n");
      out.write("                <div class=\"dropdown-divider\"></div>\r\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#logoutModal\">\r\n");
      out.write("                    <i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>\r\n");
      out.write("                    Logout\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </li>\r\n");
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("\r\n");
      out.write("</nav>\r\n");
      out.write("<!-- End of Topbar -->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
