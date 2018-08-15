<%@page import="model.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Planning Manager Dashboard</title>
<link rel="stylesheet" type="text/css" href="myStyle.css">
<style>
.navbar {
    overflow: hidden;
    background-color: #333;
    font-family: Arial, sans-serif;
}

.navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color: black;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

}

.dropdown-content a {
    float: none;
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: black;
}

.dropdown:hover .dropdown-content {
    display: block;
}
#new{
background-color: #333;
color:white;
padding: 10px;
}
</style>


<script src ="NoBack.js"></script>
</head>
<body class =background-image onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
 <%
 String userType=(String)session.getAttribute("userType");
	if(session.getAttribute("user")==null ||!userType.equals("planningManager") ){
	response.sendRedirect("expired.jsp"); 
	}	

	
%> 
<div id=main>
<div id = "head">Planning Manager
</div><br><br>



<div id = new class="navbar">
  <a class="active" href="index.jsp">HOME</a>
  <a href="Order.jsp">Add Order</a>
  <a href="orderTable.jsp">Order Details</a>
  <div id =new class="dropdown">
    <button class="dropbtn">ManageResources
      <i class="fa fa-caret-down"></i>
    </button>
    <div id =new class="dropdown-content">
      <a href="rawMaterial.jsp">Raw Materials</a>
      <a href="Machine.jsp">Machines</a>

    </div>
  </div> 
  <a href="requestTable.jsp">PendingRequest</a>
   <a href="report.jsp">Order Report</a> 
  <a href="logoutServlet">Logout</a>
</div>

<br><br><br>

<div id ="wel">WELCOME Planning Manager!!</div>
</div>

</body>
</html>