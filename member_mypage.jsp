<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
<head>
  <title>MY PAGE</title>
 
</head>
 
<body>
  <h2>MY PAGE</h2>
 
  <%
     String [] id = request.getParameterValues("user_id");
     String [] pwd = request.getParameterValues("password");
     String [] name = request.getParameterValues("user_name");
     String [] hp1 = request.getParameterValues("hp1");
     String [] hp2 = request.getParameterValues("hp2");
     String [] hp3 = request.getParameterValues("hp3");
    
     String [] yy = request.getParameterValues("user_birth_year");
     String [] mm = request.getParameterValues("user_birth_month");
     String [] dd = request.getParameterValues("user_birth_day");
     int k = id.length-1;
     String  hp = hp1[k]+"-"+hp2[k]+"-"+hp3[k];
     String  birth = yy[k]+"/"+mm[k]+"/"+dd[k];
    if (id != null) {
  %>
  <%@ page import = "java.sql.*" %>
  <%
               
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "root", "1234qwer"); 
      Statement stmt = conn.createStatement();
      String sqlStr;
      String sql;
      ResultSet rset;
     %>
  <%
     // for (int i = 0; i < id.length; ++i) {
     
   
       
    sqlStr = "select * from USER WHERE U_ID = '"+id[k]+"'";
    rset = stmt.executeQuery(sqlStr);
    if(rset.next()){}
    else{

     sql = "INSERT INTO USER VALUES(0,'"+id[k]+"','"+pwd[k]+"','"+name[k]+"','"+hp+"',0,'"+birth+"')";
     stmt.executeUpdate(sql);
    }
        
  %>
          
  <%    
    //  }
  %>
      <table border=2>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>PHONE</th>
          <th>BIRTH</th>
          <th>BOOKING</th>
        </tr>
  <%
      
        
        sqlStr = "select * from USER WHERE U_ID = '"+id[k]+"'";
        rset = stmt.executeQuery(sqlStr);
        %>

        <%
      //  if(rset.next()){
         while (rset.next()) {
  %>
  
   
          <tr>
            <td id="user_id"><%= rset.getString("U_ID") %></td></td>
            <td><%= rset.getString("U_NAME") %></td>
            <td><%= rset.getString("U_PHONE") %></td>
            <td><%= rset.getString("U_BIRTH") %></td>
            <td><%= rset.getInt("U_BOOKING_CNT") %> times</td>
          </tr>
  <%  //  }
  }
        rset.close();
      
      stmt.close();
      conn.close();
    }
  %>

  </table>
  <form method="post" action="member_withdrawal.jsp">
    <input type="text" name="user_id"/>
    <input type="submit" value="membership withdrawal"  " />
  </form>
  <a href="main.jsp"><h3>BACK</h3></a>
</body>
</html>