<%@page import="model.Login"%>
<%@page import="model.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request table</title>
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

 background-color: green;
 }
 #b:hover{
 background-color: blue;
 color: white;
 }
 
 </style>

<script>
function back(){
	window.location="PlanningManagerDashboard.jsp"
}
</script>
<script src ="NoBack.js"></script>
</head>
<body class="background-image"  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

<%
String userType=(String)session.getAttribute("userType");
if(session.getAttribute("user")==null  || (!userType.equals("admin" ) && !userType.equals("planningManager")) ){
response.sendRedirect("expired.jsp"); 
}	


%>

<jsp:useBean id="rdao" class="DAO.RequestDAO"></jsp:useBean>
<%
List<Request> reqs = rdao.getAllRequests();
session.setAttribute("reqs",reqs);
	
%>

<div  align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" >
<h1>Pending Requests</h1>
</div><br>

<div  >
	
	<table class="table table-striped table-bordered table-hover ">
		<thead>
				<tr >
					<th>#</th>
					<th>Sender Id</th>
					<th>Receiver Id</th>
					<th>Id</th>
					<th>Message</th>
					 <th>Order Id</th>
					<th>Date</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="count" value="0" property="number"></c:set>
				<c:forEach var="req" items="${reqs}">
					<form action="DeleteReqServlet" method="post">
					<tr >
						<td >${count=count+1}</td>
						<td>${req.senderId}</td>
						<td>${req.receiverId}</td>
						<td><input type="text" readonly="readonly" name="userId" value="${req.id}" style="background-color: transparent;border: 0"></td>
						<td>${req.message}</td>
						 <td>${req.orderId}</td> 
						<td>${req.onDate}</td> 
						<td>${req.addressed}</td> 
						<td> <input type="submit" class= "btn" value ="Accept"></td>
						
					</tr>
					</form>
				</c:forEach>
			</tbody>
			</table>
	</div>
	<br><br>
</body>
</html>