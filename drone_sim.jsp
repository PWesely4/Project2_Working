<html>
  <head>
    
      <%

        int iCols = Integer.parseInt(request.getParameter("colcount"));
        int iRows = Integer.parseInt(request.getParameter("rowcount"));
      %>

    <style>
      body {
        font-family: "Arial", arial, ans-serif;
      }
    </style>

    <script src="js/jquery.min.js"></script>
    <script src="js/webservice_client.js"></script>
    <script src="js/dronesim.js"></script>

    <script>

      setTiles(<%=iCols%>, <%=iRows%>);

    </script>

  </head>

  <!--<body onload="changeColor();">-->
  <body>

    <br />
    <h2 style="text-align:center;background-color:gray;color:white">DRONE RECON</h2>
    Area ID: <span id="area_id" type="text"><%=request.getParameter("area_id")%></span>
    <br />
    <button onclick="beginDroneSim();">Begin Drone Sim</button>
    <button onclick="stopDroneSim();">Stop Drone Sim</button>

    <br /><br />

    <table style="width:100%;border-style:solid;text-align:center;vertical-align:middle;font-weight:bold;font-size:large">
      <%
          int counter1 = -1;
          while(counter1 < iRows - 1) {
              counter1++;
              int counter2 = -1; // Reset counter2 for each row
      %>
      <tr>
          <%
              while(counter2 < iCols - 1) {
                  counter2++;
                  int y = counter1; // Assign x and y based on row and column indices
                  int x = counter2;
          %>
          <td id="<%= "x" + x + "-y" + y %>" style="height:100;background-color:white">
              <div id="<%= "div-x" + x + "-y" + y %>" style="width: 100px; height: 1px; position: relative;"></div>
              <%= "X:" + x + ",Y:" + y %>
          </td>
          <%
              }
          %>
      </tr>
      <%
          }
      %>
  </table>
  
  </body>
</html>