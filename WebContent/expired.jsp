`<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Session expired</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" media="all" />
<script src ="assets/js/jquery.js"></script>

<style>
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

 background-color: blue;
 }
 

</style>
<script type="text/javascript">
function back(){
	window.location="index.jsp";
}
</script>
<script src ="NoBack.js"></script>
</head>
<body class =background-image  onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">

<div  align="center"><h1>Invalid User</h1></div><br><br>
<div align ="center" style="padding :20px"><h1>Session has been expired.</h1>
<br>
</div>
<%
session.invalidate();
response.setHeader("Refresh", "2:url=index.html");
%>
<div align="center">click here to go Home.

<input type="button" width="10px" class="btn" name=back value = "home" onclick="back()"></div>
</body>
</html>