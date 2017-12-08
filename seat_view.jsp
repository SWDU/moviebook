<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	// String uid = request.getParameter("uid");
	String movieName = request.getParameter("movieName");
	String movieDate = request.getParameter("movieDate");
	String movieTime = request.getParameter("movieTime");
	String movieTheater = request.getParameter("movieTheater");
	String moviePoster = request.getParameter("moviePoster");
	String movieAge = request.getParameter("movieAge");


%>

<HTML>
	<title>좌석선택</title>
	<style type="text/css">
		.green { background-color: green; font-color: white; }
		.white { background-color: white; font-color: black; }
		.btn {
			width: 100px; height: 50px;
		}
		#screen {
			align-content: center;
			background-color: #cccccc;
			width: 400px;
			height: 30px;
		}
	</style>
	<script type="text/javascript">
		function changeColor_seat(cell){
			if(cell.className == "white"){
				cell.className = "green";
				return 1;
			}else if(cell.className == "green"){
				cell.className = "white";
				return -1;
			}
		}
		function changeColor_num(rows, cell){
			for(var i = 1; i <= 8 ; i ++){
				rows.cells[i].className = "white";
			}
			cell.className = "green";
			return parseInt(cell.innerHTML);
		}
		function bookingSuccess(peopleNum, seatCnt){
			if(peopleNum == 0){
				alert('인원수와 좌석을 선택해 주세요.');
				return false;
			}
			if(peopleNum != seatCnt){
				alert('좌석을 더 선택해 주세요.');
				return false;
			}
			var table = document.getElementById("seats");
			var re = "";
			for (var i = 0; i < table.rows.length; i++) {
		        for (var j = 0; j < table.rows[i].cells.length; j++) {
		        	if(table.rows[i].cells[j].className == "green"){
		        		re += table.rows[i].cells[j].innerHTML + ":";
		        	}
		        }
		    }
		    if(re == ""){
		    	alert('인원수와 좌석을 선택해 주세요.');
		    	return false;
		    }else{
		    	alert('여기들어옴');
		    	document.getElementById("seat").value = re;
		    	return true;
		    }
		}
		function resetSeat(){
			var table = document.getElementById("seats");
			for (var i = 0; i < table.rows.length; i++) {
		        for (var j = 0; j < table.rows[i].cells.length; j++) {
		        	table.rows[i].cells[j].className = "white";
		        }
		    }
		}
	</script>
	<BODY>
		<center><h1> 예매 - 좌석 선택 </h1>
		<br/>

		<table style="text-align: center">
			<tr>
				<th>상영날짜</th><th>영화제목</th><th>상영시간</th>
			</tr>
			<tr>
				<td width="150px"><%=movieDate%></td><td width="250px"><%=movieName%></td><td width="150px"><%=movieTime%></td>
			</tr>
		</table></center>
		<br/><br/>
		<table id="number" border="1px" align="center">
			<tr>
				<td width="100px" align="center">인원수</td>
				<%
					for(int i=1; i<9; i++){
				%>
						<td class="white" width="50px" align="center"><%= i%></td>
				<%
					}
				%>
			</tr>
		</table>
		<br/><br/>
		<center><div id="screen">screen</div></center><br/>
		<table id="seats" border="1px" align="center">
			<%
				for(int i = 1; i < 10 ; i ++){
			%>
				<tr>
			<%
					for(int j = 1 ; j < 10 ; j ++) {
			%>
						<td class="white" width="50px" height="30px" align="center"><%= i*10+j %></td>
			<%
					}
			%>
				</tr>
			<%
				}
			%>
		</table>
		<br/><br/>
		<center>
			<form method="post" action="booking_success.jsp" onsubmit="return bookingSuccess(num_flag, seat_cnt)">
				<input type="hidden" name="movieName" value="<%=movieName%>"/>
				<input type="hidden" name="movieDate" value="<%=movieDate%>"/>
				<input type="hidden" name="movieTime" value="<%=movieTime%>"/>
				<input type="hidden" name="movieTheater" value="<%=movieTheater%>"/>
				<input type="hidden" name="movieAge" value="<%=movieAge%>"/>
				<input type="hidden" name="moviePoster" value="<%=moviePoster%>"/>

				<input id="seat" type="hidden" name="bookingSeat" value=""/>

				<input class="btn" type="submit" value="예매 완료"/>
				<input class="btn" type="button" value="뒤로가기" onclick="location='./booking_page.jsp'"/>
			</form>
		</center>
		<script>
			var num_flag = 0;
			var seat_cnt = 0;

			var table_num = document.getElementById("number");
			for(var k = 0; k < table_num.rows[0].cells.length; k++){
				table_num.rows[0].cells[k].onclick = function(){
					num_flag = changeColor_num(table_num.rows[0], this);
					if(num_flag < seat_cnt){
						alert('좌석을 다시 선택해 주세요.');
						resetSeat();
						seat_cnt = 0;
					}
				}
			}
			var table_seats = document.getElementById("seats");
			if (table_seats != null) {
			    for (var i = 0; i < table_seats.rows.length; i++) {
			        for (var j = 0; j < table_seats.rows[i].cells.length; j++)
				        table_seats.rows[i].cells[j].onclick = function () {
							if(num_flag > seat_cnt){
								seat_cnt += changeColor_seat(this);
							}else{
								if(this.className == "green"){
									seat_cnt += changeColor_seat(this);
								}else{
									if(num_flag == 0){
										alert('인원수를 선택해 주세요.');
									}else{
										alert('인원수를 더 늘려주세요.');
									}
								}	
							}
				        }
			    }
			}
		</script>
	</BODY>
</HTML>

