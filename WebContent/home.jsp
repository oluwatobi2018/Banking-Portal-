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

<title>HOME PAGE</title>
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
  <a href="AppServlet?id=deletePage" id="logout">Delete account</a>
  <a href="AppServlet?id=create_account" id="logout">Create account</a>
</div>
<br>
<%
String msg=(String)request.getAttribute("msg"); 
String account_no=(String)request.getAttribute("account_no"); 
%>
<br>

<div class="contain">
		<div class="col-lg-3">
		
		</div>
		
		
		<div class="col-lg-6">
				<form action="AppServlet?id=menu_choice" method="post" id="content">
				<p id="select">Select a task:</p>
				<BR>
				<font color="white">ENTER ACCOUNT NO:</font>
				<BR>
				<input type="text" name="account_number" value="<%out.println(account_no) ;%>" required>
				<br><br>
				<font color="red"><%out.println(msg); %></font>
				<br><br>
				<input type="radio" name="task" id="deposit" value="deposit">
				<font color="white"><label for="deposit">DEPOSIT</label></font>
				<BR><BR>
				<input type="radio" name="task" id="withdrawal" value="withdrawal">
				<font color="white"><label for="withdrawal">WITHDRAWAL</label></font>
				<BR><BR>
				<input type="radio" name="task" id="statement" value="statement">
				<font color="white"><label for="statement">STATEMENT</label></font>
				<BR><BR><br>
				<input type="submit"  id="submitbutton" value="PROCESS REQUEST"><BR><BR>
				
				
				</form>
		</div>
		
		
		<div class="col-lg-3">
		
		</div>
		
		
	
</div>

<div class="footer">
  Copyright &copy; Aryak's Banking Portal 2020 | MADE BY: Aryak Deshpande
</div>	
</body>
</html>