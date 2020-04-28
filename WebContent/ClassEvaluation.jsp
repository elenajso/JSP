<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
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
<%
/*
회원은 튜터링 강의종료일 일주일 전부터 강의종료일까지 자신이 수강한 튜터링을 한줄코멘트 작성과 함께 친절도, 성실성, 커리큘럼, 재미, 전달력을 각각 점수 매겨 평가할 수 있다.
평가기간이 아닐때 경고알림==> 튜터링 평가 기간이 아닙니다.
*/
%>
		<h1 style="text-indent: 50px; margin-top: 70px;">튜터링 평가</h1>
		<fieldset style="margin-left: 50px; border: 1px solid black;">
			<h3 style="text-align: center; height: 50px; margin-top: 50px;">튜터링기간 동안 고생 많으셨습니다!</h3>
			<ul>
				<li>이 튜터링의 평가기간은 <%= tutoring.get(0).getClass_end_date().substring(0,4)%>년 
				<%= tutoring.get(0).getClass_end_date().substring(6,7)%>월 
				<%= tutoring.get(0).getClass_end_date().substring(9,10)%>일부터 
				<%= tutoring.get(0).getClass_end_date().substring(0,4)%>년 
				<%= tutoring.get(0).getClass_end_date().substring(6,7)%>월 
				 <%= tutoring.get(0).getClass_end_date().substring(9,10)%>일까지 입니다.</li>
				<li>본 튜터링 평가 설문은 튜터링 수업 진행에 대한 튜티들의 솔직한 의견을 파악하여, 앞으로 보다 나은 튜터링을 하기 위한 목적으로 실시하는 것입니다. 따라서 튜티 여러분은 각 평가 문항에 대하여 성실하고 진지하게 답변해 주시기 바랍니다.</li>
				<li>본 조사의 평가척도는 5점으로 구성되어 있으며, 1점은 전혀아니다 5점은 매우 그렇다 를 의미하며, 점수가 클수록 만족도가 높은 것을 의미합니다. 해당란에 체크표 해주십시오.</li>
			</ul>
			<br>
			<hr style="border: dotted;">
			<form action="ClassEvaluationAction.jsp" method="post">
			<table style="margin-top:30px; margin-left: 50px;line-height:2; ">
				<tr>
					<td colspan="5">1. 튜터는 튜티들의 질문을 적절히 수용하였고 친절하게 응답하였습니까?</td>
				</tr>
				<tr>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="5">매우친절</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="4">친절</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="3">보통</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="2">불친절</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="1">매우불친절</label></td>
				</tr>
				<tr>
					<td colspan="5">2. 튜터는 수업준비를 충실히 하고 수업시간을 잘 준수하며 성실하게 튜터링하였습니까?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="sincerity" value="5">매우성실</label></td>
					<td><label><input type="radio" name="sincerity" value="4">성실</label></td>
					<td><label><input type="radio" name="sincerity" value="3">보통</label></td>
					<td><label><input type="radio" name="sincerity" value="2">불성실</label></td>
					<td><label><input type="radio" name="sincerity" value="1">매우불성실</label></td>
				</tr>
				<tr>
					<td colspan="5">3. 이 튜터링의 커리큘럼에 만족하십니까?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="curriculum" value="5">매우만족</label></td>
						<td><label><input type="radio" name="curriculum" value="4">만족</label></td>
					<td><label><input type="radio" name="curriculum" value="3">보통</label></td>
					<td><label><input type="radio" name="curriculum" value="2">불만족</label></td>
					<td><label><input type="radio" name="curriculum" value="1">매우불만족</label></td>
				</tr>
				<tr>
					<td colspan="5">4. 이 튜터링은 얼마나 재미있었습니까?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="interest" value="5">매우재미있음</label></td>
					<td><label><input type="radio" name="interest" value="4">재미있음</label></td>
					<td><label><input type="radio" name="interest" value="3">보통</label></td>
					<td><label><input type="radio" name="interest" value="2">재미없음</label></td>
					<td><label><input type="radio" name="interest" value="1">매우재미없음</label></td>
				</tr>
				<tr>
					<td colspan="5">5. 수업내용은 이해하기 쉬웠으며 효과적으로 전달되었습니까?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="delivery" value="5">매우그렇다</label></td>
					<td><label><input type="radio" name="delivery" value="4">그렇다</label></td>
					<td><label><input type="radio" name="delivery" value="3">보통</label></td>
					<td><label><input type="radio" name="delivery" value="2">그렇지않다</label></td>
					<td><label><input type="radio" name="delivery" value="1">매우그렇지않다</label></td>
				</tr>
				<tr>
					<td colspan="5">6. 이 튜터링에 대한 건의사항이나 개선할 점이 있다면 자유롭게 의견을 제시해 주십시오.</td>
				</tr>
				<tr>
					<td colspan="5"><input type="text" name="coment" placeholder="한줄 평을 간략히 써 주세요." style="width:700px;"></text></td>
				</tr>
			</table>
			
			<p style="text-align: right;">
				<input type="submit" value="제출하기" style="background: white; border: 1px solid black;">
				<input type="button" value="취소"  onClick="history.go(-1)" style="background: white; border: 1px solid black;" >
			</p>
			</form>
			</fieldset>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
	</div>
</body>
</html>