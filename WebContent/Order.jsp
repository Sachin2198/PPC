x<%@page import="model.Login"%>
<%@page import="DAO.EmployeeDAO"%>
<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
<script src = "assets/js/angular.min.js"></script>
<script src ="assets/js/jquery.js"></script>
<script src =dateValidation.js></script>
<script src =matchPassword.js></script>
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
	window.location="PlanningManagerDashboard.jsp"
}
</script>
</head>
<body class="background-image"  ng-app="myApp" class="controller" ng-controller="myCtrl" onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
<%

String userType=(String)session.getAttribute("userType");
if(userType==null || !userType.equals("planningManager") ){
response.sendRedirect("expired.jsp"); 
}	

String empId=(String)session.getAttribute("userId");
session.setAttribute("eId",empId );
	%>

<jsp:useBean id="edao" class="DAO.EmployeeDAO"></jsp:useBean>
<%
List<Employee> emps=edao.getAllEmployees();
session.setAttribute("emps", emps);

%>
<div class=heading align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" ><h1>Orders</h1></div><br>

  <div  class="form">
    		<form id="contactform" method="post" action="orderServlet"> 
    		
    		<p class="contact"><label for="mid">ManagerId </label></p> 
    			<input id="mid" name="mid" readonly="readonly" value="${eId}" tabindex="1" type="text">
	            
    			<p class="contact"><label for="oid">OrderId</label></p> 
    			<input id="oid" name="oid" placeholder="Enter orderId" required="" tabindex="2" type="text"> 
    			 
    			<p class="contact"><label for="nop">Name Of Project</label></p> 
    			<input id="nop" name="nop" placeholder="Enter name of project" required="" tabindex="3" type="text"> 
                
                <p class="contact"><label for="sdt">Start Date</label></p> 
    			<input id="sdt" name="sdt" required="" placeholder="Enter Start date"   tabindex="4" type="date" ng-model="startDate" ng-click="sdMsg='' "  ng-blur="checkSd(startDate)"> <br>
    			<span style="float: right; color: red"> {{sdMsg}} </span><br>
    			
    			   <p class="contact"><label for="edt">End Date</label></p> 
    			<input id="edt" name="edt" placeholder="Enter End date" tabindex="5" type="date" required="" ng-model="endDate"  ng-click="edMsg='' " ng-blur="checkEd(startDate,endDate)"><br> 
    			<span style="float: right; color: red"> {{edMsg}} </span><br>
    			
    				<p class="contact"><label for="cmp">Company</label></p> 
    			<input id="cmp" name="cmp" placeholder="Enter company name" tabindex="6" required="" type="text"> 
    			
    			<p class="contact"><label for="sid">SupervisorId</label></p> 
    			<select class="select-style gender" name="sid" tabindex="7">
	              <c:forEach var="emps" items="${emps}">
	           	<c:if test="${emps.role eq 'supervisor'}">
	  						<option value="${emps.userId}">${emps.userId} </option>
	  					</c:if>
				</c:forEach>
	            </select><br><br>
    			 
                
            <p class="contact"><label for="qty">Quantity</label></p> 
            <input id="qty" name="qty" placeholder="Enter Quantity" required="" tabindex="8" type="number"  > <br>
            
         <!--    <p class="contact"><label for="alc">Allocated</label></p> 
            <select class="select-style gender" name="alc">
	            <option value="No">No</option>
	            <option value="Yes">Yes</option>
	            </select><br><br> -->
            
             <p class="contact"><label for="mp">Manpower</label></p> 
            <input id="mp" name="mp" placeholder="Enter Manpower" required="" tabindex="9" type="number"  > <br>
            
            <p class="contact"><label for="dline">Deadline</label></p> 
    			<input id="dline" name="dline" placeholder="Enter deadline" tabindex="10"  required="" type="date" ng-model="deadline" ng-click="dlMsg='' " ng-blur="checkDl(endDate,deadline)"> 
    			<span style="float: right; color: red"> {{dlMsg}} </span><br><br>
            
            
            <input class="buttom" name="add" id="add" value="Add" type="submit" ng-disabled="disableBtn"> 	 <br>
       </form> 
  
   </div>
</body>
</html>