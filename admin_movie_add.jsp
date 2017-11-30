<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>MOVIE_ADD</title>
</head>
<body>
  <h1>ADMIN MOVIE LIST ADD</h1>
  
  <a href="admin.jsp"><h3>ADMIN_MAIN</h3></a>
  <a href="<%= request.getRequestURI() %>"><h3>페이지 새로고침</h3></a>

  <form method="post">
     찾고자하는 영화를 적어주세요.(한글이름) :    <input type="text" name="title"><br>
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
 
      String sqlStr = "SELECT * FROM MOVIE_INFO WHERE M_NAME_KOR LIKE ";
	sqlStr += "'%" + title +"%'";
      sqlStr += "ORDER BY M_NAME_KOR ASC";
      
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
      <form method="post" action="movie_add.jsp">
        <table border=2>
          <tr>
          	<th>선택</th>
            <th>영화제목(한글)</th>
            <th>영화제목(영어)</th>
            <th>러닝타임</th>
            <th>감독</th>
            <th>관람가</th>
            <th>장르</th>
            <th>배우1</th>
            <th>배우2</th>
            <th>포스터(파일명)</th>
          </tr>
  <%
      while (rset.next()) {
        String m_name_kor = rset.getString("M_NAME_KOR");
  %>
          <tr>
          	<td><input type="radio" name="m_name_kor" value="<%= m_name_kor %>"></td>
            <td><%= rset.getString("M_NAME_KOR") %></td>
            <td><%= rset.getString("M_NAME_ENG") %></td>
            <td><%= rset.getString("M_RUNNINGTIME") %></td>
            <td><%= rset.getString("M_DIRECTOR") %></td>
            <td><%= rset.getString("M_AGE") %></td>
            <td><%= rset.getString("M_GENRE") %></td>
            <td><%= rset.getString("M_ACTOR1") %></td>
            <td><%= rset.getString("M_ACTOR2") %></td>
            <td><%= rset.getString("M_POSTER") %></td>
          </tr>
  <%
      }
  %>
        </table>
        <br>
        상영관 번호: <input type="text" name="theater">
        상영시간 : <input type="text" name="m_time">
        상영날짜 : <input type="text" name="m_date">
        <input type="submit" value="추가">
  <%
      rset.close();
      stmt.close();
      conn.close();
    }
  %>
</body>
</html>