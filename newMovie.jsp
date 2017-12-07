<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>영화 추가화면</title>
  <link rel="stylesheet"  type="text/css" href="admin_CSS.css" /> 
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
  <!-- from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_buttons_colors -->
  <style>
  .w3-button {width:200px;}
  </style>
</head>
 
<body>
  <h2>영화가 추가되었습니다.</h2>
  <p class="left_float"><button class="w3-button w3-grey"><a href="admin.jsp">ADMIN_MAIN</a></button></p>
 
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
</body>
</html>