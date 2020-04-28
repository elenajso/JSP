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
	<% String ctx = request.getContextPath(); %>
	<!-- SmartEditor�� ����ϱ� ���ؼ� ���� js������ �߰� (��� Ȯ��) -->
<script type="text/javascript" src="<%=ctx %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery�� ����ϱ����� jQuery���̺귯�� �߰� -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea���� ������ id�� ��ġ�ؾ� �մϴ�. 
          //SmartEditor2Skin.html ������ �����ϴ� ���
          sSkinURI: "SE2/SmartEditor2Skin.html",  
          htParams : {
              // ���� ��� ���� (true:���/ false:������� ����)
              bUseToolbar : true,             
              // �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
              bUseVerticalResizer : true,     
              // ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //���� ����� ������ text ������ �����ͻ� �ѷ��ְ��� �Ҷ� ���
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //�����ư Ŭ���� form ����
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>
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
			int code = Integer.parseInt(request.getParameter("code"));
		
		if (code==1){
		%>
			<h1 style="text-indent: 50px; margin-top: 70px;">�������� �ۼ�</h1>	
		<%
		}
		%>
		
		<%
		if (code==3){
		%>
			<h1 style="text-indent: 50px; margin-top: 70px;">ȸ�Ƿ� �ۼ�</h1>	
		<%
		}
		%>
		
		<%
		if (code==10){
		%>
			<h1 style="text-indent: 50px; margin-top: 70px;">�ڷ� �ۼ�</h1>	
		<%
		}
		%>
		
		<%
		if (code==2){
		%>
			<h1 style="text-indent: 50px; margin-top: 70px;">���� ����</h1>	
		<%
		}
		%>
		
		<fieldset style="margin-left: 30px; border: 1px solid lightgray;">
		<form name="frm" action="ClassBoardWriteAction.jsp?code=<%=code%>" method="post">
			<table style="margin-top:30px; margin-left:30px;line-height:2; ">
				<tr>
					<td style="background: #efefef; text-align:center;">����</td>
					<td><input type="text" name="title" style="width: 670px; maxlength: 50;"></td>
				</tr>
				<tr>
					<td style="background: #efefef; text-align:center;">����</td>
					<td><textarea cols="97" rows="30" id="ir1" name="contents"></textarea></td>
				</tr>
				<tr>
					<td style="background: #efefef; text-align:center;">÷������</td>
					<td><input type="file"></td>
				</tr>
				<tr>
					<td style="background: #efefef; text-align:center;">÷������</td>
					<td><input type="file"></td>
				</tr>
				<tr>
					<td style="background: #efefef; text-align:center;">÷������</td>
					<td><input type="file"></td>
				</tr>
			</table>
			<p style="text-align: right; margin-right: 50px;">
				<input type="submit" value="�ۼ�" id="save" style="background: white; border: 1px solid black;">
				<input type="button" value="���"  onClick="history.go(-1)" style="background: white; border: 1px solid black;" >
			</p>
			</form>
		</fieldset>
		
		</div>
		</div>
		<div id="footer">
		<p style="text-align:center; ">footer</p>
	</div>
</body>
</html>