<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>MOVIE_ADD</title>
  <link rel="stylesheet"  type="text/css" href="admin_CSS.css" /> 
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
  <!-- from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_buttons_colors -->
  <style>
  .w3-button {width:200px;}
  </style>
</head>
<body>
  <h1>ADMIN MOVIE ADD</h1>
  
  <p class="left_float"><button class="w3-button w3-grey"><a href="admin.jsp">ADMIN_MAIN</a></button></p>
  <p class="left_float"><button class="w3-button w3-grey"><a href="<%= request.getRequestURI() %>">페이지 새로고침</a></button></p>
  <br><br><br><br>

  <form method="post" action="newMovie.jsp">
	영화를 추가할 수 있습니다<br><br>
	<table>
		<tr class="type0"><th>영화제목(한글)	 		</th><th><input type="text" name="m_name_kor"></th></tr>
		<tr class="type0"><th>영화제목(영어)	 		</th><th><input type="text" name="m_name_eng"></th></tr>
		<tr class="type0"><th>러닝타임	 			</th><th><input type="text" name="m_runningtime"></th></tr>
		<tr class="type0"><th>감독	 				</th><th><input type="text" name="m_director"></th></tr>
		<tr class="type0"><th>관람가	 			</th><th><input type="text" name="m_age"></th></tr>
		<tr class="type0"><th>장르	 				</th><th><input type="text" name="m_genre"></th></tr>
		<tr class="type0"><th>배우1	 				</th><th><input type="text" name="m_actor1"></th></tr>
		<tr class="type0"><th>배우2	 				</th><th><input type="text" name="m_actor2"></th></tr>
		<tr class="type0"><th>포스터	 			</th><th><input type="text" name="m_poster"></th></tr>
	</table>

    <input type="submit" value="추가">
  </form>

</body>
</html>