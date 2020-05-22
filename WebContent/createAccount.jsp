<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Chettan+2&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>CREATE ACCOUNT</title>
<style type="text/css">
body{
background-image: url("bankbackground.jpg");
background-size: cover;
}
#select{
font-size: 40px;
font-family: 'Montserrat', sans-serif;
color:blue;
font-style:normal;
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
#contents{
margin-left:40%;
margin-right:40%;
}
</style>
</head>
<body>
<%
String account_number=(String)request.getAttribute("msg"); 
String name=(String)request.getAttribute("name");
String address=(String)request.getAttribute("address");
String email=(String)request.getAttribute("email");
String phone=(String)request.getAttribute("phone");
%>


<div class="topnav">
  <img src="logofinal.png" height="5%" width="15%">
  <a href="AppServlet" id="logout">Log-out</a>
  <a href="AppServlet?id=gohome" id="logout">Home</a>
  
</div>





<div class="contain">
	<p align="center" id="select">CREATE NEW ACCOUNT:</p>
			<BR><BR>
			<form action="AppServlet?id=generate_account" method="post"  id="contents">
			<font color="white">Enter name:</font>
			<input type="text" name="name" placeholder="Full name" pattern="[A-Za-z ]{1,32}" value="<%out.println(name) ;%>"><BR><BR>
			<font color="white">Enter email address:</font>
			<input type="email" placeholder="Email ID" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value="<%out.println(email) ;%>"><BR><BR>
			<font color="white">Enter mobile number:</font>
			<input type="tel" pattern="[0-9]{10}" placeholder="11 digit mobile no." name="phone" value="<%out.println(phone) ;%>"><BR><BR>
			<font color="white">Enter address:</font>
			<input type="text" placeholder="Full address" name="address" value="<%out.println(address) ;%>"><BR><BR>
			<input type="submit" value="GENERATE ACCOUNT NO."><BR><BR>
			<font color="red"><%out.println(account_number) ;%></font>
			</form>
	
</div>

<div class="footer">
  Copyright &copy; Aryak's Banking Portal 2020 | MADE BY: Aryak Deshpande
</div>	

</body>
</html>