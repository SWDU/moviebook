<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>ADMIN</title>
  <link rel="stylesheet"  type="text/css" href="admin_CSS.css" /> 
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
  <!-- from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_buttons_colors -->
  <style>
  .w3-button {width:200px;}
  </style>
</head>
<body>
  <h1>ADMIN MOVIE LIST/DELETE</h1>

  <a href="admin.jsp"><h3>ADMIN_MAIN</h3></a>
  <a href="<%= request.getRequestURI() %>"><h3>페이지 새로고침</h3></a>

  <form method="post">
     영화제목을 입력하여 리스트를 불러오세요.( 이름, 영화번호, 날짜, 상영관 순으로 정렬됩니다.)    <input type="text" name="title"><br>
    <input type="submit" value="검색">
  </form>
 
  <%
    String title = request.getParameter("title");

    if (title != null) {
  %>
  <%
               Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
      Statement stmt = conn.createStatement();
 
      String sqlStr = "SELECT * FROM MOVIE_SCHEDULE WHERE M_NAME_KOR LIKE ";
	sqlStr += "'%" + title +"%'";
      sqlStr += " ORDER BY M_NAME_KOR,M_NUM,M_DATE, THEATER ASC";
      
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
      <form method="post" action="movie_delete.jsp">
        <table border=2>
          <tr>
          	<th>선택</th>
            <th>상영영화번호</th>
            <th>영화제목</th>
            <th>상영관</th>
            <th>상영시간</th>
            <th>상영날짜</th>
            <th>남은 좌석수</th>
          </tr>
  <%
      while (rset.next()) {
        int m_num = rset.getInt("M_NUM");
  %>
          <tr>
          	<td><input type="checkbox" name="m_num" value="<%= m_num %>"></td>
            <td><%= rset.getString("M_NUM") %></td>
            <td><%= rset.getString("M_NAME_KOR") %></td>
            <td><%= rset.getString("THEATER") %></td>
            <td><%= rset.getString("M_TIME") %></td>
            <td><%= rset.getString("M_DATE") %></td>
            <td><%= rset.getString("LEFT_SEAT") %></td>
          </tr>
  <%
      }
  %>
        </table>
        <br>
        <input type="submit" value="삭제">
    </form>
      
  <%
      rset.close();
      stmt.close();
      conn.close();
    }
  %>
</body>
</html>