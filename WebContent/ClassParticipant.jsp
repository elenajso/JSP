<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="application.ApplicationDAO" %>
<%@ page import="application.Application" %>
<%@ page import="tclass.Tclass" %>
<%@ page import="tclass.TclassDAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	#container{
		width: 1200px;
		margin: 0 auto;
		border: none;
	}
	#header{
		text-align: left;
		height: 200px;
		border: 1px solid #E4E5E7;
	}
	#contents{
		width: 888px;
		padding: 20px;
		float: left;
		margin-bottom: 20px;
	}
	#sidebar{
		width: 220px;
		padding: 20px;
		float: left;
		margin-bottom: 20px;
		background: #F5F8FD;
		border: 1px solid #E4E5E7;
	}
	#footer{
		clear: both;
		padding: 20px;
		background: white;
		text-align: center;
	}	
    .SidePhoto{
    	width: 40px; height: 40px;
    	object-fit: cover;
    	border-radius: 50%;
    }
    .menu{
    	text-indent: 20px;
    	line-height:2; 
    }
    .ClassBoard{
    	text-indent: 60px;
    	font-size: 22px;
    	font-weight: bold;
    	margin-top: 60px;
    }
    	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
	</style>
</head>
<body>
	<%
		String ID = null;
		if (session.getAttribute("ID")!=null){
			ID = (String) session.getAttribute("ID");
		}
		int pageNumber= 1; //기본 1페이지
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-default">
			<%
				if(ID==null){
			%>
					<ul>
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="insertForm.jsp">회원가입</a></li>
					</ul>
			<%		
				}else{
			%>
			<ul>
				<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			<%		
				}
			%>
			
	</nav>
	<div id="container">
		<div id="header">
		<%
				TclassDAO tclassDAO = new TclassDAO();
				ArrayList<Tclass> tutoring = tclassDAO.getTclass();
		%>
			<table>
				<tr>
					<td rowspan="3">
			 			<img src="images/title.jpg" style="	float: left; height: 150px; width: 240px; padding: 20px;"/>
  				 	</td>
  				 		<td valign=bottom style="text-indent:20px; font-weight: bold; font-size:20px;">
  				 		<a href="ClassIntroduceTutoring.jsp"><%= tutoring.get(0).getTutoringtitle() %></a></td>
  				 </tr>
  				 <tr>
  				 		<td valign=middle style="text-indent:20px; font-weight: bold; font-size:20px;"><%= tutoring.get(0).getSubject() %></td>
  				 </tr>
  				 <tr> 
  				 		<td valign=top style="text-indent:20px; font-weight: bold; font-size:20px;"><a href="ClassParticipant.jsp#tutor">튜터이름</a></td>
				</tr>
			</table>
		</div>
		<div id="sidebar">
			<div style="text-align: center; border: none;">
				<img src="images/1.jpg" style="	width: 100px; height: 100px; object-fit: cover; border-radius: 50%;"/>
				<h4>Tutor, 튜터이름</h4>
				<address>
					<p style="color: gray;"><img src="images/mail.png" style="width:15px; height:15px;"><%= tutoring.get(0).getID() %></p>
				</address>
			</div>
			<h3 style="border-bottom: 1px solid #ccc;"><a href="ClassParticipant.jsp">참여자 목록</a></h3>
				<p class="menu"><img class='SidePhoto' src="images/1.jpg"><a href="ClassParticipant.jsp#tutor">튜터이름</a></p>
				<p class="menu"><img class='SidePhoto' src="images/1.png"><a href="ClassParticipant.jsp#tutee1">튜티이름</a></p>
				<p class="menu"><img class='SidePhoto' src="images/1.png"><a href="ClassParticipant.jsp#tutee2">튜티이름</a></p>
			<h3 style="border-bottom: 1px solid #ccc;">메뉴</h3>
			<p class="menu"><a href="ClassRoomMain.jsp">강의실 홈</a></p>
			<p class="menu"><a href="ClassBoard.jsp?code=1">공지사항</a></p>
			<p class="menu"><a href="ClassBoard.jsp?code=3">회의록</a></p>
			<p class="menu"><a href="ClassBoard.jsp?code=10">자료실</a></p>
			<p class="menu"><a href="ClassReport.jsp">과제 게시판</a></p>
			<p class="menu"><a href="ClassPetition.jsp">청원</a></p>
			<p class="menu"><a href="ClassReference.jsp">참고 메뉴</a></p>
			<p class="menu"><a href="ClassEvaluation.jsp">튜터링 평가</a></p>
			<p class="menu"><a href="ClassGrade.jsp">튜터링 평점조회</a></p>
		</div>
		
		<div id="contents">

		<h1 style="text-indent: 50px; margin-top: 70px;">참여자 목록</h1>
		<fieldset style="margin-left: 50px; border: 1px solid lightgray;">
			<table style="margin-top:30px; margin-left: 50px;line-height:2; ">
				<tr style="background: #efefef">
					<td style="text-align: center; width: 50px;">번호</td>
					<td style="text-align: center; width: 150px;">이름</td>
					<td style="text-align: center; width: 230px;">이메일</td>
					<td style="text-align: center; width: 150px;">전화번호</td>
					<td style="text-align: center; width: 100px;">역할</td>
				</tr>
				<tr>
					<td style="text-align: center;">1</td>
					<td style="text-align: center;">이름</td>
					<td style="text-indent: 20px;"><%= tutoring.get(0).getID() %></td>
					<td style="text-align: center;">전화번호</td>
					<td style="text-align: center;">tutor</td>
				</tr>
				<%
				ApplicationDAO applicationDAO = new ApplicationDAO();
				ArrayList<Application> list = applicationDAO.getParticipant();
				for(int i=0; i<list.size();i++){
				%>
					<tr>
					<td style="text-align: center;"><%=i+2%></td>
					<td style="text-align: center;">이름</td>
					<td style="text-indent: 20px;"><%= list.get(i).getID() %></td>
					<td style="text-align: center;">전화번호</td>
					<td style="text-align: center;">tutee</td>
				</tr>
				<%
				}
				%>
			</table>
			<fieldset style="margin-top: 50px; margin-left: 150px; height: 250px; width: 520px; background: #efefef; border:1px solid #dddddd;">
			<table>
				<tr>
					<td>
						<img src="images/1.jpg" width="200" height="200" style="margin:30px;" >
					</td>
					<td>
						<h3 style="text-align:center;"><a name="tutor">tutor</a></h3>
						<p>이름 : 이름</p>
						<p>email : <%= tutoring.get(0).getID() %></p>
						<p>phone : 전화번호</p>
					</td>
				</tr>
			</table>
			</fieldset>
			<%
				for(int i=0; i<list.size();i++){
			%>
			<fieldset style="margin-top: 50px; margin-left: 150px; height: 250px; width: 520px; background: #efefef; border:1px solid #dddddd;">
			<table>
				<tr>
					<td>
						<img src="images/1.png" width="200" height="200" style="margin:30px;">
					</td>
					<td>
						<h4 style="text-align:center;"><a name="tutee1">tutee</a></h4>
						<p><a name="tutee1">이름 : 이름</a></p>
						<p>email : <%= list.get(i).getID() %></p>
						<p>phone : 전화번호</p>
					</td>
				</tr>
				</table>
			</fieldset>
		
			<%
				}
			%>
			
			</fieldset>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
</body>
</html>