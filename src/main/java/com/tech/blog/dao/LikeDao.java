package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {

	Connection con;
	
	public LikeDao(Connection con) {
		
		this.con=con;
	}

	public boolean insertLike(int pid,int uid) {
		
		boolean flag=false;
		 try {
			 
			 String query="insert into liked(pid,uid) values(?,?)";
			 PreparedStatement psmt=this.con.prepareStatement(query);
			 psmt.setInt(1, pid);
			 psmt.setInt(2, uid);
			 
			psmt.executeUpdate();
			flag=true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		 return flag;
		
	}
	
	public int countLikeOnPost(int pid) {
		
		int count=0;
		
		
		try {
			String query="select count(*) from liked where pid=?";
			PreparedStatement psmt=this.con.prepareStatement(query);
			psmt.setInt(1,pid);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(*)");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	
	public boolean isLikedByUser(int pid, int uid) {
		boolean flage=false;
		
		try {
			 String query="select * from liked wherer  pid= ? AND uid=?)";
			 PreparedStatement psmt=this.con.prepareStatement(query);
			 psmt.setInt(1, pid);
			 psmt.setInt(2, uid);
			 
			 ResultSet rs = psmt.executeQuery();
			 
			 if(rs.next()) {
				 flage=true;
			 }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flage;
	}
	
	
	public boolean deleteLike(int pid, int uid) {
		boolean flage=false;
		
		
		
		try {
			String query="delete from liked where pid=? AND uid=?";
			PreparedStatement p=this.con.prepareStatement(query);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			flage=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flage;
	}
}
