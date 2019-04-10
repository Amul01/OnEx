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
%>

<%
	String sub_name;
	int sub_id=Integer.parseInt(request.getParameter("sub_id"));
	if(sub_id==1)sub_name="AJ";
	else if(sub_id==2)sub_name="WT";
	else if(sub_id==3)sub_name="TOC";
	else if(sub_id==4)sub_name="SE";
	else sub_name=".NET";
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO data(sub_id,sub_name,question,op1,op2,op3,op4,op5,correct_option) values (?,?,?,?,?,?,?,?,?)");
	ps.setInt(1, sub_id);
	ps.setString(2, sub_name);
	ps.setString(3, request.getParameter("que"));
	ps.setString(4, request.getParameter("op1"));
	ps.setString(5, request.getParameter("op2"));
	ps.setString(6, request.getParameter("op3"));
	ps.setString(7, request.getParameter("op4"));
	ps.setString(8, "+");
	ps.setString(9, request.getParameter("corr_op"));
	ps.execute();
	
	response.sendRedirect("homepagefac.html");
%>
</body>
</html>