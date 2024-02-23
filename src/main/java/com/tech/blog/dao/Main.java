package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.tech.blog.helper.ConnectionProvider;

public class Main {
	
	public static void main(String[] args) {
		
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		PostDao postDao=new PostDao(ConnectionProvider.getConnection());
		String name = postDao.getUserNameByID(6);
		System.out.println("posted by" + name);
		
		try {
			boolean checkUserInDb = dao.checkUserInDb("pranav@gmail.com");
			 
			System.out.println(checkUserInDb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
