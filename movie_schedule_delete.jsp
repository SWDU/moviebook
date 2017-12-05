<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>삭제처리 화면.</title>
</head>
 
<body>
  <h2>선택한 스케쥴이 삭제되었습니다.</h2>
 
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
          <tr>
            <th>상영영화번호</th>
            <th>영화제목</th>
            <th>상영관</th>
            <th>상영시간</th>
            <th>상영날짜</th>
            <th>남은 좌석수</th>
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

      while (rset.next()) {
        int m_num = rset.getInt("M_NUM");
  %>
          <tr>
            <td><%= rset.getString("M_NUM") %></td>
            <td><%= rset.getString("M_NAME_KOR") %></td>
            <td><%= rset.getString("THEATER") %></td>
            <td><%= rset.getString("M_TIME") %></td>
            <td><%= rset.getString("M_DATE") %></td>
            <td><%= rset.getString("LEFT_SEAT") %></td>
          </tr>
  <%
      	}
      	
  %>
        </table>

  <a href="admin.jsp"><h3>ADMIN_MAIN</h3></a>
</body>
</html>