<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="application.ApplicationDAO" %>
<%@ page import="application.Application" %>
<%@ page import="tclass.Tclass" %>
<%@ page import="tclass.TclassDAO" %>
<%@ page import="boardreply.Boardreply" %>
<%@ page import="boardreply.BoardreplyDAO" %>
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
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
			script.println("location.href='ClassBoard.jsp?code='code");
			script.println("</script>");
		}
		int code= 1;
		if(request.getParameter("code")!=null){
			code = Integer.parseInt(request.getParameter("code"));
		}
		Board board = new BoardDAO().getBoard(BoardNumber);
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
		if(code==1){ //�������� �ڵ��� ���
		%>
		<h1 style="text-indent: 50px; margin-top: 70px;">��������</h1>
		<%
		}
		%>
		<%
		if(code==3){ //ȸ�Ƿ� �ڵ��� ���
		%>
		<h1 style="text-indent: 50px; margin-top: 70px;">ȸ�Ƿ�</h1>
		<%
		}
		%>
		<%
		if(code==10){ //�ڷ�� �ڵ��� ���
		%>
		<h1 style="text-indent: 50px; margin-top: 70px;">�ڷ��</h1>
		<%
		}
		%>
		
			<table style="margin-left: 50px; line-height:2; border: 1px solid lightgray;">
					<tr style="text-align: center;">
						<td style="background: #EEEEEE; width: 100px;">�� ����</td>
						<td colspan="5" style="border-bottom: 1px solid lightgray;"><%=board.gettitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr style="text-align: center;">
						<td style="background: #EEEEEE;">�ۼ���</td>
						<td style="width: 200px; border-bottom: 1px solid lightgray;"><%=board.getID() %></td>
						<td style="background: #EEEEEE; width: 100px;">�ۼ�����</td>
						<td style="width: 300px; border-bottom: 1px solid lightgray;"><%=board.getDate().substring(0, 4)%>�� 
							<%=board.getDate().substring(6, 7)%>�� 
							<%=board.getDate().substring(9, 10)%>�� 
							<%=board.getDate().substring(12, 13)%>�� 
							<%=board.getDate().substring(15, 16)%>�� 
							<%=board.getDate().substring(18, 19)%>��
						</td>
						<td style="background: #EEEEEE; width: 100px;">��ȸ��</td>
						<td style="width: 100px; border-bottom: 1px solid lightgray;"><%=board.getViews() %></td>
					</tr>
					<tr>	
						<td style="text-align: center; background: #EEEEEE;">����</td>
						<td colspan="5" style="min-height: 200px; text-align:left; text-indent: 20px;"><%=board.getcontents().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					</tr>
			</table>
			<fieldset style="margin-left: 50px; margin-top: 30px; border:1px solid lightgray;">
			<%
			BoardreplyDAO boardreplyDAO = new BoardreplyDAO();
			ArrayList<Boardreply> replylist = null;
			replylist = boardreplyDAO.getClassBoardReply(BoardNumber);
			int Rcount=0;
			for(int i=0; i<replylist.size();i++){
				Rcount++;
			}
			if(Rcount==0){
		%>
		<fieldset style=" border:0px;">
				<p style="text-align: center; height: 50px; margin-top: 50px; color: gray;">�ۼ��� ����� �����ϴ�.</p>
			</fieldset>
		<%		
			}else{
		%>
			<table style=" line-height:2; border: 1px solid lightgray;">
				<tr>
					<td colspan="3" style="text-align: center; background: #EEEEEE;">���</td>
				</tr>
			<%
			for(int i=0; i<replylist.size();i++){
			%>
				<tr>
					<td style="text-align: center; width: 100px;">�ۼ���</td>
					<td style="border-bottom: 1px solid lightgray; width: 550px; text-indent: 20px;"><%=replylist.get(i).getBRContents() %></td>
					<td style="text-align: center; border-bottom: 1px solid lightgray; width: 200px;"><%=replylist.get(i).getBRDate().substring(0, 11) %></td>	
				</tr>
			<%
				}
			}
			%>	
			</table>
			
			<form action="ClassBoardReply.jsp?code=<%=code %>&BoardNumber=<%=BoardNumber%>" method="post">
			<table style="margin-top:10px;">
				<tr>
					<td colspan="2"><input type="text" name="brcontents" style="width: 800px; height: 150px;"></td>
				</tr>
			</table>		
			<div style="text-align: center; margin-top: 10px; margin-left: 50px; margin-right: 50px;">
				<p style="text-align: right;">
					<input type="submit" value="����ۼ�" id="save" style="background: white; border: 1px solid black;">
				</p>
			</div>
			</form>
			</fieldset>			
			<div style="text-align: center; margin-top: 50px; margin-left: 50px; margin-right: 50px;">
				<p style="text-align: right;">
				
					<%
					if(code==1){ //�������� �ڵ��� ���
						if(ID != null && ID.equals(board.getID())){		
					%>
					<a href="ClassBoardUpdate.jsp?code=1&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">����</a>
					<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href="ClassBoarddeleteAction.jsp?code=1&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">����</a>
					<%
						}
					%>
					<a href="ClassBoard.jsp?code=1"  style="background: white; border: 1px solid black;">���</a>
					<a href="ClassBoardWrite.jsp?code=<%=code %>" style="background: white; border: 1px solid black;">�۾���</a>
					
					<%	
					}
					%>
					<%
					if(code==3){ //ȸ�Ƿ� �ڵ��� ���
						if(ID != null && ID.equals(board.getID())){
							
					%>
					<a href="ClassBoardUpdate.jsp?code=3&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">����</a>
					<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href="ClassBoarddeleteAction.jsp?code=3&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">����</a>
					<%
						}
					%>
					<a href="ClassBoard.jsp?code=3"  style="background: white; border: 1px solid black;">���</a>
					<a href="ClassBoardWrite.jsp?code=<%=code %>" style="background: white; border: 1px solid black;">�۾���</a>
				
					<%	
					}
					%>
					<%
					if(code==10){//�ڷ�� �ڵ��� ���
						if(ID != null && ID.equals(board.getID())){
							
					%>
					<a href="ClassBoardUpdate.jsp?code=10&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">����</a>
					<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href="ClassBoarddeleteAction.jsp?code=10&BoardNumber=<%=BoardNumber%>"  style="background: white; border: 1px solid black;">����</a>
					<%
						}
					%>
					<a href="ClassBoard.jsp?code=10"  style="background: white; border: 1px solid black;">���</a>
					<a href="ClassBoardWrite.jsp?code=<%=code %>" style="background: white; border: 1px solid black;">�۾���</a>
					
					<%	
					}
					%>
				
				</p>			
			</div>
		</div>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
</body>
</html>