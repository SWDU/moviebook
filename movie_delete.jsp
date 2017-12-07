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
  <h2>선택한 영화가 삭제되었습니다.</h2>
  <p><button class="w3-button w3-grey"><a href="admin.jsp">ADMIN_MAIN</a></button></p>
 
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
          <tr class="type2">
            <th><p>영화제목(한글)</p></th>
            <th><p>영화제목(영어)</p></th>
            <th><p>러닝타임</p></th>
            <th><p>감독</p></th>
            <th><p>관람가</p></th>
            <th><p>장르</p></th>
            <th><p>배우1</p></th>
            <th><p>배우2</p></th>
            <th><p>포스터 파일명</p></th>
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

      int cnt=0;
      while (rset.next()) {
        String m_name_kor = rset.getString("M_NAME_KOR");
        cnt++;
        cnt%=2;
  %>
          <tr class="type<%=cnt%>">
            <td><p class="table_value"><%= rset.getString("M_NAME_KOR") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_NAME_ENG") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_RUNNINGTIME") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_DIRECTOR") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_AGE") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_GENRE") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_ACTOR1") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_ACTOR2") %></p></td>
            <td><p class="table_value"><%= rset.getString("M_POSTER") %></p></td>
          </tr>
  <%
      	}
      	
  %>
        </table>

</body>
</html>