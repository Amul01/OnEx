<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*, java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
.hide{
	visibility: hidden;
}
</style>

</head>
<body>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onex","root","");
%>

<%
	//String ques[] = (String[])session.getAttribute("ques");
	int i=0;
	
	out.println(session.getAttribute("ques"));
	out.println(session.getAttribute("indexarray"));
	String ques[]=(String[])session.getAttribute("ques");
	Integer q[]=(Integer[])session.getAttribute("indexarray");
	out.println(Arrays.toString(q));
	out.println(Arrays.toString(ques));
	
	//String ques[]=Arrays.copyOf(session.getAttribute("ques"),session.getAttribute("ques").length,String[].class);
		
	/*String options[][] = (String[][])session.getAttribute("options");
	String corr[] = (String[])session.getAttribute("corr");
	Integer q[] = (Integer[])session.getAttribute("indexarray");
	System.out.println("Hello");
	System.out.println(Arrays.toString(q));
	System.out.println(Arrays.toString(corr));
	System.out.println(Arrays.toString(options));*/
	
	//int i=(int)(Integer)(session.getAttribute("index"));
	%>
	
<%--
<p>Question <%= i+1 %> - </p><%= ques[i] %><br>
<form action="answers.jsp?sub_id=<%=session.getAttribute("sub_id") %>" method="post">
	<%=i %>
	<input type="radio" name=<%=i %> value="1"/> <%= options[i][0] %><br>
	<input type="radio" name=<%= i %> value="2"/> <%= options[i][1] %><br>
	<input type="radio" name=<%= i %> value="3"/> <%= options[i][2] %><br>
	<input type="radio" name=<%= i %> value="4"/> <%= options[i][3] %><br>
	<input class="hide" type="radio" name=<%=i %> value="5" checked/>


<input type="submit" value="Submit" />
</form>
 --%>
 
</body>
</html>