<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*, java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onex","root","");
	Statement st = con.createStatement();
	String enr=(String)(session.getAttribute("sess_name"));
	
	ResultSet rs = st.executeQuery("SELECT * FROM scores where enrolment_no = '"+enr+"' and sub_id = '"+request.getParameter("sub_id")+"'");
	while(rs.next()){
		out.println("Printing");
		out.println(rs.getInt(3) + "---" + rs.getInt(4));%><br><%
	}
%>
</body>
</html>