<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>영화 추가화면</title>
</head>
 
<body>
  <h2>영화가 추가되었습니다.</h2>
 
  <%
    String[] m_name_kor = request.getParameterValues("m_name_kor");
    String[] theater = request.getParameterValues("theater");
    String[] m_time = request.getParameterValues("m_time");
    String[] m_date = request.getParameterValues("m_date");

    if (m_name_kor != null) {

  %>
  <%@ page import = "java.sql.*" %>
  <%
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
      Statement stmt = conn.createStatement();
      String sqlStr;
      int recordUpdated;
      ResultSet rset;
  %>
  <%
      for (int i = 0; i < m_name_kor.length; ++i) {
        sqlStr = "insert into MOVIE_SCHEDULE values(0,'"+m_name_kor[i]+"',"+theater[i]
        +','+m_time[i]+",'"+m_date[i]+"',156)";
        stmt.executeUpdate(sqlStr);
        
  %>
          
  <%    
      }
      stmt.close();
      conn.close();
    }
  %>
  </table>
  <a href="admin.jsp"><h3>ADMIN MAIN</h3></a>
</body>
</html>