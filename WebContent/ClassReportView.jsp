<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
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
		int BoardNumber = 0;
		if (request.getParameter("BoardNumber")!=null){
			BoardNumber = Integer.parseInt(request.getParameter("BoardNumber"));
		}
		if (BoardNumber ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='ClassBoard.jsp?code='code");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(BoardNumber);
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
		
		<h1 style="text-indent: 50px; margin-top: 70px;">과제 게시판</h1>
		
			<table style="margin-left: 50px; line-height:2; border: 1px solid lightgray;">
					<tr style="text-align: center;">
						<td style="background: #EEEEEE; width: 100px;">과제 제목</td>
						<td colspan="4" style="border-bottom: 1px solid lightgray;"><%=board.gettitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr style="text-align: center;">
						<td style="background: #EEEEEE; width: 100px;">작성일자</td>
						<td style="width: 500px; border-bottom: 1px solid lightgray;"><%=board.getDate().substring(0, 4)%>년 
							<%=board.getDate().substring(6, 7)%>월 
							<%=board.getDate().substring(9, 10)%>일 
							<%=board.getDate().substring(12, 13)%>시 
							<%=board.getDate().substring(15, 16)%>분 
							<%=board.getDate().substring(18, 19)%>초
						</td>
						<td style="background: #EEEEEE; width: 100px;">조회수</td>
						<td style="width: 100px; border-bottom: 1px solid lightgray;"><%=board.getViews() %></td>
					</tr>
					<tr style="text-align: center;">
						<td style="background: #EEEEEE; width: 100px;">과제기간</td>
						<td colspan="4" style="border-bottom: 1px solid lightgray;">2019년 1월 20일부터 ~ 2019년 2월 10일까지</label>
						</td>
					</tr>
					<tr>	
						<td style="text-align: center; background: #EEEEEE;">내용</td>
						<td colspan="4" style="min-height: 100px; text-align:left; text-indent: 20px;"><%=board.getcontents().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
			</table>
			<fieldset style="margin-left: 40px; margin-top: 30px; border:1px solid lightgray;">
			<table style=" line-height:2; border: 1px solid lightgray;">
					<tr>
						<td style=" text-align: center; background: #EEEEEE; width: 100px;">미제출자</td>
						<td colspan="4" style="border-bottom: 1px solid lightgray; text-indent:30px;">김동규</td>
					</tr>
					<tr style="text-align: center;">
						<td rowspan="2" style="background: #EEEEEE; width: 100px;">제출자</td>
						<td style="border-bottom: 1px solid lightgray; width: 110px;">김창성</td>
						<td style="border-bottom: 1px solid lightgray; width: 400px;">과제내용</td>
						<td style="border-bottom: 1px solid lightgray; width: 100px;">2019-02-27</td>
						<td style="border-bottom: 1px solid lightgray; width: 100px;">조회 0</td>
					</tr>
					<tr style="text-align: center;">
						<td style="border-bottom: 1px solid lightgray; width: 110px;">정성옥</td>
						<td style="border-bottom: 1px solid lightgray; width: 400px;">과제내용</td>
						<td style="border-bottom: 1px solid lightgray; width: 100px;">2019-02-27</td>
						<td style="border-bottom: 1px solid lightgray; width: 100px;">조회 0</td>
					</tr>
			</table>
			<div style="text-align: center; margin-top: 20px; margin-left: 50px; margin-right: 50px;">
			<p style="text-align: right;">
				<a href="ClassBoardWrite.jsp" style="background: white; border: 1px solid black;">과제제출</a>
			</p>
			</div>
			</fieldset>			
			<div style="text-align: center; margin-top: 50px; margin-left: 50px; margin-right: 50px;">
				<p style="text-align: right;">
					<%
					if(ID != null && ID.equals(board.getID())){
							
					%>
					<a href="ClassReportUpdate.jsp?BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="ClassBoarddeleteAction.jsp?code=10&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">삭제</a>
					<%
						}
					%>
					<a href="ClassReport.jsp"  style="background: white; border: 1px solid black;">목록</a>
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