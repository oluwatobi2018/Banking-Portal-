package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Customer;
import com.beans.Transaction;
import com.service.AdminService;



public class AppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AdminService adminService=new AdminService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id==null) {
			request.setAttribute("msg", "");
			request.setAttribute("username", "");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			doPost(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		List list=new ArrayList();
		if(id.equals("login")) {
			//read validate and then send to homepage.jsp
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			if(username.equals("")&&password.equals("")) {
				request.setAttribute("msg", "");
				request.setAttribute("account_no", "");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
			else {
				//set attributes and a message if not valid
				request.setAttribute("msg", "INVALID CREDENTIALS!!!");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		
		if(id.equals("gohome")) {
			request.setAttribute("msg", "");
			request.setAttribute("account_no", "");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		
		
		if(id.equals("create_account")) {
			request.setAttribute("msg", "");
			request.setAttribute("name", "");
			request.setAttribute("address", "");
			request.setAttribute("email", "");
			request.setAttribute("phone", "");
			request.getRequestDispatcher("createAccount.jsp").forward(request, response);

		}

		if(id.equals("menu_choice")) {
			int cust_id=0;
			String account_number=request.getParameter("account_number");
			try {
				cust_id=adminService.validateAccountNumber(account_number);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
				if(cust_id!=0) {
					String operation=request.getParameter("task");
						List <Customer>custData=new ArrayList();
						int cid=0;
						try {
							custData=adminService.getCustomerData(cust_id);
							for(Customer c:custData) {
								cid=c.getCust_id();
							}
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						if(operation.equals("deposit")) {
							request.setAttribute("cid", cid);
							request.setAttribute("custData", custData);
							request.getRequestDispatcher("deposit.jsp").forward(request, response);
						}
						
						if(operation.equals("withdrawal")) {
							request.setAttribute("msg","");
							request.setAttribute("cid", cid);
							request.setAttribute("custData", custData);
							request.getRequestDispatcher("withdrawal.jsp").forward(request, response);
		
						}
				
						if(operation.equals("statement")) {
							List<Transaction>transactions=new ArrayList();
							try {
								transactions=adminService.getTransactions(account_number);
							} catch (ClassNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							request.setAttribute("cid", cid);
							request.setAttribute("custData", custData);
							request.setAttribute("msg", "");
							request.setAttribute("transactions",transactions);
							request.getRequestDispatcher("statement.jsp").forward(request, response);
						}
				}
				else {
					request.setAttribute("msg", "INVALID ACCOUNT NUMBER!!");
					request.setAttribute("account_no", account_number);
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}
			
		}
		
		if(id.equals("generate_account")) {
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			long account_number=name.hashCode();
			if(account_number<0) {
				account_number=account_number*(-1);
			}
			String account_Number=Long.toString(account_number);
			Customer c=new Customer();
			c.setName(name);
			c.setAddress(address);
			c.setEmail(email);
			c.setPhone(phone);
			c.setAccount_number(account_Number);
			try {
				adminService.addCustomer(c);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//give full fetch customer query in c and send full c to page
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("msg", "Account number is :"+account_Number);
			request.getRequestDispatcher("createAccount.jsp").forward(request, response);

		
		}
		
		
		if(id.equals("update_deposit")) {
			int cust_id=Integer.parseInt(request.getParameter("cid"));
			double deposit_amount=Double.parseDouble(request.getParameter("deposit_amt"));
			double new_balance=0.0;
			double old_balance=0.0;
			String account_no = null;
			List <Customer>custData=new ArrayList();
			try {
				custData=adminService.getCustomerData(cust_id);
				for(Customer c:custData) {
					account_no=c.getAccount_number();
					old_balance=c.getBalance();
					new_balance=c.getBalance()+deposit_amount;
				}
				adminService.saveTransaction(account_no,old_balance,new_balance);
				adminService.updateBalance(cust_id,new_balance);
				request.setAttribute("msg", "TRANSACTION COMPLETED SUCCESSFULLY.");
				request.setAttribute("account_no", "");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		if(id.equals("deletePage")) {
			request.setAttribute("account_no", "");
			request.setAttribute("msg", "");
			request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
		}
		
		
		
		if(id.equals("update_withdrawal")) {
			int cust_id=Integer.parseInt(request.getParameter("cid"));
			double withdrawal_amount=Double.parseDouble(request.getParameter("withdrawal_amt"));
			double new_balance=0.0;
			double old_balance=0.0;
			String account_no = null;
			List <Customer>custData=new ArrayList();
			try {
				custData=adminService.getCustomerData(cust_id);
				for(Customer c:custData) {
					if(c.getBalance()<withdrawal_amount) {
						request.setAttribute("msg", "Insufficient balance!!");
						request.setAttribute("cid", cust_id);
						request.setAttribute("custData", custData);
						request.getRequestDispatcher("withdrawal.jsp").forward(request, response);
					}
					else {
						account_no=c.getAccount_number();
						old_balance=c.getBalance();
						new_balance=c.getBalance()-withdrawal_amount;
						adminService.saveTransaction(account_no,old_balance,new_balance);
						adminService.updateBalance(cust_id,new_balance);
						request.setAttribute("msg", "TRANSACTION COMPLETED SUCCESSFULLY.");
						request.setAttribute("account_no", "");
						request.getRequestDispatcher("home.jsp").forward(request, response);
					}
					
				}
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		if(id.equals("delete_account")) {
			int cust_id=0;
			String account_number=request.getParameter("account_number");
			try {
				cust_id=adminService.validateAccountNumber(account_number);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(cust_id!=0) {
				try {
					System.out.println(cust_id);
					adminService.deleteAccount(cust_id);
					adminService.deleteTransactions(account_number);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("msg", "Account deleted succesfully.");
				request.setAttribute("account_no", "");
				request.getRequestDispatcher("home.jsp").forward(request, response);
				
			}
			else {
				request.setAttribute("msg", "INVALID ACCOUNT NUMBER!!");
				request.setAttribute("account_no", account_number);
				request.getRequestDispatcher("deleteAccount.jsp").forward(request, response);
			}
		}
		
	}

}
