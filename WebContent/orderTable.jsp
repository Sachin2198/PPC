<%@page import="model.Login"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Table</title>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" media="all" />
<style type="text/css">

div {
    border-radius: 5px;
    background-color:#f1f1f1;
    padding: 20px;
    color: black;
    align-content: center;
}
.background-image {
	 background-image: url("assets/images/background2.jpg");
 	 background-filter:2px;
    background-size:     cover;                      /* <------ */
    background-repeat:   no-repeat;
    background-position: center;   

}
.btn{
 background-color: gray;
}
.btn:hover{

 background-color: red;
 }
 #b:hover{
 background-color: blue;
 color: white;
 }
  td{
 font-size: 15px;
 }
 </style>

<script src ="NoBack.js"></script>
</head>
<body class =background-image onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

 <%
String userType=(String)session.getAttribute("userType");
if(userType==null || (!userType.equals("admin" ) && !userType.equals("planningManager")) ){
	response.sendRedirect("expired.jsp"); 
}	

%>
<jsp:useBean id="odao" class="DAO.OrderDAO"></jsp:useBean>

<%
List<Order> ords= odao.getAllOrders();
session.setAttribute("ords", ords);
%>

<div align="center"><form action ="BackServlet" method ="post"><input type="submit" class="btn" style="float: left;" value="Back" id="b"  ></form><h1>Order Table</h1>
</div><br><br>

<div  >
		<table class="table table-striped table-bordered table-hover table-condensed ">
		<thead>
				<tr >
					<th >#</th>
					<th >Manager Id</th>
					<th >Order Id</th>
					<th >Project Name</th>
					<th >Start Date</th>
					<th > End Date</th>
					<th >Company</th>
					<th >Quantity Demanded</th>
					<th >Supervisor Id</th>
					<th >Allocated</th>
					<th >Manpower</th>
					<th >Deadline</th>
					<th>Remove Action</th>
				</tr>
		
				</thead>
				

		<c:set var="count" value="0" property="number"></c:set>
			<c:forEach var="ords" items="${ords}">
				<form action="DeleteOrdServlet" method="post">
					<tr >
						<td scope="row">${count=count+1}</td>
						<td>${ords.managerId}</td>
						<td><input type="text" readonly="readonly" name="userId" value="${ords.orderId}" style="background-color: transparent;border: 0"></td>
						<td>${ords.nameOfProject}</td>
						<td>${ords.startDate}</td>
						<td>${ords.endDate}</td>
						<td>${ords.company}</td>
						<td>${ords.quantity}</td>
						<td>${ords.supervisor}</td>
						<td>${ords.allocated}</td>
						<td>${ords.manpower}</td>
						<td>${ords.deadline}</td>
						<td> <input class="btn" type="submit" value ="remove"></td>
					</tr>
					</form>
				</c:forEach>
		</table>
	</div>
	
	
</body>
</html>