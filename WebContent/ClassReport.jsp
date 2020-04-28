<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="application.ApplicationDAO" %>
<%@ page import="application.Application" %>
<%@ page import="tclass.Tclass" %>
<%@ page import="tclass.TclassDAO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
		<h1 style="text-indent: 50px; margin-top: 70px;">과제게시판</h1>
		<fieldset style="margin-left: 50px; margin-right: 20px; margin-top: 20px; color:red;">
			<%
		
			BoardDAO boardDAO = new BoardDAO();
			ArrayList<Board> list = null;
			list = boardDAO.getClassReport(pageNumber);
			int count=0;
			for(int i=0; i<list.size();i++){
				count++;
			}
			%>
			<p style="text-indent: 10px; color: gray;">총 <%=count%> 개의 과제</p>
			<%
				if(count==0){
			%>
				<fieldset style="margin-left: 50px; border: 1px solid black;">
				<p style="text-align: center; height: 50px; margin-top: 50px; color: gray;">과제가 없습니다.</p>
				</fieldset>
			<%		
				}else{
			%>
	
			<p>	<% Date now = new Date();
 				SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a hh:mm:ss"); 
 				String today = sf.format(now);
				%>
				<%= today %> 기준으로 진행중인 과제가 1개 있습니다.</p>
			<p>[ GUI 계산기 만들어오기 ]</p>
			<p>과제 제출기간이 5일 남았습니다.</p>
		</fieldset>
		<p style="text-align: right; margin-right: 20px;">
		<select size="1" id="class">
				<option value="title">과제제목</option>
				<option value="contents">과제내용</option>
				<option value="titlecontents">제목+내용</option>
				<option value="titlecontents">작성일자</option>
				<option value="titlecontents">과제제출자</option>
			</select>
		<input type="text" id="ClassNotifySearch"><input type="button" value="검색" style="background: white; border: 1px solid black;">
		</p>
			<table style="margin-left: 50px; line-height:2; border: 1px solid lightgray;">
					<tr style="text-align: center; background: #EEEEEE;">
						<td>번호</td>
						<td>과제 제목</td>
						<td>작성일자</td>
						<td>조회수</td>
					</tr>
					<%
					for(int i=0; i<list.size();i++){
					%>
					<tr>
						<td style="text-align: center; width: 100px;"><%= list.get(i).getBoardNumber() %></td>
						<td style="width: 500px; text-indent: 10px;"><a href="ClassReportView.jsp?BoardNumber=<%= list.get(i).getBoardNumber() %>"><%=list.get(i).gettitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
						<td style="text-align: center; width: 100px;"><%= list.get(i).getDate().substring(0,11) %></td>
						<td style="text-align: center; width: 100px;"><%= list.get(i).getViews() %></td>				
					</tr>
					<%
					}
					%>
			</table>
			<%
			}
			%>
			<div style="text-align: center; margin-top: 50px; margin-left: 50px; margin-right: 50px;">
				<%
					if(pageNumber!=1){
				%>
						<a href="ClassBoard.jsp?pageNumber=<%=pageNumber-1 %>" style="background: white; border: 1px solid black;">이전</a>
				<%		
					}
				%>
				<a href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
					
			<%	
				if(boardDAO.nextPage(pageNumber+1)){
			%>
				<a href="CLassBoard.jsp?pageNumber=<%=pageNumber+1 %>" style="background: white; border: 1px solid black;">다음</a>
			<%
				}
			
			%>
			
			
			
			
			<p style="text-align: right;">
			<a href="ClassReportAdd.jsp" style="background: white; border: 1px solid black;">과제추가</a>
			</p>	
			</div>
		</div>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
</body>
</html>