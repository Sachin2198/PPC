<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Machine</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
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
<body class="background-image"  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
  <% 
 String userType=(String)session.getAttribute("userType");
	if(session.getAttribute("user")==null || !userType.equals("planningManager")){
		response.sendRedirect("expired.jsp"); 
	}	
%>
<div class=heading align="center"><form action ="BackServlet" method ="post"><input type="submit" class="btn" style="float: left;" value="Back" id="b"  ></form>
<h1>MACHINE DETAIL</h1></div><br>

  <div  class="form">
    		<form id="contactform" action="MachineServlet" method ="post"> <br>
    		<div align="center">
    		<img src="assets/images/machineIcon.png" alt="Machine"></div><br><br>
    			<p class="contact"><label for="mno">Machine No</label></p> 
    			<input id="mno" name="mno" placeholder="Enter Machine No" required="" tabindex="1" type="number"> 
    			 
    			
    			 
                <p class="contact"><label for="mqty">Quantity of Machine</label></p> 
    			<input type="number" id="mqty" name="mqty" required="" tabindex="2" placeholder="Enter Quantity of machine">
    			
    			    <p class="contact"><label for="mname">Machine Name</label></p> 
    			<input type="text" id="mname" name="mname" required="" tabindex="3" placeholder="Enter Machine Name"> 
    			
             <input class="buttom" name="submit" id="submit" value="Add" type="submit">
             <input class="buttom" name="reset" id="reset" value="Reset" type="reset"> 	 <br>
       </form> 
   <br><br><br>
   </div>
</body>
</html>