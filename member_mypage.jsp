<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
<head>
<link rel="stylesheet"  type="text/css" href="main_style.css" /> 
  <title>MY PAGE</title>
 
</head>
 
<body>
<center><img src="images/logo_img.png" width="450px"></center>
 <center>
 <hr> <h2>MY PAGE</h2><hr>
 </center>
 
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
     String  birth = yy[k]+mm[k]+dd[k];
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
  %><br/>
  <center>
      <table >
        
  <%
      
        
        sqlStr = "select * from USER WHERE U_ID = '"+id[k]+"'";
        rset = stmt.executeQuery(sqlStr);
        %>

        <%
      //  if(rset.next()){
         while (rset.next()) {
  %>


          <tr>
            <td align="center" bgcolor="#000" >ID</td>
            <td  style="text-align:center; background:#5B5B5B ; width: 250px; padding: 8px 8px; margin-right: 10px;border-radius: 5px;color:white" id="user_id"><%= rset.getString("U_ID") %></td></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#000">NAME</td>
             <td style="text-align:center; background:#5B5B5B ; width: 250px; padding: 8px 8px; margin-right: 10px;border-radius: 5px;color:white"><%= rset.getString("U_NAME") %></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#000">PHONE</td>
           <td style="text-align:center; background:#5B5B5B ; width: 250px; padding: 8px 8px; margin-right: 10px;border-radius: 5px;color:white"><%= rset.getString("U_PHONE") %></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#000">BIRTH</td>
            <td style="text-align:center; background:#5B5B5B ; width: 250px; padding: 8px 8px; margin-right: 10px;border-radius: 5px;color:white"><%= rset.getString("U_BIRTH") %></td>
          <tr>
            <td align="center" bgcolor="#000">BOOKING</td>
            <td style="text-align:center; background:#5B5B5B ; width: 250px; padding: 8px 8px; margin-right: 10px;border-radius: 5px;color:white"><%= rset.getInt("U_BOOKING_CNT") %> times</td>
          </tr>
   
  <%  //  }
  }
        rset.close();
      
      stmt.close();
      conn.close();
    }
  %>

  </table>
  <br/>
  <input type="button" value="back" onclick="location.href='main.jsp' "></center>
</body>
</html>