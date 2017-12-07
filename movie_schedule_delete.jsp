<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>삭제처리 화면.</title>
  <link rel="stylesheet"  type="text/css" href="admin_CSS.css" /> 
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
  <!-- from https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_buttons_colors -->
  <style>
  .w3-button {width:200px;}
  </style>
</head>
 
<body>
  <h2>선택한 스케쥴이 삭제되었습니다.</h2>
  <p><button class="w3-button w3-grey"><a href="admin.jsp">ADMIN_MAIN</a></button></p>
 
  <%
    String[] m_nums = request.getParameterValues("m_num");
    if (m_nums != null) {
  %>
  <%@ page import = "java.sql.*" %>
  <%
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
      Statement stmt = conn.createStatement(), stmt2 = conn.createStatement();
      String sqlStr;
      int recordUpdated;
      ResultSet rset;
  %>
  <%
      for (int i = 0; i < m_nums.length; ++i) {
        sqlStr = "SELECT * FROM SEATS WHERE M_NUM="+m_nums[i];
        rset = stmt.executeQuery(sqlStr);
        while(rset.next()){
          int m_num = rset.getInt("M_NUM");
          sqlStr = "DELETE FROM SEATS WHERE M_NUM="+m_num;
          stmt2.executeUpdate(sqlStr);
        }

        sqlStr = "DELETE FROM MOVIE_SCHEDULE WHERE M_NUM = " + m_nums[i];
        recordUpdated = stmt.executeUpdate(sqlStr);
      }
      stmt.close();
      conn.close();
    }
  %>

  <table border=2>
          <tr class="type2">
            <th><p>상영영화번호</p></th>
            <th><p>영화제목</p></th>
            <th><p>상영관</p></th>
            <th><p>상영시간</p></th>
            <th><p>상영날짜</p></th>
            <th><p>남은 좌석수</p></th>
          </tr>
  <%
  	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	  "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
	Statement stmt = conn.createStatement();
	String sqlStr;
	int recordUpdated;
	ResultSet rset;

  	sqlStr = "SELECT * FROM MOVIE_SCHEDULE";
	rset = stmt.executeQuery(sqlStr);

      int cnt=0;
      while (rset.next()) {
        cnt++;
        cnt%=2;
        int m_num = rset.getInt("M_NUM");
  %>
          <tr class="type<%=cnt%>">
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
</body>
</html>