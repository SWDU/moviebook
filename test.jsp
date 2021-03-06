<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
session.invalidate();
%>

<html>
    <head>
    <link rel="stylesheet"  type="text/css" href="main_style.css" /> 
        <title> TEAM PROJECT "MOVIE BOOKING WEBSITE" </title>
        
        <script>
            
            
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script type="text/javascript">
            function wrapWindowByMask(){
                // 화면의 높이와 너비를 변수로 만듭니다.
                var maskHeight = $(document).height();
                var maskWidth = $(window).width();
         
                // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
                $('.mask').css({'width':maskWidth,'height':maskHeight});
         
                // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
                $('.mask').fadeIn(1000);
                $('.mask').fadeTo("slow",0.8);
         
                // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
                var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
                var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 5 );
         
                // css 스타일을 변경합니다.
                $('.window').css({'left':left,'top':top, 'position':'absolute'});
         
                // 레이어 팝업을 띄웁니다.
                $('.window').show();
            }
         
            $(document).ready(function(){
                // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
                $('.showMask').click(function(e){
                    // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
                    e.preventDefault();
                    wrapWindowByMask();
                });
         
                // 닫기(close)를 눌렀을 때 작동합니다.
                $('.window .close').click(function (e) {
                    e.preventDefault();
                    $('.mask, .window').hide();
                });
         
                // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
                $('.mask').click(function () {
                    $(this).hide();
                    $('.window').hide();
                });
            });
            function idCheck(){
                var text = $("#user_id").val();
                var regexp = /[0-9a-zA-Z]/;
                for(var i=0; i<text.length; i++){
                    if(text.charAt(i) != " " && regexp.test(text.charAt(i)) == false ){
                        alert("You can only use english");
                        return false;
                    }
                }
                overlapCheck();
            }
    
            function overlapCheck(){
                var param = "user_id" + "=" + $("#user_id").val();
                if($("#user_id").val() == '' || $("#user_id").val()==null)
                {
                    alert("Insert ID");
                    return false;
                }
            }
            function clearText(field){
            if(field.defaultValue == field.value) field.value = '';
            else if(field.value == '') field.value = field.defaultValue;
            }
            function formCheck() {
                var user_id = document.getElementById('user_id');
                var user_name = document.getElementById('user_name');
                var password = document.getElementById('password');
                var password_check = document.getElementById('password_check');
                var hp1 = document.getElementById('hp1'); 
                var hp2 = document.getElementById('hp2'); 
                var hp3 = document.getElementById('hp3'); 
                var agree = document.getElementById('agree'); 
                
                if (user_name.value == '' || user_name.value == null) {
                    alert('Insert NAME');
                    focus.user_name;
                    return false;
                }
                if (user_id.value == '' || user_id.value == null) {
                    alert('Insert ID');
                    focus.user_id;
                    return false;
                }
                
                if (password.value == '' || password.value == null) {
                    alert('Insert PASSWORD');
                    focus.password;
                    return false;
                }
                if (password_check.value == '' || password_check.value == null) {
                    alert('Insert PASSWORD_CHECK');
                    focus.password_hint;
                    return false;
                }
                
                /*비밀번호와 비밀번호확인란 같은지 확인*/
                if (password.value != password_check.value){
                    alert("PASSWORD is different");
                    focus.passowrd;
                    return false;
                }
                /*핸드폰 번호 길이 체크*/
                if(hp2.value.length<=2 || hp3.value.length!=4){
                    alert("Insert Phone number");
                    focus.hp2;
                    return false;
                }
                /*핸드폰이 숫자만 들어가는지 체크*/
                if(isNaN(hp2.value) || isNaN(hp3.value))
                {
                    alert("Ph is only number");
                    return false;
                }
                if(!agree.checked){
                    alert('CHECK Agree');
                    focus.user_name;
                    return false;
                }
                else{
                    
                    save();
                }
            }
            function save() {
                // $('.mask, .window').hide();
                
                alert("Complete");
                document.getElementById('sign_in_form').submit();
            
            }
        </script>
    </head>
    <body>
        <div id="header-title">
            <center><img src="images/logo_img.png" width="450px"></center><br/>

        </div>

        <div id="header-sub"><br/>
            <form method="post" id="login_form" action="main_member.jsp"><hr>
            ID : <input type="text" name="user_id"> PW : <input type="password" name="user_pw">
            <input type="submit" value="SIGN IN" >
            
            <input type="button" value="SIGN UP" class="showMask" onclick="signUpClick()">
            </form><hr>
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
            <div class="window">
            <hr><h3>SIGN UP</h3><hr>
                       <form method="post" id = "sign_in_form" action="member_mypage.jsp">

                               <table   width="500" height="400"  border-left="none"

                                      <tr>
                                              <td align="center" bgcolor="#000">ID</td>
                                              <td><a href="#" target="_blank" onclick="window.open('member_id_check.jsp','pagename','resizable,height=260,width=500'); return false;"><input type="text" id="user_id" name="user_id" value="CLICK TO CHECK_ID" onFocus="clearText(this)" onBlur="clearText(this)"/>
                                             </a>
                                              </td>                                
                                      </tr>
                                      <tr>
                                              <td align="center" bgcolor="#000">PASSWORD</td>
                                              <td><input type="password" id="password" name="password"/></td>
                                      </tr>
                                      <tr>
                                              <td align="center" bgcolor="#000">PASSWORD CHECK</td>
                                              <td><input type="password" id="password_check"/></td>
                                      </tr>
                                      <tr>
                                              <td align="center" bgcolor="#000">NAME</td>
                                              <td><input type="text" id="user_name" name ="user_name" /></td>
                                      </tr>
                                      <tr>
                                              <td align="center" bgcolor="#000">BIRTH</td>
                                               
                     
                                          <td><select name="user_birth_year">
                                                  <option value="1960" selected>1960</option>
                                                  <option value="1961" selected>1961</option>
                                                  <option value="1962" selected>1962</option>
                                                  <option value="1963" selected>1963</option>
                                                  <option value="1964" selected>1964</option>
                                                  <option value="1965" selected>1965</option>
                                                  <option value="1966" selected>1966</option>
                                                  <option value="1967" selected>1967</option>
                                                  <option value="1968" selected>1968</option>
                                                  <option value="1969" selected>1969</option>
                                                  <option value="1970" selected>1960</option>
                                                  <option value="1971" selected>1971</option>
                                                  <option value="1972" selected>1972</option>
                                                  <option value="1973" selected>1973</option>
                                                  <option value="1974" selected>1974</option>
                                                  <option value="1975" selected>1975</option>
                                                  <option value="1976" selected>1976</option>
                                                  <option value="1977" selected>1977</option>
                                                  <option value="1978" selected>1978</option>
                                                  <option value="1979" selected>1979</option>
                                                  <option value="1970" selected>1980</option>
                                                  <option value="1981" selected>1981</option>
                                                  <option value="1982" selected>1982</option>
                                                  <option value="1983" selected>1983</option>
                                                  <option value="1984" selected>1984</option>
                                                  <option value="1985" selected>1985</option>
                                                  <option value="1986" selected>1986</option>
                                                  <option value="1987" selected>1987</option>
                                                  <option value="1988" selected>1988</option>
                                                  <option value="1989" selected>1989</option>
                                                  <option value="1990" selected>1990</option>
                                                  <option value="1991" selected>1991</option>
                                                  <option value="1992" selected>1992</option>
                                                  <option value="1993" selected>1993</option>
                                                  <option value="1994" selected>1994</option>
                                                  <option value="1995" selected>1995</option>
                                                  <option value="1996" selected>1996</option>
                                                  <option value="1997" selected>1997</option>
                                                  <option value="1998" selected>1998</option>
                                                  <option value="1999" selected>1999</option>
                                                  <option value="2000" selected>2000</option>
                                                  <option value="2001" selected>2001</option>
                                                  <option value="2002" selected>2002</option>
                                                  <option value="2003" selected>2003</option>
                                                  <option value="2004" selected>2004</option>
                                                  <option value="2005" selected>2005</option>
                                                  <option value="2006" selected>2006</option>
                                                  <option value="2007" selected>2007</option>
                                                  <option value="2008" selected>2008</option>


                                              </select>
                                              /
                                              <select name="user_birth_month">
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>
                                              </select>
                                              /
                                              <select name="user_birth_day">
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>
                                                  <option value="13">13</option>
                                                  <option value="14">14</option>
                                                  <option value="15">15</option>
                                                  <option value="16">16</option>
                                                  <option value="17">17</option>
                                                  <option value="18">18</option>
                                                  <option value="19">19</option>
                                                  <option value="20">20</option>
                                                  <option value="21">21</option>
                                                  <option value="22">22</option>
                                                  <option value="23">23</option>
                                                  <option value="24">24</option>
                                                  <option value="25">25</option>
                                                  <option value="26">26</option>
                                                  <option value="27">27</option>
                                                  <option value="28">28</option>
                                                  <option value="29">29</option>
                                                  <option value="30">30</option>
                                                  <option value="31">31</option>
                                              </select>
                                              
                                          </td>
                                      
                                      </tr>

                                       <tr>
                                              <td align="center" bgcolor="#000">phone</td>
                                              <td>
                                                     <select id="hp1" name="hp1">
                                                             <option value="010">010</option>
                                                             <option value="011">011</option>
                                                             <option value="016">016</option>
                                                             <option value="017">017</option>
                                                             <option value="019">019</option>
                                                     </select>
                                              &nbsp-&nbsp<input type="text" id="hp2" name="hp2" maxlength="4" size="4" />
                                              &nbsp-&nbsp<input type="text" id="hp3" name="hp3" maxlength="4" size="4" />
                                              </td>
                                      </tr>
                                      
                                      <tr>
                                              <td align="center" bgcolor="#000">mailing</td>
                                              <td>
                                                     <input type="radio" id="ag1" name="yes" checked="checked" />
                                                     <label name="yes" for="ag1">Yes</label>
                                                     <input type="radio" id="ag2" name="yes" />
                                                     <label name="no" for="ag2">No</label>
                                              </td>
                                      </tr>
                                      <tr>
                                              <td align="center" bgcolor="#000">Terms and Conditions</td>
                                              <td>
                                                     <input type="checkbox" id="agree"  />
                                                     <label for="agree">Agree</label>
                                              </td>
                                      </tr>         
                               </table>      
         
                             <br />
                             <input type="button" value="SIGN_IN" onclick="formCheck()" />
                             <input type="reset" value="Reset" />
                             <input type="button" href="#" class="close" value="Close"/>
                       </form>
                 <hr>
 
            </div>
            
      
        </div>
         
      
    </body>
</html>