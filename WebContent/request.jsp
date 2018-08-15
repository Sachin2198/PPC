<%@page import="DAO.EmployeeDAO"%>
<%@page import="model.Login"%>
<%@page import="model.Employee"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Requests</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
<script src ="assets/js/jquery.js"></script>
<script src =matchPassword.js></script>
<script src = "passwordcnf.js"></script>
<script>
function back(){
	window.location="SupervisorDashboard.jsp"
}
</script>
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
</head>
<body class="background-image"  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
<%
String userType=(String)session.getAttribute("userType");
if(session.getAttribute("user")==null ||!userType.equals("supervisor") ){
response.sendRedirect("expired.jsp"); 
}	

String empId=(String)session.getAttribute("userId");
session.setAttribute("eId",empId );

%>
<jsp:useBean id="odao" class="DAO.OrderDAO"></jsp:useBean>
<jsp:useBean id="edao" class="DAO.EmployeeDAO"></jsp:useBean>
<%
List<Employee> emps=edao.getAllEmployees();
session.setAttribute("emps", emps);

List<Order> ords=odao.getAllOrders();
session.setAttribute("ords", ords);
%>
<div class=heading align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" ><h1>Request Page</h1></div><br>

  <div  class="form">
    		<form id="contactform" method="post" action="RequestServlet"> 
    				<p class="contact"><label for="oid">OrderId</label></p> 
    			<select class="select-style gender" name="oid" tabindex="1">
	             <c:forEach var="ords" items="${ords}">
	   					<option value="${ords.orderId}">${ords.orderId} ${ords.company} </option>
				</c:forEach>
	            </select><br><br>
    			 
    			<p class="contact"><label for="sid">SenderId</label></p> 
    			<input id="sid" name="sid" readonly="readonly" value="${eId}" tabindex="2" type="text">
                
               
    		<p class="contact"><label for="mid">ReceiverId</label></p> 
    			<select class="select-style gender" name="rid" tabindex="3">
	           <c:forEach var="emps" items="${emps}">
	           	<c:if test="${emps.role eq 'planningManager'}">
	  						<option value="${emps.userId}">${emps.userId} </option>
	  					</c:if>
				</c:forEach>
	            </select><br><br>
    			
    		<p class="contact"><label for="msg">Message</label></p> 
    		<textarea id="msg" name="msg" rows="4" cols="40" placeholder="Enter Message (in 100 letters)" maxlength="100"></textarea><br>
            <input class="buttom" name="send" id="send" value="send" type="submit" required="" tabindex="4" > 	 <br>
       </form> 
  
   </div>
</body>
</html>