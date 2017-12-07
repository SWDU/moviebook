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
  <h1>ADMIN MOVIE SCHEDULE LIST/DELETE</h1>

  <p class="left_float"><button class="w3-button w3-grey"><a href="admin.jsp">ADMIN_MAIN</a></button></p>
  <p class="left_float"><button class="w3-button w3-grey"><a href="<%= request.getRequestURI() %>">페이지 새로고침</a></button></p>
  <br>

  <form method="post">
    <p>영화제목을 입력하여 리스트를 불러오세요.( 이름, 영화번호, 날짜, 상영관 순으로 정렬됩니다.)</p>
    <input class="left_float" type="text" name="title">
    <input class="left_float" type="submit" value="검색">
    <br><br>
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
      <form method="post" action="movie_schedule_delete.jsp">
        <table border=2>
          <tr class="type2">
          	<th><p>선택</p></th>
            <th><p>상영영화번호</p></th>
            <th><p>영화제목</p></th>
            <th><p>상영관</p></th>
            <th><p>상영시간</p></th>
            <th><p>상영날짜</p></th>
            <th><p>남은 좌석수</p></th>
          </tr>
  <%
      int cnt=0;
      while (rset.next()) {
        int m_num = rset.getInt("M_NUM");
        cnt++;
        cnt%=2;
  %>
          <tr class="type<%=cnt%>">
          	<td><p class="table_value"><input type="checkbox" name="m_num" value="<%= m_num %>"></p></td>
            <td><p class="table_value"><%= rset.getString("M_NUM") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_NAME_KOR") %></p></td>
            <td><p class="table_value"><%= rset.getString("THEATER") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_TIME") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_DATE") %></p></td>
            <td><p class="table_value"><%= rset.getString("LEFT_SEAT") %></p></td>
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