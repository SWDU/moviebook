<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!--  -->
<%!
public static String getdate(int mountdate){
   //mountdate = 해당 숫자만큼 더해진 날짜를 반환
   DecimalFormat df = new DecimalFormat("00");
   Calendar calendar = Calendar.getInstance();
 
   calendar.add(calendar.DATE, mountdate);
   String year = Integer.toString(calendar.get(Calendar.YEAR)); //년도를 구한다
   String month = df.format(calendar.get(Calendar.MONTH) + 1); //달을 구한다
   String day = df.format(calendar.get(Calendar.DATE)); //날짜를 구한다
   String date = month + "/" + day; //8자리 숫자★
   return date;
}

// String uid = request.getParameter("");
%>


<!DOCTYPE html>
<html>
    <head>
        <style>
            body {font-family: Arial;}

            /* Style the tab */
            div.tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
            }
            /* Style the buttons inside the tab */
            div.tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            div.tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            div.tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }
        </style>

    </head>
    <body>
        <%
            String date[] = new String[5];

            for(int i = 0; i < 5 ; i ++){
                date[i] = getdate(i);
            }
        %>

        <div class="tab">
            <button id="first" class="tablinks" onclick="openCity(event, '<%=date[0]%>')" value="<%=date[0]%>"><%=date[0]%></button>
            <button class="tablinks" onclick="openCity(event, '<%=date[1]%>')"><%=date[1]%></button>
            <button class="tablinks" onclick="openCity(event, '<%=date[2]%>')"><%=date[2]%></button>
            <button class="tablinks" onclick="openCity(event, '<%=date[3]%>')"><%=date[3]%></button>
            <button class="tablinks" onclick="openCity(event, '<%=date[4]%>')"><%=date[4]%></button>
        </div>

        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_database", "root", "qwer1234");

            Statement stmt = conn.createStatement();
            String sqlStr = "SELECT DISTINCT a.M_NAME_KOR, a.THEATER, a.M_DATE, a.LEFT_SEAT, b.M_AGE, b.M_POSTER FROM MOVIE_SCHEDULE a, MOVIE_INFO b WHERE a.M_NAME_KOR = b.M_NAME_KOR ORDER BY THEATER, M_NAME_KOR ASC";

            ResultSet rset = stmt.executeQuery(sqlStr);

            String m_name[] = new String[20];
            String m_theater[] = new String[20];
            String m_age[] = new String[20];
            String m_date[] = new String[20];
            String m_poster[] = new String[20];
            String m_leftSeat[] = new String[20];
            String temp = "";
            String curDate = "";
            int i = 0;

            while(rset.next()){
                m_name[i] = rset.getString("M_NAME_KOR");
                m_theater[i] = rset.getString("THEATER");
                m_age[i] = rset.getString("M_AGE");
                m_date[i] = rset.getString("M_DATE");
                m_poster[i] = rset.getString("M_POSTER");
                m_leftSeat[i] = rset.getString("LEFT_SEAT");
                i++;
            }
        %>
        <%
            for(int k = 0; k < 5; k ++){
        %>
                <div id="<%=date[k]%>" class="tabcontent">
                    <p>이 페이지는 <%=date[k]%> 영화목록을 보여주는 곳입니다.</p>

        <%
                for(int u = 1; u < 7; u++){
        %>
                    <h2><<%= u%> 관></h2>
        <%
                    for(int j = 0; j < i; j++){
                        curDate = m_date[j].substring(5, m_date[j].length());
                        if((date[k].equals(curDate)) && (u == Integer.parseInt(m_theater[j]))){
        %>
                            <table border="1px" width="100%" align="center" style="text-align: center;">          
                                <tr>
                                    <td width="15%"><img src="<%=m_poster[j]%>" width="100px" height="143px"></td>
                                    <td rowspan="3" style="text-align: left">상영시간<br>
                                        <%
                                            String timeStr = "SELECT DISTINCT M_TIME FROM MOVIE_SCHEDULE WHERE M_NAME_KOR='";
                                            timeStr += m_name[j] + "'" + "AND THEATER='" + m_theater[j] +"' AND M_DATE='2017/" + curDate + "' ORDER BY M_TIME ASC";
                                        %>
                                            <form method="post" action="seat_view.jsp">
                                                <input type="hidden" name="movieName" value="<%=m_name[j]%>"/>
                                                <input type="hidden" name="movieDate" value="<%=m_date[j]%>"/>
                                                <input type="hidden" name="movieTheater" value="<%=m_theater[j]%>"/>
                                                <input type="hidden" name="movieAge" value="<%=m_age[j]%>"/>
                                                <input type="hidden" name="moviePoster" value="<%=m_poster[j]%>"/>

                                        <%
                                            ResultSet r = stmt.executeQuery(timeStr);
                                            while(r.next()){
                                                temp = "";
                                                temp = r.getString("M_TIME");
                                        %>
                                            
                                                <input type="submit" name="movieTime" value="<%=temp%>"/>
                                        <%
                                            }
                                            r.close();
                                        %>
                                            </form>
                                    </td>
                                </tr>
                                <tr>
                                    <td><%=m_name[j]%></td>
                                </tr>
                                <tr>
                                    <%
                                        if(m_age[j].equals("0")){
                                            m_age[j] = "전체";
                                        }else{
                                            m_age[j] += "세";
                                        }
                                    %>
                                    <td><%=m_age[j]%> 관람가</td>
                                </tr>
                            </table>
        <%
                        }
                    }
                }
        %>
                </div>
        <%
            }
            rset.close();
            stmt.close();
            conn.close();
        %>
        <script type="text/javascript">
            var name = document.getElementById("first").value;
            document.getElementById("first").className += " active";
            document.getElementById(name).style.display = "block";
        </script>

    </body>
    <script>
        function openCity(evt, date) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
               tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(date).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>
</html> 
