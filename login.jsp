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


<% String enr = request.getParameter("enr"); %>
<jsp:useBean id="userdata" class="data"></jsp:useBean>
<jsp:setProperty name="userdata" property="enr" value=${userdata.enr} />


<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onex","root","");
%>
	
<%
	if(request.getParameter("login").equals("stu")){
		session.setAttribute("sess_name", request.getParameter("enr"));
		PreparedStatement ps = con.prepareStatement("SELECT * FROM students where enrolment_no=(?) and password=(?)");
		ps.setString(1, request.getParameter("enr"));
		ps.setString(2, request.getParameter("pw"));
		ResultSet rs = ps.executeQuery();
		
		int c=0;
		while(rs.next())c++;
		if(c == 1){
			out.println("Welcome " + request.getParameter("name"));
			response.sendRedirect("homepage.html");
		}
		else out.println("Invalid login credentials");
	}
	else {
		session.setAttribute("sess_name", request.getParameter("cno"));
		PreparedStatement ps = con.prepareStatement("SELECT * FROM faculties where contact_no=(?) and password=(?)");
		ps.setString(1, request.getParameter("cno"));
		ps.setString(2, request.getParameter("pw"));
		ResultSet rs = ps.executeQuery();
		
		int c=0;
		while(rs.next())c++;
		if(c == 1){
			out.println("Welcome " + request.getParameter("name"));
			response.sendRedirect("homepagefac.html");
		}
		else out.println("Invalid login credentials");
	}
%>
</body>
</html>