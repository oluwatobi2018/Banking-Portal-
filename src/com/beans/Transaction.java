package com.beans;

public class Transaction {
	private int tid;
	private String account_number;
	private double initial_balance;
	private double final_balance;
	private String date;
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public double getInitial_balance() {
		return initial_balance;
	}
	public void setInitial_balance(double initial_balance) {
		this.initial_balance = initial_balance;
	}
	public double getFinal_balance() {
		return final_balance;
	}
	public void setFinal_balance(double final_balance) {
		this.final_balance = final_balance;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	

}
