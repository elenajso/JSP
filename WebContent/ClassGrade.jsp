<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="application.ApplicationDAO" %>
<%@ page import="application.Application" %>
<%@ page import="tclass.Tclass" %>
<%@ page import="tclass.TclassDAO" %>
<%@ page import="evaluation.Evaluation" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="ChartDirector.*" %>

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
		<h1 style="text-indent: 50px; margin-top: 70px;">평점조회</h1>
		<p style="text-indent: 50px; color: gray;">'<%= tutoring.get(0).getTutoringtitle() %>'의 점수는?</p>
		<div style="text-align:center;">
		
		<%
		Evaluation evaluation = new EvaluationDAO().getEvaluationTotal();
		int TOTALsincerity=evaluation.getSincerity();
		int TOTALkind=evaluation.getKindness();
		int TOTALcurriculum=evaluation.getCurriculum();
		int TOTALinterest=evaluation.getInterest();
		int TOTALdelivery=evaluation.getDelivery();
		
		double[] data = {TOTALsincerity, TOTALkind, TOTALcurriculum, TOTALinterest, TOTALdelivery};

		String[] labels = { "Sincerity", "Kind", "Curriculum", "Interest", "Delivery"};
		String[] Nolabels = { "", "", "", "", ""};
		PolarChart TotalScore = new PolarChart(450, 350);
		TotalScore.setPlotArea(225, 185, 150);
		TotalScore.addAreaLayer(data, 0xffcc00); // Add an area layer to the polar chart
		TotalScore.angularAxis().setLabels(labels); // Set the labels to the angular axis as spokes
		String chart1URL = TotalScore.makeSession(request, "chart1"); // Output the chart
		String imageMap1 = TotalScore.getHTMLImageMap("", "", "title='{label}: score = {value}'"); // Include tool tip for the chart
		%>
		<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>' usemap="#map1" border="0">
		<map name="map1"><%=imageMap1%></map>
		</div>
		<hr color="#dddddd" style="margin-left: 50px;">
		<br>
		<table style="margin-left: 50px; line-height:2;">
			
		<%
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		ArrayList<Evaluation> list = evaluationDAO.getEvaluation();
		int length = list.size();
		double[][] dat = new double[length][5];
		
		for(int i=0; i<length; i++){
			dat[i][0] = list.get(i).getSincerity();
			dat[i][1] = list.get(i).getKindness();
			dat[i][2] = list.get(i).getCurriculum();
			dat[i][3] = list.get(i).getInterest();
			dat[i][4] = list.get(i).getDelivery();
			
			String[] labels2 = { "Sincerity", "Kind", "Curriculum", "Interest", "Delivery"};
			String[] Nolabels2 = { "", "", "", "", ""};
			PolarChart TuteeScore[] = new PolarChart[length];
			TuteeScore[i] = new PolarChart(200, 200);
			TuteeScore[i].setPlotArea(100, 100, 70);
			TuteeScore[i].addAreaLayer(dat[i], 0xccffcc);
			TuteeScore[i].angularAxis().setLabels(Nolabels2);
			String chart1URL2[] = new String[length];
			chart1URL2[i] = TuteeScore[i].makeSession(request, "chart2");
			String imageMap2[] = new String[length];
			imageMap2[i] = TuteeScore[i].getHTMLImageMap("", "", "title='{label}: score = {value}'");
		%>
					<tr>
						<td style="width:110px; text-align: center;"> <!-- 이름이 4글자인 사람을 위해 110으로 맞춤 -->
							<p><img class='SidePhoto' src="images/1.png">튜티이름</p>
						</td>
						<td style="width: 200px; text-align: center;">
		 					<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL2[i])%>' usemap="#map2" border="0">
							<map name="map2"><%=imageMap2[i]%></map>
		
						</td>
						<td style="stext-align: left; width: 300px;"><%=list.get(i).getComent() %></td>
						<td style="text-align: right; width: 100px;"><%=list.get(i).getEvaluation_date().substring(0,11) %></td>
					</tr>
			<%
			}
			%>
			</table>
			<br>
			<hr color="#000080" style="margin-left: 50px;">
		
			</div>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
</body>
</html>