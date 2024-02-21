package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tech.blog.entities.User;



public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	
	// insert user to database
	
	public boolean saveUser(User user) {
		boolean flag=false;
		try {
			
			
			String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			pstmt.executeUpdate();
			flag=true;
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public User getUserByEmailAndPassword(String email,String password) {
		
		User user=null;
		
			try {
				String query="select * from user where email=? and password =?";
				PreparedStatement psmt = con.prepareStatement(query);
				psmt.setString(1, email);
				psmt.setString(2, password);
				
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					user=new User();
					user.setName(rs.getString("name"));
					user.setId(rs.getInt("id"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setAbout(rs.getString("about"));
					user.setGender(rs.getString("gender"));
					user.setDateTime(rs.getTimestamp("rdate"));
					user.setProfile(rs.getString("profile"));
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		return user;
		
		
	}
	
	public  boolean checkUserInDb(String email) throws SQLException {
		
		boolean flage = false;
		String SQL_SELECT = "SELECT * FROM USER";
	
		PreparedStatement preparedStatement = con.prepareStatement(SQL_SELECT);
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {

			String registered_email = resultSet.getString("email");

			if (registered_email.equals(email)) {
				flage = true;
				break;
			}

		}
		return flage;
	}
	
	public boolean updateUser(User user) {
	
		boolean flag=false;
		try {
			
			String query="update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.setString(6, user.getProfile());
			ps.setInt(7, user.getId());
			
			ps.executeUpdate();
			flag=true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	
}
