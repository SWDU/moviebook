<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
<head>
<link rel="stylesheet"  type="text/css" href="main_style.css" /> 
  <title>MY PAGE</title>
  <center><img src="images/logo_img.png" width="450px">
 <script>
    function closeWin(){
      self.opener = self;
      window.close();
    }
    function refresh(){
      alert("heheh");
    }
 </script>
</head>
 
<body>

<center>
 <hr> <h2>MY PAGE</h2><hr>
 </center>
  <%
     String id =(String)session.getAttribute("id");
     
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
 
    <br/>
    
  <table >
       
  <%
      
        
        sqlStr = "select * from USER WHERE U_ID = '"+id+"'";
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
   

          </table>
         
  <%  
  }
        rset.close();
      
      stmt.close();
      conn.close();
    }
  %>

  
   <form method="post" action="member_withdrawal.jsp">
       <br/><br/><input type="button" onclick="closeWin()" value = "back"/>
        &nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit" value="membership withdrawal" onclick="refresh()" />
    </form>

    
</body>
</html>