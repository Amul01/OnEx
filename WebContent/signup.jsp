<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*, java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
<% 	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onex","root","");
%>

<%
	if(request.getParameter("signup").equals("stu")){
		PreparedStatement ps = con.prepareStatement("SELECT * FROM students where name=(?) and enrolment_no=(?)");
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("enr"));
		ResultSet rs = ps.executeQuery();
		int c=0;
		while(rs.next())c++;
		if(c == 0){
			PreparedStatement ps2 = con.prepareStatement("INSERT INTO students(name,enrolment_no,branch,semester,password,total_score) values (?,?,?,?,?,?)");
			ps2.setString(1, request.getParameter("name"));
			ps2.setString(2, request.getParameter("enr"));
			ps2.setString(3, request.getParameter("branch"));
			ps2.setInt(4, Integer.parseInt(request.getParameter("sem")));
			ps2.setString(5, request.getParameter("pw"));
			ps2.setInt(6,0);
			ps2.execute();
			session.setAttribute("sess_name", request.getParameter("name"));
			session.setAttribute("sess_enr", request.getParameter("enr"));
			response.sendRedirect("homepage.jsp");
		}
		else out.println("Already signed up");
	}
	else {
		PreparedStatement ps = con.prepareStatement("SELECT * FROM faculties where name=(?) and contact_no=(?)");
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("enr"));
		ResultSet rs = ps.executeQuery();
		int c=0;
		while(rs.next())c++;
		if(c == 0){
			PreparedStatement ps2 = con.prepareStatement("INSERT INTO faculties(name,contact_no,password) values (?,?,?)");
			ps2.setString(1, request.getParameter("name"));
			ps2.setString(2, request.getParameter("cno"));
			ps2.setString(3, request.getParameter("pw"));
			ps2.execute();
			session.setAttribute("sess_name", request.getParameter("name"));
			session.setAttribute("sess_cno", request.getParameter("cno"));
			response.sendRedirect("homepagefac.html");
		}
		else out.println("Already signed up");
	}
%>
</body>
</html>