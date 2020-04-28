<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="evaluation.Evaluation" %>
<%@ page import="evaluation.EvaluationDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%	
	String one = request.getParameter("sincerity");
	String two = request.getParameter("kindness");
	String three = request.getParameter("delivery");
	String four = request.getParameter("curriculum");
	String five = request.getParameter("interest");
	int sincerity = Integer.parseInt(one);
	int kindness = Integer.parseInt(two);
	int delivery = Integer.parseInt(three);
	int curriculum = Integer.parseInt(four);
	int interest = Integer.parseInt(five);
	
	String coment = request.getParameter("coment");
	
	System.out.println(one);
	System.out.println(two);
	System.out.println(three);
	System.out.println(four);
	System.out.println(coment);

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
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		Evaluation evaluation = new Evaluation();
		int result = evaluationDAO.write(ID, kindness, sincerity, curriculum, interest, delivery, coment);
			if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('이미 튜터링평가를 하셨습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('튜터링평가가 완료되었습니다.')");
							script.println("location.href = 'ClassGrade.jsp'");
							script.println("</script>");						
						}
					
				}
				
%>
</body>
</html>