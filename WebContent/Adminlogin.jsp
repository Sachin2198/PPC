<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin login</title>
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
 </style>
<script>
function back() {
	window.location="index.jsp";
}
</script>
<script src ="NoBack.js"></script>
</head>
<body class="background-image" onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

<div class=heading align="center"><input type="button" class="btn" style="float: left;" value="Back" id="b" onclick="back()" >
<h1>ADMIN LOGIN</h1></div><br>

  <div  class="form">
    		<form id="contactform" action ="AdminCheck" method="post"> <br>
    		
    		<div align="center">
    		<img src="assets/images/loginIcon.png" alt=""></div><br><br>
    			<p class="contact"><label for="admin">AdminName</label></p> 
    			<input id="adminName" name="adminName" placeholder="Enter Name" required="" tabindex="1" type="text"> 
    			 
    			
                <p class="contact"><label for="password">Password</label></p> 
    			<input type="password" id="password" name="password" required=""  tabindex="2"	placeholder="Enter Password"> 
    			
             <input class="buttom" name="submit" id="submit" value="log in" type="submit"> 	 <br>
             
       </form> 
 
   <br><br><br>
   </div>
</body>
</html>