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
<%!String sub=""; %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onex","root","");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT * FROM data where sub_id = '"+request.getParameter("sub_id")+"'");
	
	Integer q[] = (Integer[])session.getAttribute("corr_ans_array");
	String corr[]=new String[5];
	
	out.println(Arrays.toString(q));
	
	int i=0;
	while(rs.next()){
		corr[q[i]]=rs.getString(10);
		sub=rs.getString(3);
		i++;
	}
%>
<br>
<%
String opt[]=new String[5];
int score=0,na=0,ca=0,inca=0;
for(i=0;i<5;i++){
	opt[i]=request.getParameter(Integer.toString(i));
	if(opt[i].equals("5"))na++;
	if(opt[i].equals(corr[i])){
		ca++;
		score+=5;
	}
	else inca++;
}
out.println("\nYour score in "+sub+" is "+score); %><br>
<%out.println("\nQuestion unattempted = "+na); %><br>
<%out.println("\nNo.of correct answers = "+ca); %><br>
<%out.println("\nNo.of incorrect answers = "+(inca-na)); %><br>

<%
	String enr=(String)(session.getAttribute("sess_name"));
	out.println("Current enrolment number = "+enr);
	%><br><%
	/*Statement st2 = con.createStatement();
	st2.executeUpdate("UPDATE students SET '"+sub+"' = "+score+" WHERE enrolment_no = '"+enr+"'");*/
	
	int c=0;
	rs = st.executeQuery("SELECT * from scores WHERE enrolment_no = '"+enr+"' and sub_id = '"+request.getParameter("sub_id")+"'");
	while(rs.next())c++;
	
	if(c==0){
		out.println("First appearance for test");
		PreparedStatement ps = con.prepareStatement("INSERT INTO scores (enrolment_no,sub_id,score) values(?,?,?)");
		ps.setString(1,enr);
		ps.setInt(2,Integer.parseInt(request.getParameter("sub_id")));
		ps.setInt(3,score);
		ps.executeUpdate();
	}
	else{
		out.println("You appeared earlier for this test. Your score will be updated");
		st.executeUpdate("UPDATE scores SET score = "+score+" WHERE enrolment_no = '"+enr+"' and sub_id = '"+request.getParameter("sub_id")+"'");
	}
%>

<%	
	int total_score = 0;
	rs = st.executeQuery("SELECT score from scores WHERE enrolment_no = '"+enr+"' and sub_id = '"+request.getParameter("sub_id")+"'");
	while(rs.next())total_score+=rs.getInt(1);
	
	st.executeUpdate("UPDATE students SET total_score = "+total_score+" WHERE enrolment_no = '"+enr+"'");
%>

<form action="homepage.html">
	<input type="submit" value="Take other tests" />
</form>

<form action="getscorecard.jsp?sub_id=<%=request.getParameter("sub_id") %>">
	<input type="submit" value="Score Card" />
</form>
</body>
</html>