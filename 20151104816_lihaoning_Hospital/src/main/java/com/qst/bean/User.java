package com.qst.bean;

import java.sql.Date;

public class User {
	private int User_Id;
	private String User_Name;
	private String User_Iphone;
	private String User_Password;
	private String User_Sex;
	private Date User_Bir;
	
	
	public User(){}


	public User(int user_Id, String user_Name, String user_Iphone, String user_Password, String user_Sex,
			Date user_Bir) {
		super();
		User_Id = user_Id;
		User_Name = user_Name;
		User_Iphone = user_Iphone;
		User_Password = user_Password;
		User_Sex = user_Sex;
		User_Bir = user_Bir;
	}


	public int getUser_Id() {
		return User_Id;
	}


	public void setUser_Id(int user_Id) {
		User_Id = user_Id;
	}


	public String getUser_Name() {
		return User_Name;
	}


	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}


	public String getUser_Iphone() {
		return User_Iphone;
	}


	public void setUser_Iphone(String user_Iphone) {
		User_Iphone = user_Iphone;
	}


	public String getUser_Password() {
		return User_Password;
	}


	public void setUser_Password(String user_Password) {
		User_Password = user_Password;
	}


	public String getUser_Sex() {
		return User_Sex;
	}


	public void setUser_Sex(String user_Sex) {
		User_Sex = user_Sex;
	}


	public Date getUser_Bir() {
		return User_Bir;
	}


	public void setUser_Bir(Date user_Bir) {
		User_Bir = user_Bir;
	}
	

	
}
