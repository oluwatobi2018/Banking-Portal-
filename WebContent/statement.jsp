<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="com.beans.Customer" %>
    <%@page import="com.beans.Transaction" %>
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
#subjects {
  font-family: helvetica;
  border-collapse: collapse;
  text-align: center;
}

#subjects td, #subjects th {
  border: 1px solid black;
  padding-left: 15px;
  padding-right: 15px;
}
h2{
color: yellow;
background-color: red;
padding:10px;
}
#subjects tr{
background-color: transparent;
}
#subjects td{
color: white;
}
#subjects th {
  padding-top: 8px;
  padding-bottom: 5px;
  padding-left:10px;
  padding-right:10px;
  text-align: center;
  background-color: #4CAF50;
  color: white;
}
</style>
<title>STATEMENT</title>
</head>
<body>
<div class="topnav">
  <img src="logofinal.png" height="5%" width="15%">
  
  <a href="AppServlet" id="logout">Log-out</a>
  <a href="AppServlet?id=gohome" id="logout">Home</a>
  
</div>
<%
List <Customer> custData=(List <Customer>)request.getAttribute("custData");
List <Transaction>transactions=(List<Transaction>)request.getAttribute("transactions");

String msg=(String)request.getAttribute("msg");
int cid=(Integer)request.getAttribute("cid");

%>
<div class="contain">
				
				
				
			
							<p id="select" align="center">STATEMENT:</p>
							<p align="center">
							<br>
							
							<%for(Customer c:custData){%>
							<font color="white" id="label">Account No: </font>
							<font color="yellow"><%out.println(c.getAccount_number()) ;%></font><br><br>
							<font color="white" id="label">Name: </font>
							<font color="yellow"><%out.println(c.getName()) ;%></font>
							<br><br>
							<font color="white"  id="label">Address: </font>
							<font color="yellow"><%out.println(c.getAddress()); %></font><br><br>
							<font color="white" id="label">Email-ID: </font>
							<font color="yellow"><%out.println(c.getEmail()) ;%></font><br><br>
							<font color="white" id="label">Phone: </font>
							<font color="yellow"><%out.println(c.getPhone()); %></font><br><br>
							<font color="white" id="label">Balance: </font>
							<font color="yellow"><%out.println(c.getBalance()) ;%></font><br><br>
							
							<% 
							}
							%>
							<br><br>
							<font color="red"  id="label"><%out.println(msg); %></font>
							
							</p>
							
							<div>     
								  <table align="center" id="subjects">
								    <thead>
								      <tr>
								        <th>ID</th>
								        <th>ACCOUNT NUMBER</th>
								        <th>INITIAL BALANCE</th>
								        <th>FINAL BALANCE</th>
								        <th>DATE</th>
								      </tr>
								    </thead>
								    <tbody>
								        
								<% 
								for(Transaction t:transactions){
								%>
								
								      <tr>
								        <td><%out.println(t.getTid());%></td>
								        <td><%out.println(t.getAccount_number()); %></td>
								        <td><%out.println(t.getInitial_balance()); %></td>
								        <td><%out.println(t.getFinal_balance()); %></td>
								        <td><%out.println(t.getDate()); %></td>
								      </tr>
								<% 
								}
								%>
								</p>
								    
								    </tbody>
								  </table>
								</div>
							
				
				
				
				
				
				
</div>

<br>
<br>
<br>
<br>
<div class="footer">
  Copyright &copy; Aryak's Banking Portal 2020 | MADE BY: Aryak Deshpande
</div>	
</body>
</html>