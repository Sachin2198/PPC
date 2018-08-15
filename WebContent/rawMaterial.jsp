<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Raw Materials</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
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
<script>
function back() {
	window.location="PlanningManagerDashboard.jsp";
}
</script>
<script src ="NoBack.js"></script>
</head>
<body class="background-image" onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
<%
String userType=(String)session.getAttribute("userType");
if(session.getAttribute("user")==null || !userType.equals("planningManager") ){
response.sendRedirect("expired.jsp"); 
}	


%> 
<jsp:useBean id="odao" class="DAO.OrderDAO"></jsp:useBean>
<% 
List<Order> ords=odao.getAllOrders();
session.setAttribute("ords", ords);
%>

<div class=heading align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" ><h1>RAW MATERIAL DETAIL</h1></div><br>

  <div  class="form">
    		<form id="contactform" method="post" action="RawServlet"> <br>
    		<div align="center">
    		<img src="assets/images/productIcon.png" alt=""></div><br><br>
    			<p class="contact"><label for="rname">RAW Name</label></p> 
    			<input id="rname" name="rname" placeholder="Enter Raw Name" required="" tabindex="1" type="text"> 
    			 
    			
    			 
                <p class="contact"><label for="qty">Raw Quantity</label></p> 
    			<input type="number" id="qty" name="qty" required="" tabindex="2" placeholder="Enter Quantity">
	    			
	    			<p class="contact"><label for="unit">Unit</label></p> 
	            <select class="select-style gender" name="unit" tabindex="3">
	            <option value="Kilogram">Kilogram</option>
	            <option value="litre">liter</option>
	            <option value="units">units</option>
	            </select><br><br>
    			
    			    <p class="contact"><label for="rawNo">Raw No</label></p> 
    			<input type="text" id="rawNo" name="rawNo" required="" tabindex="4" placeholder="Enter RAW No."> 
    			
    			<p class="contact"><label for="oid">OrderId</label></p> 
    			<select class="select-style gender" name="oid" tabindex="5">
	             <c:forEach var="ords" items="${ords}">
	             <c:if test="${ords.allocated eq 'Yes'}">
	   					<option value="${ords.orderId}">${ords.orderId} ${ords.company} </option>
	   					</c:if>
				</c:forEach>
	            </select><br><br>
    			
             <input class="buttom" name="submit" id="submit" value="Add" type="submit">
             <input class="buttom" name="reset" id="reset" value="Reset" type="reset"> 	 <br>
       </form> 
   <br><br><br>
   </div>
</body>
</html>