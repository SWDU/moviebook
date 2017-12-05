<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
  <title>영화 스케쥴 추가화면</title>
</head>
 
<body>
  <h2>영화 스케쥴이 추가되었습니다.</h2>
 
  <%
    String[] m_name_kor = request.getParameterValues("m_name_kor");
    String[] theater = request.getParameterValues("theater");
    String[] m_time = request.getParameterValues("m_time");
    String[] m_date = request.getParameterValues("m_date");

    if (m_name_kor != null) {

  %>
  <%@ page import = "java.sql.*" %>
  <%
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "sangwook", "qwer1234"); 
      Statement stmt = conn.createStatement(),stmt2 = conn.createStatement();
      String sqlStr;
      int recordUpdated;
      ResultSet rset;
      int m_num;
  %>
  <%
      for (int i = 0; i < m_name_kor.length; ++i) {
        sqlStr = "insert into MOVIE_SCHEDULE values(0,'"+m_name_kor[i]+"',"+theater[i]
        +','+m_time[i]+",'"+m_date[i]+"',156)";
        stmt.executeUpdate(sqlStr);

        sqlStr = "SELECT M_NUM from MOVIE_SCHEDULE where M_NAME_KOR='"+m_name_kor[i]+"'&&THEATER="+theater[i]
        +"&&M_TIME="+m_time[i]+"&&M_DATE='"+m_date[i]+"'&&LEFT_SEAT=156";
        
        rset = stmt.executeQuery(sqlStr);
        while(rset.next()){
          
          m_num = rset.getInt("M_NUM");

          for(int j=1;j<10;j++){
            for(int k=1;k<10;k++){
              sqlStr = "insert into SEATS values("+m_num+","+theater[i]+","+(10*j+k)+",0)";
              stmt2.executeUpdate(sqlStr);
            }
          }
         }
      }
      stmt.close();
      conn.close();
    }
  %>
  </table>
  <a href="admin.jsp"><h3>ADMIN MAIN</h3></a>
</body>
</html>