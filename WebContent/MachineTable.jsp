<%@page import="model.Login"%>
<%@page import="model.Machine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Machine TableS</title>
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

<script src ="NoBack.js"></script>
</head>
<body class =background-image onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

<%
String userType=(String)session.getAttribute("userType");
	if(session.getAttribute("user")==null || (!userType.equals("admin" ) && !userType.equals("planningManager")) ){
	response.sendRedirect("expired.jsp"); 
	}	

%> 
<jsp:useBean id="mdao" class="DAO.MachineDAO"></jsp:useBean>
<%
List<Machine> macs= mdao.getAllMachines();
session.setAttribute("macs", macs);
%>

<div  align="center"><form action ="BackServlet" method ="post"><input type="submit" class="btn" style="float: left;" value="Back" id="b"  ></form><h1>Machine Table</h1>
</div><br>

<div class="container" >
	<table class="table table-striped table-bordered table-hover ">
		<thead>
				<tr >
					<th >#</th>
					<th >Machine No.</th>
					<th >Mobile Name</th>
					<th>Machine Id</th>
					<th >Quantity</th>
					<th>Remove Action</th>
				</tr>
				</thead>
				<tbody>
				<c:set var="count" value="0" property="number"></c:set>
				<c:forEach var="macs" items="${macs}">
				<form action="DeleteMacServlet" method="post">
					<tr >
						<td scope="row">${count=count+1}</td>
						
						<td>${macs.machineNo}</td>
						<td>${macs.nameOfMachine}</td>
						<td><input type="text" readonly="readonly" name=name value="${macs.id}" style="background-color: transparent;border: 0"></td>
						<td>${macs.quantityOfMachine}</td>
						<td> <input type="submit" class= "btn" value ="remove"></td>
					</tr>
					</form>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</body>
</html>