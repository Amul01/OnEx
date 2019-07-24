<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
//if(session.getAttribute("sess_enr").toString().equals("")) response.sendRedirect("index.html");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Welcome <%=session.getAttribute("sess_name") %></h3>
	<ul>
		<li><a href="instructions.jsp?sub_id=1">AJ</a></li>
		<li><a href="instructions.jsp?sub_id=2">WT</a></li>
		<li><a href="instructions.jsp?sub_id=3">TOC</a></li>
		<li><a href="instructions.jsp?sub_id=4">SE</a></li>
		<li><a href="instructions.jsp?sub_id=5">.NET</a></li>
	</ul>
	<form action="logout.jsp" style="margin-left:85%; margin-top:-15%;">
		<input type="submit" value="Logout" />
	</form>
	<!-- <ul>
		<li><a href="questions.jsp?sub_id=1">AJ</a></li>
		<li><a href="questions.jsp?sub_id=2">WT</a></li>
		<li><a href="questions.jsp?sub_id=3">TOC</a></li>
		<li><a href="questions.jsp?sub_id=4">SE</a></li>
		<li><a href="questions.jsp?sub_id=5">.NET</a></li>
	</ul> -->
</body>
</html>