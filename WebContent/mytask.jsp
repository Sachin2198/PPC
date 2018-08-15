<%@page import="model.Login"%>
<%@page import="model.Order"%>
<%@page import="model.Machine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Task</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
<script src ="assets/js/jquery.js"></script>
<script src =matchPassword.js></script>
<script src = "assets/js/angular.min.js"></script>
<script src =myTaskDateValid.js></script>
<script src = "passwordcnf.js"></script>
<script src ="NoBack.js"></script>
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
<script>
function back(){
	window.location="SupervisorDashboard.jsp"
}
</script>
</head>
<body class="background-image" ng-app="myApp" class="controller" ng-controller="myCt" onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
 <%
String userType=(String)session.getAttribute("userType");
if(session.getAttribute("user")==null || !userType.equals("supervisor") ){
response.sendRedirect("expired.jsp"); 
}	

%> 
	 
<jsp:useBean id="mdao" class="DAO.MachineDAO"></jsp:useBean>
<jsp:useBean id="odao" class="DAO.OrderDAO"></jsp:useBean>
<%
List<Machine> macs=mdao.getAllMachines();
session.setAttribute("macs", macs);

List<Order> ords=odao.getAllOrders();
session.setAttribute("ords", ords);
%>

<div class=heading align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" ><h1>Allocated Tasks</h1></div><br>

  <div  class="form">
    		<form id="contactform" method="post" action="myTaskServlet"> 
    			<!-- <p class="contact"><label for="tid">TaskId</label></p> 
    			<input id="tid" name="tid" placeholder="Enter TaskId" required="" tabindex="1" type="number">  -->
    			 
    			<p class="contact"><label for="email">TaskName</label></p> 
    			<input id="tname" name="tname" placeholder="Enter task Name" tabindex="1" required="" type="text"> 
                
                <p class="contact"><label for="sdt">Start Date</label></p> 
    			<input id="sdt" name="sdt" placeholder="Enter Start date" tabindex="2" type="date" ng-model="startDate" ng-click="sdMsg='' "  ng-blur="checkSd(startDate)"> 
    			<span style="float: right; color: red"> {{sdMsg}} </span><br><br>
    			
    			   <p class="contact"><label for="edt">End Date</label></p> 
    			<input id="edt" name="edt" placeholder="Enter End date" tabindex="3" type="date"  ng-model="endDate" ng-click="edMsg='' " ng-blur="checkEd(startDate,endDate)"> 
    			<span style="float: right; color: red"> {{edMsg}} </span><br><br>
    			
    			<p class="contact"><label for="mid">MachineId</label></p> 
    			<select class="select-style gender" name="mid" tabindex="4">
	             <c:forEach var="macs" items="${macs}">
	           		<option value="${macs.machineNo}">${macs.machineNo} ${macs.nameOfMachine}</option>
	  			</c:forEach>
	            </select><br><br>

				<p class="contact"><label for="oid">OrderId</label></p> 
    			<select class="select-style gender" name="oid" tabindex="5">
	             <c:forEach var="ords" items="${ords}">
	             <c:if test="${ords.allocated eq 'No'}">
	   					<option value="${ords.orderId}">${ords.orderId} ${ords.company} </option>
	   					</c:if>
				</c:forEach>
	            </select><br><br>
            <input class="buttom" name="add" id="add" value="Add" type="submit" ng-disabled="disableBtn"> 	 <br>
       </form> 
  
   </div>
</body>
</html>