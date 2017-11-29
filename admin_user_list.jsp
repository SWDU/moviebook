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

  <a href="admin.jsp"><h3>ADMIN_MAIN</h3></a>
  <a href="<%= request.getRequestURI() %>"><h3>페이지 새로고침</h3></a>

  <form method="post">
     찾고자하는 회원 아이디를 적어주세요. :    <input type="text" name="title"><br>
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
 
      String sqlStr = "SELECT * FROM USER WHERE U_ID LIKE ";
	sqlStr += "'%" + title +"%'";
      sqlStr += "ORDER BY U_NUM ASC";
      
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
        <table border=2>
          <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>폰번호</th>
            <th>예매횟수</th>
            <th>생년월일</th>
          </tr>
  <%
      while (rset.next()) {
        
  %>
          <tr>
            <td><%= rset.getString("U_NUM") %></td>
            <td><%= rset.getString("U_ID") %></td>
            <td><%= rset.getString("U_PW") %></td>
            <td><%= rset.getString("U_NAME") %></td>
            <td><%= rset.getString("U_PHONE") %></td>
            <td><%= rset.getString("U_BOOKING_CNT") %></td>
            <td><%= rset.getString("U_BIRTH") %></td>
          </tr>
  <%
      }
  %>
        </table>
        <br>
      
  <%
      rset.close();
      stmt.close();
      conn.close();
    }
  %>
</body>
</html>