
<%@ page import= "java.util.*" %>
<%@ page import= "java.text.*" %>

<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%

	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String bookingNum = formatter.format(new java.util.Date());

	// String uid = request.getParameter("uid");
	String movieName = request.getParameter("movieName");
	String movieDate = request.getParameter("movieDate");
	String movieTime = request.getParameter("movieTime");
	String movieTheater = request.getParameter("movieTheater");
	String bookingSeat = request.getParameter("bookingSeat");
	String moviePoster = request.getParameter("moviePoster");
	String movieAge = request.getParameter("movieAge");

	if(movieAge.equals("0")){
		movieAge = "전체";
	}else{
		movieAge += "세";
	}

	String showTime = movieTime.substring(0,2) + "시 "+ movieTime.substring(3,5) + "분";
	String seats[] = bookingSeat.split(":");


	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_database","root", "qwer1234");

	Statement stmt = conn.createStatement();

%>

<HTML>
	<HEAD>
		<TITLE>예매 완료</TITLE>
	</HEAD>

	<BODY align="center">
		<h1>예매가 완료되었습니다!</h1>
		<table border="1px" width="400px" align="center" style="text-align: center">
			<tr>
				<th>예매 번호</th>
				<td><%=bookingNum%></td>
			</tr>
			<tr>
				<th>상영 일시</th>
				<td><%=movieDate%></td>
			</tr>
			<tr>
				<th>영화</th>
				<td><img src="<%=moviePoster%>" width="100px" height="143px"><br><%=movieName%><br>(<%=movieAge%> 관람가)</td>
			</tr>
			<tr>
				<th>상영시간</th>
				<td><%=showTime%></td>
			</tr>
			<tr>
				<th>상영관</th>
				<td><%=movieTheater%>관</td>
			</tr>
			<tr>
				<th>좌석</th>
				<td>
			<%
				for(int i=0; i<seats.length; i++){
					if(i == seats.length-1){
						out.println(seats[i] +"석");
					}else{
						out.println(seats[i] +"석, ");
					}
				}
			%>
				</td>

			</tr>
		</table>

	</BODY>
</HTML>

