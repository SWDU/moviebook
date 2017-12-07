<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <link rel="stylesheet"  type="text/css" href="admin_CSS.css" /> 
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
  <!-- from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_buttons_colors -->
  <style>
	.w3-button {width:300px;}
  </style>
  <title>ADMIN</title>
</head>
<body>
  

  <div class="w3-container">
  	<h1>ADMIN WINDOW</h1>
	  <p><button class="w3-button w3-grey"><a href="<%= request.getRequestURI() %>">페이지 새로고침</h3></a></button></p>
	  <p><button class="w3-button w3-red"><a href="admin_user_list.jsp"> 회원 리스트</a></button></p>
	  <p><button class="w3-button w3-pink"><a href="admin_movie_add.jsp"> 영화 스케쥴 추가</a></button></p>
	  <p><button class="w3-button w3-purple"><a href="admin_movie_schedule_management.jsp"> 영화 스케쥴 리스트/삭제</a></button></p>
	  <p><button class="w3-button w3-deep-purple"><a href="admin_new_movie.jsp"> 영화 추가</a></button></p>
	  <p><button class="w3-button w3-indigo"><a href="admin_movie_management.jsp"> 영화 리스트/삭제</a></button></p> 
  </div>

</body>
</html>