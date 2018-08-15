<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="register.css" media="all" />
<script src ="assets/js/jquery.js"></script>
<script src =matchPassword.js></script>
<script src = "passwordcnf.js"></script>
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
	window.location="AdminDashboard.jsp"
}
</script>
<script src ="NoBack.js"></script>
</head>
<body class="background-image"  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
<%
 	String userType=(String)session.getAttribute("userType");
 	if(session.getAttribute("user")==null  || !userType.equals("admin")){
		response.sendRedirect("expired.jsp"); 
 	}	
 %>
<div class=heading align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" >
<h1>SIGN UP</h1></div><br>

  <div  class="form">
    		<form id="contactform" method="post" action="SignUp"> 
    			<p class="contact"><label for="username">UserName</label></p> 
    			<input id="name" name="name" placeholder="Enter UserName" required="" tabindex="1" type="text"> 
    			 
    			<p class="contact"><label for="email">Email ID</label></p> 
    			<input id="email" name="email" placeholder="example@domain.com" required=""  tabindex="2"type="email"> 
                
                <p class="contact"><label for="gender">Address</label></p> 
    			<input id="address" name="address" placeholder="Enter Address" required="" tabindex="3" type="text"> 
    			
    			<p class="contact"><label for="Role">Role</label></p> 
    			<select class="select-style gender" name="role" tabindex="4">
	            <option value="select">select...</option>
	            <option value="planningManager">Planning Manager</option>
	            <option value="supervisor">Supervisor</option>
	            </select><br><br>
    			 
                <p class="contact"><label for="password">Create a password</label></p> 
    			<input type="password" id="password" name="password" required="" tabindex="5" placeholder="Enter Password"> 
    			
                <p class="contact"><label for="repassword">Confirm your password</label></p> 
    			<input type="password" id="repassword" name="repassword" required="" tabindex="6" placeholder="Confirm Password"><br><span style="color:red; font-size:12px;"id=message></span> 
        
               <fieldset>
                <p class="contact"> <label for="dob">Birthday</label></p>
                <input type="date" id="dob" name="dob" required="" tabindex="7" placeholder= "dd/mm/yyyy"> 
              </fieldset>
  			<p class="contact"><label for="gender" >Gender</label></p> 
            <select class="select-style gender" name="gender" tabindex="8">
            <option value="select">select...</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            </select><br><br>
            
            <p class="contact"><label for="phone">Mobile phone</label></p> 
            <input id="phone" name="phone" placeholder="phone number" required="" type="text" tabindex="9" maxlength="10"> <br>
            <input class="buttom" name="submit" id="submit" value="Sign up" type="submit"> 	 <br>
       </form> 
  
   </div>
</body>
</html>