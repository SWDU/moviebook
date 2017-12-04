<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
	<head>
		<title> TEAM PROJECT "MOVIE BOOKING WEBSITE" </title>
		<style>
			#header-title{
				background-color: red; height: 130px; width: 98%; text-align: right; padding: 1%;
			}
			#header-sub{
				background-color: yellow; height: 100px; width: 100%; text-align: center;
			}
			#content{
				background-color: blue; height: 1000px;	width: 100%; text-align: center;
			}
			#footer{
				background-color: aqua;	height: 100px; width: 100%; text-align: right; display: table;
			}
			#mem-info{
				display: table-cell; vertical-align: middle; padding-right: 30px;
			}
			button.sub{
				width: 200px; height: 50px;	font-size: 18px;
			}
			#content-iframe{
				width: 100%; height: 100%;
			}

			 .setDiv {
            padding-top: 100px;
            text-align: center;
	        }
	        .mask {
	            position:absolute;
	            left:0;
	            top:0;
	            z-index:9999;
	            background-color:#000;
	            display:none;
	        }
	        .window {
	            display: none;
	            background-color: #ffffff;
	            height: 550px;
	            z-index:99999;
	        }
		</style>
		<script>
			function signOutClick(){

     			 location.href = "http://localhost:8080/main.jsp";
				
			}
			
			function myPageClick(){
				alert('myPageClick success!');
				location.href="./member_mypage.jsp?id="+document.getElementById("cur_id");

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
			<center><h1>WELCOME MOVIE BOOKING SITE</h1></center><br/>
			  <%
     String [] id = request.getParameterValues("user_id");
     String [] pwd = request.getParameterValues("user_pw");
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
		  %>
		  
		   <p>ID : <p id="cur_id"><%=rset.getString("U_ID")%></p></p>
		   <p>PW : <%=rset.getString("U_PW")%></p></p>
		   <p>pwd : <%=pwd[t]%></p></p>
		         
		  <%

		    }else{
		   
			
			  response.sendRedirect("http://localhost:8080/main.jsp");
			  
		  	}
		  }else{
		  	response.sendRedirect("http://localhost:8080/main.jsp");
		  }
		  %>
			
			<input type="button" value="SIGN OUT" onclick="signOutClick()">
		<form method="form">
			<input type="button" value="MY PAGE" onclick="myPageClick()" ><br/>
		</form>

		</div>
		<div id="header-sub"><br/>
			<button class="sub" onclick="movieInfo()">MOVIE-INFO</button>&nbsp&nbsp&nbsp&nbsp&nbsp
			<button class="sub" onclick="movieTimeTable()">MOVIE-TIME TABLE</button>&nbsp&nbsp&nbsp&nbsp&nbsp
			<button class="sub" onclick="movieBooking()">MOVIE-BOOKING</button>
		</div>
		<div id="content">
			<iframe id="content-iframe" src="main-content.html" marginwidth="0" marginheight="0" frameborder="0"></iframe>

		</div>
		<div id="footer">
			<div id="mem-info">
			SOFTWARE EXPERIMENT 4 TEAM PROJECT<br/>
			TEAM MEMBER : YESOL KIM, DONGUI KIM, SANGWOOK KIM<br/>
			@COPYRIGHT 2017-12-**
			</div>
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
