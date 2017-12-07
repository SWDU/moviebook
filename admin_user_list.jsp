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
  .w3-button {width:300px;}
  </style>
</head>
<body>
  <div class="w3-container">
  <h1>ADMIN WINDOW</h1>

  <p class="left_float"><button class="w3-button w3-grey"><a href="admin.jsp">ADMIN_MAIN</a></button></p>
  <p class="left_float"><button class="w3-button w3-grey"><a href="<%= request.getRequestURI() %>">페이지 새로고침</a></button></p>
  <br>

  <form method="post">
    <p> 찾고자하는 회원 아이디를 적어주세요.<p>
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
 
      String sqlStr = "SELECT * FROM USER WHERE U_ID LIKE ";
	sqlStr += "'%" + title +"%'";
      sqlStr += "ORDER BY U_NUM ASC";
      
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
        <table border=2>
          <tr class="type2">
            <th><p>회원번호</p></th>
            <th><p>아이디</p></th>
            <th><p>비밀번호</p></th>
            <th><p>이름</p></th>
            <th><p>폰번호</p></th>
            <th><p>예매횟수</p></th>
            <th><p>생년월일</p></th>
          </tr>
  <%
      int cnt=0;
      while (rset.next()) {
          cnt++;
          cnt%=2;
  %>
          <tr class="type<%=cnt%>">
            <td><p class="table_value"><%= rset.getString("U_NUM") %></p></td>
            <td><p class="table_value"><%= rset.getString("U_ID") %></p></td>
            <td><p class="table_value"><%= rset.getString("U_PW") %></p></td>
            <td><p class="table_value"><%= rset.getString("U_NAME") %></p></td>
            <td><p class="table_value"><%= rset.getString("U_PHONE") %></p></td>
            <td><p class="table_value"><%= rset.getString("U_BOOKING_CNT") %></p></td>
            <td><p class="table_value"><%= rset.getString("U_BIRTH") %></p></td>
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
</div>
</body>
</html>