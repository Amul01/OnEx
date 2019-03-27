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
	Statement st = con.createStatement();
	String query = "SELECT * FROM data where sub_id = '"+request.getParameter("sub_id")+"'";
	ResultSet rs = st.executeQuery(query);
	//ArrayList<String> que = new ArrayList<>();
	String ques[]=new String[5];
	String options[][]=new String[5][4];
	String corr[]=new String[5];
	int i=0;
	Integer q[]=new Integer[5];
	for(i=0;i<5;i++)q[i]=i;
	Collections.shuffle(Arrays.asList(q));
	out.println(Arrays.toString(q));
	i=0;
	while(rs.next()){
		ques[q[i]]=rs.getString(4);//que.add(rs.getString(i));
		options[q[i]][0]=rs.getString(5);
		options[q[i]][1]=rs.getString(6);
		options[q[i]][2]=rs.getString(7);
		options[q[i]][3]=rs.getString(8);
		corr[q[i]]=rs.getString(10);
		i++;
	}
	con.close();
	
	session.setAttribute("index", 0);
	session.setAttribute("ques", ques);
	session.setAttribute("ques", options);
	session.setAttribute("corr", corr);
	session.setAttribute("indexarray", q);
	session.setAttribute("sub_id", request.getParameter("sub_id"));
	response.sendRedirect("onebyone_question.jsp");
%>