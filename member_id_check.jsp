<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<link rel="stylesheet"  type="text/css" href="main_style.css" /> 
 <title>ID_CHECK</title>
  <script >

function Close(){
    self.close();   //자기자신창을 닫습니다.
}
</script>

</head>
<body>
 <center>
  <h1>ID_CHECK</h1><hr>
  
  

  <form method="post">
     ID : <input type="text" name="u_id">&nbsp<input type="submit" value="검색">
    
  </form>
 
  <%
    String id = request.getParameter("u_id");

    if (id != null) {
  %>
  <%
               Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "root", "1234qwer"); 
      Statement stmt = conn.createStatement();
 
      String sqlStr = "SELECT * FROM USER WHERE U_ID = ";
  sqlStr += "'" + id +"'";
      sqlStr += "ORDER BY U_ID ASC";
      
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
      
       
  <%
      if (rset.next()) {
        
 
  %>
      <p style="color:white;"> you can not  use '<%= rset.getString("U_ID") %>'</p>
           
          
  <%
      }else{
   %>
      <p style="color:white;"> you can use <%="'"+ id+"'"%></p>
      <input type="button" value="USE" onclick="Close()"/>

  <%
      }
  %>
        </table>
      
  <%
      rset.close();
      stmt.close();
      conn.close();
    }
  %>
  </center>
</body>
</html>