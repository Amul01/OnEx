<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*, java.sql.*" %>
<jsp:include page="connect.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="timeFormat.js"></script> 

<style>
.hide{
	visibility: hidden;
}
</style>
<script src="timer.js"></script>
</head>

<body>
<p id="time"></p>
<p id="distance"></p>
<p id="date_string"></p>

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
%>

<%for(i=0;i<5;i++) {%>
<p>Question <%= i+1 %> - </p><%= ques[i] %><br>
<form action="answers.jsp?sub_id=<%=request.getParameter("sub_id") %>" method="post">
	<input type="radio" name=<%=i %> value="1"/> <%=options[i][0] %><br>
	<input type="radio" name=<%=i %> value="2"/> <%=options[i][1] %><br>
	<input type="radio" name=<%=i %> value="3"/> <%=options[i][2] %><br>
	<input type="radio" name=<%=i %> value="4"/> <%=options[i][3] %><br>
	<input type="radio" name=<%=i %> value="5" class="hide" checked/>
<%}
session.setAttribute("corr_ans_array",q);%>
<input type="submit" value="Submit" id="send" />
</form>

</body>
</html>