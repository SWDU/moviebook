<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>삭제처리 화면.</title>
</head>
 
<body>
  <h2>선택한 영화가 삭제되었습니다.</h2>
 
  <%
    String[] name = request.getParameterValues("name");
    if (name != null) {
  %>
  <%@ page import = "java.sql.*" %>
  <%
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
      Statement stmt = conn.createStatement(),stmt2 = conn.createStatement(),stmt3 = conn.createStatement();
      String sqlStr;
      int recordUpdated;
      ResultSet rset, rset2;
  %>
  <%
      for (int i = 0; i < name.length; ++i) {

        sqlStr = "SELECT * FROM MOVIE_SCHEDULE WHERE M_NAME_KOR = '" + name[i] +"'";
        rset = stmt.executeQuery(sqlStr);
        while(rset.next()){
          int m_num = rset.getInt("M_NUM");
          sqlStr = "DELETE FROM SEATS WHERE M_NUM ="+m_num;
          stmt2.executeUpdate(sqlStr);
          sqlStr = "DELETE FROM MOVIE_SCHEDULE WHERE M_NUM ="+m_num;
          stmt3.executeUpdate(sqlStr);
        }

        sqlStr = "DELETE FROM MOVIE_INFO WHERE M_NAME_KOR = '" + name[i] +"'";
        recordUpdated = stmt.executeUpdate(sqlStr);
      }
      stmt.close();
      conn.close();
    }
  %>

  <table border=2>
          <tr>
            <th>영화제목(한글)</th>
            <th>영화제목(영어)</th>
            <th>러닝타임</th>
            <th>감독</th>
            <th>관람가</th>
            <th>장르</th>
            <th>배우1</th>
            <th>배우2</th>
            <th>포스터 파일명</th>
          </tr>
  <%
  	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	  "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
	Statement stmt = conn.createStatement();
	String sqlStr;
	int recordUpdated;
	ResultSet rset;

  	sqlStr = "SELECT * FROM MOVIE_INFO";
	rset = stmt.executeQuery(sqlStr);

      while (rset.next()) {
        String m_name_kor = rset.getString("M_NAME_KOR");
  %>
          <tr>
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

  <a href="admin.jsp"><h3>ADMIN_MAIN</h3></a>
</body>
</html>