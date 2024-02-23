package com.tech.blog.entities;

import java.io.InputStream;
import java.sql.Timestamp;

import com.mysql.cj.jdbc.Blob;

public class Post {
	
	

	private int pid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private InputStream ppic;
	private Timestamp pdate;
	private int catid;
	private int userId;
	
	
	public Post() {
		
	}


	public Post(int pid, String ptitle, String pcontent, String pcode, InputStream ppic, Timestamp pdate, int catid,int userId) {
		
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userId=userId;
	}


	public Post(String ptitle, String pcontent, String pcode, InputStream ppic, Timestamp pdate, int catid,int userId) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userId=userId;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPtitle() {
		return ptitle;
	}


	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}


	public String getPcontent() {
		return pcontent;
	}


	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}


	public String getPcode() {
		return pcode;
	}


	public void setPcode(String pcode) {
		this.pcode = pcode;
	}


	public InputStream getPpic() {
		return ppic;
	}


	public void setPpic(InputStream ppic) {
		this.ppic = ppic;
	}


	public Timestamp getPdate() {
		return pdate;
	}


	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}


	public int getCatid() {
		return catid;
	}


	public void setCatid(int catid) {
		this.catid = catid;
	}

	

	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Post [pid=" + pid + ", ptitle=" + ptitle + ", pcontent=" + pcontent + ", pcode=" + pcode + ", ppic="
				+ ppic + ", pdate=" + pdate + ", catid=" + catid + "]";
	} 
	
	
	
	
	
	
}
