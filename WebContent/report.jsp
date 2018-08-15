<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Report of Order</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
<script src ="assets/js/jquery.js"></script>
<script src =matchPassword.js></script>
<script src = "passwordcnf.js"></script>
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
background-color: blue;
}
.btn:hover{

 background-color: blue;
 color: white;
 }
 </style>
 
 
<script type="text/javascript">
function print(){
	window.print();
}

</script>
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
 #b:hover{
 background-color: blue;
 color: white;
 }
 
 </style>
</head>
<body class="background-image"  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

<%
String userType=(String)session.getAttribute("userType");
if(session.getAttribute("user")==null || (!userType.equals("supervisor") && !userType.equals("planningManager")) ){
response.sendRedirect("expired.jsp"); 
}	

%> 
	 
<jsp:useBean id="odao" class="DAO.OrderDAO"></jsp:useBean>

 <%
List<Order> ords=odao.getAllOrders();
session.setAttribute("orders", ords);
%>

<div class=heading align="center"><form action ="BackServlet" method ="post"><input type="submit" class="btn" style="float: left;" value="Back" id="b"  ></form>
<h1>Report</h1>
</div><br>

  <div  class="container form">
  		<div>
    		<form id="contactform"  action=""> 
				<p class="contact"><label for="oid">OrderId</label></p> 
    			<select class="select-style gender" name="oid" id="oid">
    			 <option value="">---select---</option>
	             <c:forEach var="ords" items="${orders}">
	   			<option value="${ords.orderId}">${ords.orderId} ${ords.nameOfProject} </option>
	   					
				</c:forEach>
	            </select><br><br>
            <input  class ="btn"name="submit" id="submit" value="Generate" type="submit"> 	 <br>
       </form> 
  
   </div>
   <c:if test="${param.oid ne 'select'}">
	   <div>
	 	  <jsp:include page="generateReport.jsp"></jsp:include>
	   </div>
	  <!--  <input type="button" name ="print" id ="print" class="btn" value="print" onclick="print()"> -->
   </c:if>
   </div>
</body>
</html>