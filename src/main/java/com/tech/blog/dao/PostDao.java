package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	
	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category>  getAllCategories(){
		
		ArrayList<Category> list=new ArrayList<>();
		
		try {
			String query="select * from categories";
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				int id = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category catg=new Category(id,name,description);
				list.add(catg);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean savePost(Post p) {
		boolean flag=false;
		
		try {
			
			String q="insert into post(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setString(1, p.getPtitle());
			psmt.setString(2, p.getPcontent());
			psmt.setString(3, p.getPcode());
			psmt.setString(4, p.getPpic());
			psmt.setInt(5, p.getCatid());
			psmt.setInt(6, p.getUserId());
			
			
			psmt.executeLargeUpdate();
			flag=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
	
	

}
