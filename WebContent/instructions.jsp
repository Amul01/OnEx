<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Instructions</h3>
	<ul>
		<li>This subject consists of 5 questions.</li>
		<li>Each question consists of 5 marks.</li>
		<li>Total time allotted is 3 minutes.</li>
	</ul>
<%	
	int sub_id=Integer.parseInt(request.getParameter("sub_id"));
//out.println(" The subject ID is "+sub_id); 
	session.setAttribute("sub_id", request.getParameter("sub_id"));%>
	<form action="questions.jsp?sub_id=<%=sub_id%>">
		<input type="submit" value="Start test" />
	</form>
	
	<form action="logout.jsp" style="margin-left:85%; margin-top:-15%;">
		<input type="submit" value="Logout" />
	</form>
</body>
</html>