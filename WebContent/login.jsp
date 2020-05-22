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
<title>LOGIN</title>

<style type="text/css">
body{
background-image: url("bankbackground.jpg");
background-size: cover;
}
#motto{
margin:5%;
font-style: bold;
font-size: 60px;
font-family: 'Montserrat', sans-serif;
color:white;
opacity: 0.2;

}
#log{
font-style: bold;
font-size: 30px;
font-family: 'Montserrat', sans-serif;
color:white;
}
#labels{
font-size: 10px;
font-family: 'Montserrat', sans-serif;
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
input{
background-color: transparent;
border-radius: 8px;
}
#formo{
margin-left:20%;
margin-right:0%;
float:right;
}
</style>
<% String Msg= (String)request.getAttribute("msg"); %>
<% String username= (String)request.getAttribute("username"); %>
</head>
<body>

<div class="topnav">
  
  <p id="date"></p>
</div>


<div class="contain">
		<div class="col-lg-5">
				<form action="AppServlet?id=login" method="post" id="formo">
				<br>
				<img src="logofinal.png" height="45%" width="60%">
				<p align="center">
				
				<BR><BR>
				<p id="log">ADMIN LOGIN</p>
				<p >
			    <font color="red"><% out.println(Msg);%></font>
				</p>
				<BR>
				<font color="blue" id="labels">PLEASE ENTER YOUR CRENDENTIALS:</font>
				<BR><BR>
				<font color="white" style="font-weight: bold;">Username:</font>&nbsp;&nbsp;
				<input type="text" name="username" value="<%out.print(username);%>">
				<br><br>
				<font color="white"  style="font-weight: bold;">Password:</font>&nbsp;&nbsp; 
				<input type="password" name="password">
				<br>
				<br>
				<BR>
				<input type="submit" class="btn btn-primary" value="LOGIN"/>
				</p>
				<br>
				<br>
				
				</form>
		</div> 
		<div class="col-lg-7">
        		<p id="motto">At Aryak's Bank, your safety is our first priority. Be safe, be secure.</p>
	    </div> 
</div>
<div class="footer">
  <p>Copyright &copy; Aryak's Banking Portal 2020 | MADE BY: Aryak Deshpande</p>
</div>
</body>
</html>