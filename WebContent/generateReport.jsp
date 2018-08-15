<%@page import="model.RawMaterials"%>
<%@page import="model.Machine"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ReportDAO"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="model.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<%
String userType=(String)session.getAttribute("userType");
if(session.getAttribute("user")==null || (!userType.equals("supervisor") && !userType.equals("planningManager")) ){
response.sendRedirect("expired.jsp"); 
}	
%> 

<jsp:useBean id="ord" class="model.Order"></jsp:useBean>

<jsp:useBean id="machines" class="model.Machine"></jsp:useBean>
<jsp:useBean id="odao" class="DAO.OrderDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="DAO.ReportDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="DAO.MachineDAO"></jsp:useBean>
<% 
String ids;
ids = request.getParameter("oid");

ord=odao.findOrdreByOrderId(ids);
List<Machine> macs = rdao.findMachineReportTable(ids); 
List<RawMaterials> rawMt=rdao.getAllRawMaterialsByOrderId(ids);
session.setAttribute("rawMts", rawMt);
session.setAttribute("mach", macs);
session.setAttribute("order", ord);
%> 

<div>
	<table style="width: 100%;">
		<tr>
		<td><b>Order Id :</b></td>
		<td>${order.orderId}</td>
		<td><b>Order Name :</b></td>
		<td>${order.nameOfProject}</td>
		</tr>
		
		<tr>
		<td><b>Ordering Company :</b></td>
		<td>${order.company}</td>
		<td></td>
		<td></td>
		</tr>
		
		<tr>
		<td><b>Quantity :</b></td>
		<td>${order.quantity}</td>
		<td><td>
		<td><td>
		</tr>
		
		<tr>
		<td><b>Start Date :</b></td>
		<td>${order.startDate}</td>
		<td><b>End Date :</b></td>
		<td>${order.endDate}</td>
		</tr>
		
		<tr>
		<td><b>Manager Assigned :</b></td>
		<td>${order.managerId}</td>
		<td><b>Supervisor Assigned</b> :</td>
		<td>${order.supervisor}</td>
		</tr>
		
		<tr>
		<td><b>Manpower :</b></td>
		<td>${order.manpower}</td>
		<td><td>
		<td><td>
		</tr>
	</table><br>
	
	
	<b>Used Raw Materials :</b>
	<table class="table table-striped table-bordered table-hover ">
			<thead>
				<tr>
					<th>#</th>
					<th>Raw AssignedId</th>
					<th>Raw Name</th>
					<th>Raw Quantity</th>
					<th>Unit</th>
				</tr>
				
			</thead>

			<tbody>
				<c:set var="count" value="0" property="number"></c:set>
				<c:forEach var="x" items="${rawMts}">
						<tr>
							<td>${count=count+1}</td>
							<td>${x.rawNo}</td>
							<td>${x.rawName}</td>
							<td>${x.rawQuantity}</td>
							<td>${x.rawUnit}</td>
						</tr>
				</c:forEach>
			</tbody>

		</table><br>


<b>Used Machines :</b>
	<table class="table table-striped table-bordered table-hover ">
			<thead>
				<tr>
					<th>#</th>
					<th>Id</th>
					<th>Machine no.</th>
					<th>Machine Name</th>
				</tr>
			</thead>

			<tbody>
				<c:set var="count" value="0" property="number"></c:set>
				<c:forEach var="y" items="${mach}">
						<tr>
							<td>${count=count+1}</td>
							<td>${y.id}</td>
							<td>${y.machineNo}</td>
							<td>${y.nameOfMachine}</td>
						</tr>
				</c:forEach>
			</tbody>

		</table>
	
	
		<div>
		
		</div>
</div>
</body>
</html>