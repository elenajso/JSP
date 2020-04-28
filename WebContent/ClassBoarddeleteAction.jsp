<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="board.BoardDAO" %>
<%@ page import ="board.Board" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	int code= 1;
	if(request.getParameter("code")!=null){
		code = Integer.parseInt(request.getParameter("code"));
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
	}
	
	int BoardNumber = 0;
	if (request.getParameter("BoardNumber") != null){
		BoardNumber = Integer.parseInt(request.getParameter("BoardNumber"));
	}
	if (BoardNumber == 0 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("</script>");
		
		%>
		<script>
		location.href = 'ClassBoard.jsp?code=<%=code%>';
		</script>
		<%
	}
	Board board = new BoardDAO().getBoard(BoardNumber);
	if (!ID.equals(board.getID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("</script>");
		
		%>
		<script>
		location.href = 'ClassBoard.jsp?code=<%=code%>';
		</script>
		<%
	}else{
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.delete(BoardNumber);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				%>
				<script>
				location.href = 'ClassBoard.jsp?code=<%=code%>';
				</script>
				<%			
			}	
	}

%>
</body>
</html>