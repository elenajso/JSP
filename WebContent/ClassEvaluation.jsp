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
<%
/*
ȸ���� Ʃ�͸� ���������� ������ ������ ���������ϱ��� �ڽ��� ������ Ʃ�͸��� �����ڸ�Ʈ �ۼ��� �Բ� ģ����, ���Ǽ�, Ŀ��ŧ��, ���, ���޷��� ���� ���� �Ű� ���� �� �ִ�.
�򰡱Ⱓ�� �ƴҶ� ���˸�==> Ʃ�͸� �� �Ⱓ�� �ƴմϴ�.
*/
%>
		<h1 style="text-indent: 50px; margin-top: 70px;">Ʃ�͸� ��</h1>
		<fieldset style="margin-left: 50px; border: 1px solid black;">
			<h3 style="text-align: center; height: 50px; margin-top: 50px;">Ʃ�͸��Ⱓ ���� ��� �����̽��ϴ�!</h3>
			<ul>
				<li>�� Ʃ�͸��� �򰡱Ⱓ�� <%= tutoring.get(0).getClass_end_date().substring(0,4)%>�� 
				<%= tutoring.get(0).getClass_end_date().substring(6,7)%>�� 
				<%= tutoring.get(0).getClass_end_date().substring(9,10)%>�Ϻ��� 
				<%= tutoring.get(0).getClass_end_date().substring(0,4)%>�� 
				<%= tutoring.get(0).getClass_end_date().substring(6,7)%>�� 
				 <%= tutoring.get(0).getClass_end_date().substring(9,10)%>�ϱ��� �Դϴ�.</li>
				<li>�� Ʃ�͸� �� ������ Ʃ�͸� ���� ���࿡ ���� ƩƼ���� ������ �ǰ��� �ľ��Ͽ�, ������ ���� ���� Ʃ�͸��� �ϱ� ���� �������� �ǽ��ϴ� ���Դϴ�. ���� ƩƼ �������� �� �� ���׿� ���Ͽ� �����ϰ� �����ϰ� �亯�� �ֽñ� �ٶ��ϴ�.</li>
				<li>�� ������ ��ô���� 5������ �����Ǿ� ������, 1���� �����ƴϴ� 5���� �ſ� �׷��� �� �ǹ��ϸ�, ������ Ŭ���� �������� ���� ���� �ǹ��մϴ�. �ش���� üũǥ ���ֽʽÿ�.</li>
			</ul>
			<br>
			<hr style="border: dotted;">
			<form action="ClassEvaluationAction.jsp" method="post">
			<table style="margin-top:30px; margin-left: 50px;line-height:2; ">
				<tr>
					<td colspan="5">1. Ʃ�ʹ� ƩƼ���� ������ ������ �����Ͽ��� ģ���ϰ� �����Ͽ����ϱ�?</td>
				</tr>
				<tr>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="5">�ſ�ģ��</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="4">ģ��</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="3">����</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="2">��ģ��</label></td>
					<td style="width:150px;"><label><input type="radio" name="kindness" value="1">�ſ��ģ��</label></td>
				</tr>
				<tr>
					<td colspan="5">2. Ʃ�ʹ� �����غ� ����� �ϰ� �����ð��� �� �ؼ��ϸ� �����ϰ� Ʃ�͸��Ͽ����ϱ�?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="sincerity" value="5">�ſ켺��</label></td>
					<td><label><input type="radio" name="sincerity" value="4">����</label></td>
					<td><label><input type="radio" name="sincerity" value="3">����</label></td>
					<td><label><input type="radio" name="sincerity" value="2">�Ҽ���</label></td>
					<td><label><input type="radio" name="sincerity" value="1">�ſ�Ҽ���</label></td>
				</tr>
				<tr>
					<td colspan="5">3. �� Ʃ�͸��� Ŀ��ŧ���� �����Ͻʴϱ�?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="curriculum" value="5">�ſ츸��</label></td>
						<td><label><input type="radio" name="curriculum" value="4">����</label></td>
					<td><label><input type="radio" name="curriculum" value="3">����</label></td>
					<td><label><input type="radio" name="curriculum" value="2">�Ҹ���</label></td>
					<td><label><input type="radio" name="curriculum" value="1">�ſ�Ҹ���</label></td>
				</tr>
				<tr>
					<td colspan="5">4. �� Ʃ�͸��� �󸶳� ����־����ϱ�?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="interest" value="5">�ſ��������</label></td>
					<td><label><input type="radio" name="interest" value="4">�������</label></td>
					<td><label><input type="radio" name="interest" value="3">����</label></td>
					<td><label><input type="radio" name="interest" value="2">��̾���</label></td>
					<td><label><input type="radio" name="interest" value="1">�ſ���̾���</label></td>
				</tr>
				<tr>
					<td colspan="5">5. ���������� �����ϱ� �������� ȿ�������� ���޵Ǿ����ϱ�?</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="delivery" value="5">�ſ�׷���</label></td>
					<td><label><input type="radio" name="delivery" value="4">�׷���</label></td>
					<td><label><input type="radio" name="delivery" value="3">����</label></td>
					<td><label><input type="radio" name="delivery" value="2">�׷����ʴ�</label></td>
					<td><label><input type="radio" name="delivery" value="1">�ſ�׷����ʴ�</label></td>
				</tr>
				<tr>
					<td colspan="5">6. �� Ʃ�͸��� ���� ���ǻ����̳� ������ ���� �ִٸ� �����Ӱ� �ǰ��� ������ �ֽʽÿ�.</td>
				</tr>
				<tr>
					<td colspan="5"><input type="text" name="coment" placeholder="���� ���� ������ �� �ּ���." style="width:700px;"></text></td>
				</tr>
			</table>
			
			<p style="text-align: right;">
				<input type="submit" value="�����ϱ�" style="background: white; border: 1px solid black;">
				<input type="button" value="���"  onClick="history.go(-1)" style="background: white; border: 1px solid black;" >
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