package com.tech.blog.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.helper.ConnectionProvider;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {

		ArrayList<Category> list = new ArrayList<>();

		try {
			String query = "select * from categories";
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {

				int id = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category catg = new Category(id, name, description);
				list.add(catg);
			}

		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}
		return list;
	}

	public boolean savePost(Post p, InputStream inputStream) {
		boolean flag = false;

		try {

			String q = "insert into post(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
			PreparedStatement psmt = con.prepareStatement(q);
			psmt.setString(1, p.getPtitle());
			psmt.setString(2, p.getPcontent());
			psmt.setString(3, p.getPcode());
			psmt.setBlob(4, inputStream);
			psmt.setInt(5, p.getCatid());
			psmt.setInt(6, p.getUserId());
			psmt.executeLargeUpdate();
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	// Function to retrieve all the post

	public List<Post> getAllPosts() {

		List<Post> list = new ArrayList<>();

		try {
			Connection con = ConnectionProvider.getConnection();
			String query = "select * from post order by pdate DESC";
			PreparedStatement psmt = con.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			 InputStream inputStream = null;
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				inputStream = rs.getBinaryStream("ppic");
				int catid=rs.getInt("catid");
				int userid=rs.getInt("userid");
				Timestamp date=rs.getTimestamp("pdate");
				
				Post post=new Post(pid, ptitle, pcontent, pcode, inputStream, date, catid, userid);
				list.add(post);
			}	
		

		} catch (Exception e) {

			e.printStackTrace();
		}
		return list;
	

	}

	// Function to retrieve the post by catid

	public List<Post> getAllPostsByCategoryId(int catid) {

		List<Post> list = new ArrayList<>();

		try {
			Connection con = ConnectionProvider.getConnection();
			String query = "select * from post where catid=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, catid);
			ResultSet rs = psmt.executeQuery();
			 InputStream inputStream = null;
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				inputStream = rs.getBinaryStream("ppic");
				int userid=rs.getInt("userid");
				Timestamp date=rs.getTimestamp("pdate");
				
				Post post=new Post(pid, ptitle, pcontent, pcode, inputStream, date, catid, userid);
				list.add(post);
			}	
		

		} catch (Exception e) {

			e.printStackTrace();
		}
		return list;
	}
}
