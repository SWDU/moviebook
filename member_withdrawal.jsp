<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<link rel="stylesheet"  type="text/css" href="main_style.css" /> 
  <title>MEMBER WITHDRAW.</title>
   <meta http-equiv="refresh" content="2; url=http://localhost:8080/main.jsp" />
</head>
 
<body>
<center>
  <br/><br/><hr><h2>Membership Withdraw SUCCESS!</h2><hr></center>>
 
  <%
    String id = (String)session.getAttribute("id");
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
     
        sqlStr = "DELETE FROM USER WHERE U_ID = '" + id +"'";
        recordUpdated = stmt.executeUpdate(sqlStr);
      
     
      stmt.close();
      conn.close();
    }
  %>
 
  
 
</body>
</html>