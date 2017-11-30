<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>MOVIE_ADD</title>
</head>
<body>
  <h1>ADMIN MOVIE ADD</h1>
  
  <a href="admin.jsp"><h3>ADMIN_MAIN</h3></a>
  <a href="<%= request.getRequestURI() %>"><h3>페이지 새로고침</h3></a>

  <form method="post" action="newMovie.jsp">
	영화를 추가할 수 있습니다<br>
	영화제목(한글) : 	<input type="text" name="m_name_kor"><br>
	영화제목(영어) : 	<input type="text" name="m_name_eng"><br>
	러닝타임 : 	<input type="text" name="m_runningtime"><br>
	감독 : 	<input type="text" name="m_director"><br>
	관람가 : 	<input type="text" name="m_age"><br>
	장르 : 	<input type="text" name="m_genre"><br>
	배우1 : 	<input type="text" name="m_actor1"><br>
	배우2 : 	<input type="text" name="m_actor2"><br>
	포스터 : 	<input type="text" name="m_poster"><br>

    <input type="submit" value="추가">
  </form>

</body>
</html>