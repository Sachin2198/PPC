<%@page import="model.Login"%>
<%@page import="model.RawMaterials"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Raw Table</title>
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
 
 </style>
</head>
<body class=background-image>

<%
	String userType=(String)session.getAttribute("userType");
	if(session.getAttribute("user")==null || (!userType.equals("admin" ) && !userType.equals("planningManager")) ){
	response.sendRedirect("expired.jsp"); 
	}	

%>

	<jsp:useBean id="rdao" class="DAO.RawMaterialsDAO"></jsp:useBean>

	<%
List<RawMaterials> raws= rdao.getAllRaws();
session.setAttribute("raws", raws);
 %>

	<div align="center"><form action ="BackServlet" method ="post"><input type="submit" class="btn" style="float: left;" value="Back" id="b" ></form>
		<h1>RawMaterial Table</h1>
	</div>
	<br>
	<br>

	<div class=container>
		<table class="table table-striped table-bordered table-hover ">
			<thead>
				<tr>
					<th>#</th>

					<th>Raw AssignedId</th>
					<th>Raw Name</th>
					<th>Order Id</th>
					<th>Raw UniqueId</th>
					<th>Raw Quantity</th>
					<th>Unit</th>
					<th>Remove Action</th>
				</tr>
			</thead>

			<tbody>
				<c:set var="count" value="0" property="number"></c:set>
				<c:forEach var="raws" items="${raws}">
					<form action="DeleteRawServlet" method="post">
						<tr>
							<td>${count=count+1}</td>
							<td>${raws.rawNo}</td>
							<td>${raws.rawName}</td>
							<td>${raws.orderId}</td>
							<td><input type="text" readonly="readonly" name="userId"
								value="${raws.rawId}"
								style="background-color: transparent; border: 0;"></td>
							<td>${raws.rawQuantity}</td>
							<td>${raws.rawUnit}</td>
							<td><input class="btn" type="submit" value="remove"></td>
						</tr>
					</form>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>