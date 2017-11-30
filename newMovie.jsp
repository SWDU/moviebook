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
    String[] m_name_eng = request.getParameterValues("m_name_eng");
    String[] m_runningtime = request.getParameterValues("m_runningtime");
    String[] m_director = request.getParameterValues("m_director");
    String[] m_age = request.getParameterValues("m_age");
    String[] m_genre = request.getParameterValues("m_genre");
    String[] m_actor1 = request.getParameterValues("m_actor1");
    String[] m_actor2 = request.getParameterValues("m_actor2");
    String[] m_poster = request.getParameterValues("m_poster");

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
        sqlStr = "insert into MOVIE_INFO values('"+m_name_kor[i]+"','"+m_name_eng[i]+"',"+m_runningtime[i]+",'"+m_director[i]+"',"+m_age[i]+",'"+m_genre[i]+"','"
        +m_actor1[i]+"','"+m_actor2[i]+"','"+m_poster[i]+"')";
        
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