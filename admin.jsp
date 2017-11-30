<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>ADMIN</title>
</head>
<body>
  <h1>ADMIN WINDOW</h1>

  <a href="<%= request.getRequestURI() %>"><h3>페이지 새로고침</h3></a>

  <h3>1. <a href="admin_user_list.jsp"> 회원 리스트</a><h3>
  <h3>2. <a href="admin_movie_add.jsp"> 영화 스케쥴 추가</a><h3>
  <h3>3. <a href="admin_movie_schedule_management.jsp"> 영화 스케쥴 리스트/삭제</a><h3>
  <h3>4. <a href="admin_new_movie.jsp"> 영화 추가</a><h3>
  <h3>5. <a href="admin_movie_management.jsp"> 영화 리스트/삭제</a><h3>
  
</body>
</html>