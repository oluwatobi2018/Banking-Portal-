package com.service;

import java.sql.SQLException;
import java.util.List;

import com.beans.Customer;
import com.model.DBConfig;

public class AdminService {
    DBConfig db=new DBConfig();
	public void addCustomer(Customer c) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.addCustomer(c);
	}
	public int validateAccountNumber(String account_number) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.validateAccountNumber(account_number);
	}
	public List<Customer> getCustomerData(int cust_id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getCustomerData(cust_id);
	}
	public void updateBalance(int cust_id, double new_balance) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.updateBalance(cust_id,new_balance);
		
	}
	public void saveTransaction(String account_no, double old_balance, double new_balance) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.saveTransaction(account_no,old_balance,new_balance);
		
	}
	public void deleteAccount(int cust_id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.deleteAccount(cust_id);
		
	}
	public List getTransactions(String account_number) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getTransactions(account_number);
	}
	public void deleteTransactions(String account_number) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.deleteTransactions(account_number);
		
	}

}
