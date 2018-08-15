<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supervisor Dashboard</title>
<link rel="stylesheet" type="text/css" href="myStyle.css">
<script src ="NoBack.js"></script>
</head>
<body class="background-image"  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

<%
 String userType=(String)session.getAttribute("userType");
	if(session.getAttribute("user")==null  || !userType.equals("supervisor" ) ){
	response.sendRedirect("expired.jsp"); 
	}	

	
%> 
<div id=main>
<div id = "head">Supervisor Dashboard
</div><br><br>

<ul>
  <li><a class="active" href="index.jsp">HOME</a></li>
  <li><a href="mytask.jsp">Allocate Task</a></li>
  <li><a href="mytaskTable.jsp">Task Details</a></li>
  <li><a href="request.jsp">Request Resource</a></li>
  <li><a href="report.jsp">Order Report</a></li>
  <li><a href="logoutServlet">Logout</a></li>
</ul>
<br><br><br>

<div id ="wel">WELCOME Supervisor!!</div>
</div>

</body>
</html>