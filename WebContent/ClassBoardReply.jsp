<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="boardreply.Boardreply" %>
<%@ page import="boardreply.BoardreplyDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%	

	String brcontents = request.getParameter("brcontents");
	int code = Integer.parseInt(request.getParameter("code"));
	
	int BoardNumber = 0;
	if (request.getParameter("BoardNumber")!=null){
		BoardNumber = Integer.parseInt(request.getParameter("BoardNumber"));
	}
	
	String ID = null;
	if(session.getAttribute("ID")!=null){
		ID = (String)session.getAttribute("ID");
	}
	
	if(ID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	
	
	}else{
	
					BoardreplyDAO boardreplyDAO = new BoardreplyDAO();
					
					int result = boardreplyDAO.write(ID, brcontents, BoardNumber);
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('댓글 작성에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						%>
						<script>
						location.href = 'ClassBoardView.jsp?code=<%=code%>&BoardNumber=<%=BoardNumber%>';
						</script>
					<%
					}
				}

				
%>
</body>
</html>