<html>
  <%@ page import="com.dronerecon.ws.AreaGridTile" %>
  <%@ page import="com.dronerecon.ws.DBManager" %>
  <%@ page import="java.util.ArrayList" %>
  <%
    String area_id = request.getParameter("area_id");
      %>

  <%    
  DBManager oDBManager = new DBManager();
  oDBManager.DBLocation = System.getProperty("catalina.base") + "\\webapps\\dronereconportal\\db\\" + oDBManager.DBLocation;
  ArrayList<AreaGridTile> array1 = oDBManager.readAreaGridTiles(area_id);
  %>
  <%
  int x = 0;
  int highest_red_val = -1;
  int highest_green_val = -1;

  int highest_red_xval = -1;
  int highest_red_yval = -1;

  int highest_green_xval = -1;
  int highest_green_yval = -1;

  while(x <array1.size()) {
    
    if(array1.get(x).g > highest_green_val) {
      highest_green_val = array1.get(x).g;
      highest_green_xval = array1.get(x).x;
      highest_green_yval = array1.get(x).y;
    }
    if(array1.get(x).r > highest_red_val) {
      highest_red_val = array1.get(x).r;
      highest_red_xval = array1.get(x).x;
      highest_red_yval = array1.get(x).y;
    }
    x++;
  }
  %>
<body>
  <p>The location of the highest red (<%=highest_red_val%>): <%=highest_red_xval%>, <%=highest_red_yval%></p>
  <p>The location of the highest green (<%=highest_green_val%>): <%=highest_green_xval%>, <%=highest_green_yval%></p>
</body>
</html>