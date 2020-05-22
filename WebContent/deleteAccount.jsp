<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>DELETE ACCOUNT</title>
<script type="text/javascript">
function deletePrompt(){
	return confirm("Are you sure you want to delete this account?");
	
}
</script>
<style type="text/css">
body{
background-image: url("bankbackground.jpg");
background-size: cover;
}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   margin-top:5%;
   margin-bottom:1%;
   width: 100%;
   background-color: transparent;
   color: white;
   text-align: center;
}
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
.contain{
margin:5%;
}
.col-lg-6{
align-content: center;
}
#logout{
float: right;
}
#logo{
float: left;
}
.col-lg-6{
align-content: center;
}
#logout{
float: right;
}
#logo{
float: left;
}
#content{
margin-left:10%;
margin-right:10%;
}
#select{
font-size: 40px;
font-family: 'Montserrat', sans-serif;
color:blue;
font-style:normal;
}
#submitbutton{
background-color: green;
color:white;
}
</style>
</head>
<body>
<div class="topnav">
  <img src="logofinal.png" height="5%" width="15%">
  <a href="AppServlet" id="logout">Log-out</a>
  <a href="AppServlet?id=gohome" id="logout">Home</a>
  
</div>
<%
String msg=(String)request.getAttribute("msg"); 
String account_no=(String)request.getAttribute("account_no"); 
%>
<div class="contain">
		<div class="col-lg-3">
		
		</div>
		
		
		<div class="col-lg-6">
		<form action="AppServlet?id=delete_account" method="post" id="content">
				<p id="select">DELETE ACCOUNT</p>
				<BR><BR>
				<font color="white">ENTER ACCOUNT NO:</font>
				<BR>
				<input type="text" name="account_number" value="<%out.println(account_no) ;%>" required>
				<br><br>
				<input type="submit" onclick="return deletePrompt()" id="submitbutton" value="DELETE ACCOUNT"><BR><BR>
				<font color="red"><%out.println(msg); %></font>
		</form>
		
		</div>
		
		<div class="col-lg-3">
		
		</div>
<div class="footer">
  Copyright &copy; Aryak's Banking Portal 2020 | MADE BY: Aryak Deshpande
</div>	
</body>
</html>