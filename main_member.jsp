<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
	<head>
	<link rel="stylesheet"  type="text/css" href="main_style.css" /> 
		<title> TEAM PROJECT "MOVIE BOOKING WEBSITE" </title>

		<script>
			function signOutClick(){

     			 location.href = "http://localhost:8080/main.jsp";
				
			}
			
			function myPageClick(){
				
				
				window.open("./member_mypage_session.jsp", "", "");

			}
			function movieInfo(){
				document.getElementById("content-iframe").src = "main-content.html";
			}
			function movieTimeTable(){
				document.getElementById("content-iframe").src = "booking-page.html";
			}
			function movieBooking(){
				alert('movieBooking success!');
			}
		</script>

		</script>
	</head>
	<body>
		<div id="header-title">
			<center><img src="images/logo_img.png" width="450px"></center><br/>
			  <%
     String [] id = request.getParameterValues("user_id");
     String [] pwd = request.getParameterValues("user_pw");
    session.setAttribute("id", request.getParameter("user_id"));     //파라미터를 받아서 세션값을 설정한다.
	session.setAttribute("password", request.getParameter("user_pw"));   
     int t = id.length-1;
    if (id != null) {
  %>
  <%@ page import = "java.sql.*" %>
  <%
               
               Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/movie_database", "root", "1234qwer"); 
      Statement stmt = conn.createStatement();
      String sqlStr;
      ResultSet rset;
     
       sqlStr = "select * from USER WHERE U_ID = '"+id[t]+"'";
        rset = stmt.executeQuery(sqlStr);

        %>

        <%
      //  if(rset.next()){
         if (rset.next()) {
         if(rset.getString("U_PW").equals(pwd[t])){
         	if(rset.getString("U_ID").equals("admin")){
         	
         		response.sendRedirect("http://localhost:8080/admin.jsp");
         	
         	}
		  %>
		  </div>

		  
		  <%

		    }else{
		  
			response.sendRedirect("http://localhost:8080/main.jsp");
			  
		  	}
		  }else{
		   
		  	response.sendRedirect("http://localhost:8080/main.jsp");
		  }
		  %>
			
			
		
		
		<div id="header-sub"><br/>
		<hr>
		<input type="button" value="SIGN OUT" onclick="signOutClick()">
		
			<input type="button" value="MY PAGE" onclick="myPageClick()" ><hr>
			</div>
			
		<div id="header-subsub"><br/><br/>
			<button style="background: #000000 url(images/img01.jpg) repeat; text-decoration:underline overline white"class="sub" onclick="movieInfo()">MOVIE-INFO</button>&nbsp&nbsp&nbsp&nbsp&nbsp
			<button style="background: #000000 url(images/img01.jpg) repeat;  text-decoration:underline overline white" class="sub" onclick="movieTimeTable()">MOVIE-TIME TABLE</button>&nbsp&nbsp&nbsp&nbsp&nbsp
			<button style="background: #000000 url(images/img01.jpg) repeat;  text-decoration:underline overline white" class="sub" onclick="movieBooking()">MOVIE-BOOKING</button>
		</div>
		<div id="content">
			<iframe id="content-iframe" src="main-content.html" marginwidth="0" marginheight="0" frameborder="0"></iframe>

		</div>
		<div id="footer">
			<p>
			SOFTWARE EXPERIMENT 4 TEAM PROJECT<br/>
			TEAM MEMBER : YESOL KIM, DONGUI KIM, SANGWOOK KIM<br/>
			@COPYRIGHT 2017-12-**
			</p>
		</div>
		<div class="setDiv">
		    
		 
		    <div class="mask"></div>
		    <!--회원가입화면-->
		   
      
		</div>
		 
      <%
        rset.close();
      
      stmt.close();
      conn.close();
         }
  %>
	</body>
</html>
