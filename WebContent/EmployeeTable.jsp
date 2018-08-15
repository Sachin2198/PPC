<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Table</title>

<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css"
	media="all" />
<style type="text/css">
div {
	border-radius: 5px;
	background-color: #f1f1f1;
	padding: 20px;
	color: black;
	align-content: center;
}

.background-image {
	background-image: url("assets/images/background2.jpg");
	background-filter: 2px;
	background-size: cover; /* <------ */
	background-repeat: no-repeat;
	background-position: center;
}

.btn {
	background-color: gray;
}

.btn:hover {
	background-color: red;
}

#b:hover{
background-color: blue;
color:white;
}
</style>
<script>
function back(){
	window.location="AdminDashboard.jsp"
}
</script>
<script src ="NoBack.js"></script>
</head>
<body class=background-image onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="" >
<%
	String userType=(String)session.getAttribute("userType");
	if(session.getAttribute("user")==null || !userType.equals("admin")){
	response.sendRedirect("expired.jsp"); 
	}	
%> 
	<jsp:useBean id="edao" class="DAO.EmployeeDAO"></jsp:useBean>
	<%
		List<Employee> emps = edao.getAllEmployees();
		session.setAttribute("emps", emps);
	%>

	<div align="center">
		<input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" ><h1>Employee Table</h1>
	</div>
	<br>
	<br>

	<div>
		<table class="table table-striped table-bordered table-hover ">
			<thead>
				<tr>
					<th>#</th>
					<th>User Id</th>
					<th>Name</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Address</th>
					<th>Email</th>
					<th>Mobile no</th>
					<th>Role</th>
					<th>Remove Action</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="count" value="0" property="number"></c:set>
				<c:forEach var="emps" items="${emps}">
					<form action="DeleteEmpServlet" method="post">
					<tr>
						<td>${count=count+1}</td>
						<td><input type="text" readonly="readonly" name="userId" value="${emps.userId}" style="background-color: transparent;border: 0"></td>
						<td><input type="text" readonly="readonly" name=name value="${emps.name}" style="background-color: transparent;border: 0"></td>
						<td>${emps.gender}</td>
						<td>${emps.dob}</td>
						<td>${emps.addr}</td>
						<td>${emps.email}</td>
						<td>${emps.phoneNo}</td>
						<td>${emps.role}</td>
						<td><input type="submit" value="remove" class="btn "
							name="${emps.userId}"></td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br><br>

</body>
</html>
