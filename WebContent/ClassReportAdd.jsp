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
		int pageNumber= 1; //�⺻ 1������
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-default">
			<%
				if(ID==null){
			%>
					<ul>
						<li><a href="login.jsp">�α���</a></li>
						<li><a href="insertForm.jsp">ȸ������</a></li>
					</ul>
			<%		
				}else{
			%>
			<ul>
				<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
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
  				 		<td valign=top style="text-indent:20px; font-weight: bold; font-size:20px;"><a href="ClassParticipant.jsp#tutor">Ʃ���̸�</a></td>
				</tr>
			</table>
		</div>
		<div id="sidebar">
			<div style="text-align: center; border: none;">
				<img src="images/1.jpg" style="	width: 100px; height: 100px; object-fit: cover; border-radius: 50%;"/>
				<h4>Tutor, Ʃ���̸�</h4>
				<address>
					<p style="color: gray;"><img src="images/mail.png" style="width:15px; height:15px;"><%= tutoring.get(0).getID() %></p>
				</address>
			</div>
			<h3 style="border-bottom: 1px solid #ccc;"><a href="ClassParticipant.jsp">������ ���</a></h3>
				<p class="menu"><img class='SidePhoto' src="images/1.jpg"><a href="ClassParticipant.jsp#tutor">Ʃ���̸�</a></p>
				<p class="menu"><img class='SidePhoto' src="images/1.png"><a href="ClassParticipant.jsp#tutee1">ƩƼ�̸�</a></p>
				<p class="menu"><img class='SidePhoto' src="images/1.png"><a href="ClassParticipant.jsp#tutee2">ƩƼ�̸�</a></p>
			<h3 style="border-bottom: 1px solid #ccc;">�޴�</h3>
			<p class="menu"><a href="ClassRoomMain.jsp">���ǽ� Ȩ</a></p>
			<p class="menu"><a href="ClassBoard.jsp?code=1">��������</a></p>
			<p class="menu"><a href="ClassBoard.jsp?code=3">ȸ�Ƿ�</a></p>
			<p class="menu"><a href="ClassBoard.jsp?code=10">�ڷ��</a></p>
			<p class="menu"><a href="ClassReport.jsp">���� �Խ���</a></p>
			<p class="menu"><a href="ClassPetition.jsp">û��</a></p>
			<p class="menu"><a href="ClassReference.jsp">���� �޴�</a></p>
			<p class="menu"><a href="ClassEvaluation.jsp">Ʃ�͸� ��</a></p>
			<p class="menu"><a href="ClassGrade.jsp">Ʃ�͸� ������ȸ</a></p>
		</div>
		<div id="contents">
		<h1 style="text-indent: 50px; margin-top: 70px;">���� ����</h1>
		<fieldset style="margin-left: 50px; border: 1px solid lightgray;">
			<form action="ClassReportAddAction.jsp" method="post">
			<table style="margin-top:30px; margin-left: 50px;line-height:2; ">
				<tr>
					<td style="background: #efefef; width: 110px; text-align:center;">���� ����</td>
					<td colspan="3"><input type="text" name="title" style="width: 550px;"></td>
				</tr>
				<tr>
					<td style="background: #efefef; width: 130px; text-align:center;">���� �Ⱓ</td>
					<td><label><input type="date" id="datestart" name="datestart" style="width: 120px;"></label>
						<label><input type="time" value="00:00" id="timestart" name="timestart" style="width: 100px;">���� ~ </label>
					</td>
					<td><label><input type="date" id="dateend" name="dateend" style="width: 120px;"></label>
						<label><input type="time" value="00:00" id="timeend" name="timeend" style="width: 100px;">����</label>
					</td>
				</tr>
				<tr>
					<td style="background: #efefef; width: 130px; text-align:center;">��������</td>
					<td colspan="3"><input type="text" name="contents" style="width: 550px; height: 150px;"></td>
				</tr>
				<tr>
					<td style="background: #efefef; width: 130px; text-align:center;">÷������</td>
					<td colspan="3"><input type="file"></td>
				</tr>
			</table>
			<p style="text-align: right; margin-right: 70px;">
				<input type="submit" value="���" style="background: white; border: 1px solid black;"></a>
				<input type="button" value="���"  onClick="history.go(-1)" style="background: white; border: 1px solid black;" >
			</p>
			</form>
		</fieldset>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
</body>
</html>