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
 
      String sqlStr = "SELECT * FROM MOVIE_INFO WHERE M_NAME_KOR LIKE ";
	sqlStr += "'%" + title +"%'";
      sqlStr += " ORDER BY M_NAME_KOR ASC";
      
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
      <form method="post" action="movie_delete.jsp">
        <table border=2>
          <tr class="type2">
          	<th><p>선택</p></th>
            <th><p>영화제목(한글)</p></th>
            <th><p>영화제목(영어)</p></th>
            <th><p>러닝타임</p></th>
            <th><p>감독</p></th>
            <th><p>관람가</p></th>
            <th><p>장르</p></th>
            <th><p>배우1</p></th>
            <th><p>배우2</p></th>
            <th><p>포스터 파일명</p></th>
          </tr>
  <%
      int cnt=0;
      while (rset.next()) {
        String name = rset.getString("M_NAME_KOR");
        cnt++;
        cnt%=2;
  %>
          <tr class="type<%=cnt%>">
          	<td><p class="table_value"><input type="radio" name="name" value="<%= name %>"></p></td>
            <td><p class="table_value"><%= rset.getString("M_NAME_KOR") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_NAME_ENG") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_RUNNINGTIME") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_DIRECTOR") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_AGE") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_GENRE") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_ACTOR1") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_ACTOR2") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_POSTER") %></p></td>
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