package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beans.Customer;
import com.beans.Transaction;


public class DBConfig {
				String url="jdbc:mysql://localhost:3306/bank";
				String username="root";
				String password="";
				String driver="com.mysql.jdbc.Driver";
				Connection conn;
			
				//Step 2
				private void dbConnect() throws ClassNotFoundException, SQLException{
					//Load the driver
					Class.forName(driver);
					//establish the connection
					conn = DriverManager.getConnection(url, username, password);
				}

			public void addCustomer(Customer c) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				 dbConnect();
				 String sql="insert into customer(name,email,phone,address,account_number)values(?,?,?,?,?)";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1,c.getName());
				 pstmt.setString(2,c.getEmail());
				 pstmt.setString(3,c.getPhone());
				 pstmt.setString(4,c.getAddress());
				 pstmt.setString(5,c.getAccount_number());
				 pstmt.executeUpdate();	
				
			}

			public int validateAccountNumber(String account_number) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				int id=0;
				dbConnect();
			
				String sql="select id from customer where account_number=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,account_number);
				
				ResultSet rst=pstmt.executeQuery();
				while(rst.next()) {	
					 id=rst.getInt("id");
			    } 
				return id;
			}

			public List<Customer> getCustomerData(int cust_id) throws ClassNotFoundException, SQLException {
				dbConnect();
				String sql="select * from customer where id=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,cust_id);
				ResultSet rst = pstmt.executeQuery();
				 List<Customer> list = new ArrayList<>();
				 while(rst.next()){
					 int id = rst.getInt("id");
					 String name = rst.getString("name");
					 String email = rst.getString("email");
					 String address = rst.getString("address");
					 String phone = rst.getString("phone");
					 String account_number=rst.getString("account_number");
					 double balance=rst.getDouble("balance");
					 Customer c=new Customer();
					 c.setCust_id(id);
					 c.setName(name);
					 c.setEmail(email);
					 c.setAddress(address);
					 c.setPhone(phone);
					 c.setBalance(balance);
					 c.setAccount_number(account_number);
					 list.add(c); 
				 }
				 rst.close();
				 pstmt.close();
				return list;
				
			}

			public void updateBalance(int cust_id, double new_balance) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				 dbConnect();
				 String sql="update customer set balance=? where id=?";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setDouble(1,new_balance);
				 pstmt.setInt(2,cust_id);
				 pstmt.executeUpdate();
				
			}

			public void saveTransaction(String account_no, double old_balance, double new_balance) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				 dbConnect();
				 String sql="insert into transaction(account_number,initial_balance,final_balance)values(?,?,?)";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1,account_no );
				 pstmt.setDouble(2,old_balance );
				 pstmt.setDouble(3,new_balance );
				 pstmt.executeUpdate();
			}

			public void deleteAccount(int cust_id) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				dbConnect();
				 String sql="delete from customer where id=?";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setInt(1,cust_id);
				 
				 pstmt.executeUpdate();
				
			}

			public List getTransactions(String account_number) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				dbConnect();
				String sql="select * from transaction where account_number=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,account_number);
				ResultSet rst = pstmt.executeQuery();
				 List<Transaction> list = new ArrayList<>();
				 while(rst.next()){
					 int tid = rst.getInt("tid");
					 String account_no=rst.getString("account_number");
					 double initial_balance=rst.getDouble("initial_balance");
					 double final_balance=rst.getDouble("final_balance");
					 String date=rst.getString("date");
					 Transaction t=new Transaction();
					 t.setTid(tid);
					 t.setAccount_number(account_no);
					 t.setInitial_balance(initial_balance);
					 t.setFinal_balance(final_balance);
					 t.setDate(date);
					 list.add(t); 
				 }
				 rst.close();
				 pstmt.close();
				return list;
			}

			public void deleteTransactions(String account_number) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				dbConnect();
				 String sql="delete from transaction where account_number=?";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1,account_number);
				 
				 pstmt.executeUpdate();
				
			}

}
