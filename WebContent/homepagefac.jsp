<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%out.println((String)session.getAttribute("sess_name")); %>
	<form action="questionsfac.jsp" method="post">
		Select subject -
		<input type="radio" name="sub_id" value="1" />AJ
		<input type="radio" name="sub_id" value="2" />WT
		<input type="radio" name="sub_id" value="3" />TOC
		<input type="radio" name="sub_id" value="4" />SE
		<input type="radio" name="sub_id" value="5" />.NET<br>
		<input type="text" name="que" placeholder="Enter the question" width="150" /><br>
		<input type="text" name="op1" placeholder="Enter the option 1" /><br>
		<input type="text" name="op2" placeholder="Enter the option 2" /><br>
		<input type="text" name="op3" placeholder="Enter the option 3" /><br>
		<input type="text" name="op4" placeholder="Enter the option 4" /><br>
		<input type="text" name="corr_op" placeholder="Enter the correct option number" /><br>
		<input type="submit" value="Submit" />
	</form>
	<form action="logout.jsp">
		<input type="submit" value="Logout" />
	</form>
</body>
</html>