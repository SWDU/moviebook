<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>MEMBER WITHDRAW.</title>
   <meta http-equiv="refresh" content="2; url=http://localhost:8080/main.jsp" />
</head>
 
<body>
  <h2>Membership Withdraw SUCCESS!</h2>
 
  <%
    String[] id = request.getParameterValues("user_id");
    if (id != null) {
  %>
  <%@ page import = "java.sql.*" %>
  <%
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "root", "1234qwer"); 
      Statement stmt = conn.createStatement();
      String sqlStr;
      int recordUpdated;
      ResultSet rset;
  %>
  <%
      String id_str;
      for (int i = 0; i < id.length; ++i) {
        id_str = id[i];
        sqlStr = "DELETE FROM USER WHERE U_ID = '" + id[i] +"'";
        recordUpdated = stmt.executeUpdate(sqlStr);
      }
     
      stmt.close();
      conn.close();
    }
  %>
 
  
  <a href="main.jsp"><h3>MAIN</h3></a>
</body>
</html>