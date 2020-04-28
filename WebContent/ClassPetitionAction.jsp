<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%	
	String one = request.getParameter("alert");
	int alert = Integer.parseInt(one);
	
	String title = request.getParameter("title");
	String text = request.getParameter("text");
	String obj = request.getParameter("obj");
	

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
		UserDAO userDAO = new UserDAO();
		User user = new User();
		
		if(request.getParameter("alert")==null || request.getParameter("title").equals("") 
				|| request.getParameter("text").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					
					int result = userDAO.update(obj, alert);
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('청원글 작성에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('청원글 작성이 완료되었습니다.')");
						script.println("</script>");
						
						%>
						<script>
						location.href = 'ClassPetition.jsp';
						</script>
					<%
					}
				}
	}
				
%>
</body>
</html>