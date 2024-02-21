package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addpost")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = resp.getWriter();
		
		String parameter = req.getParameter("cid");
		System.out.println(parameter);
	//	int cid = Integer.parseInt(req.getParameter("cid"));
		//System.out.println(req.getParameter("cid"));
//		String ptitle = req.getParameter("ptitle");
//		String pcontent = req.getParameter("pcontent");
//		String pcode = req.getParameter("pcode");
//		Part part=req.getPart("pic");
//		
//		HttpSession session = req.getSession();
//		User user = (User)session.getAttribute("currentUser");
//		
//		String file = part.getSubmittedFileName();
		
//		Post post=new Post(ptitle, pcontent, pcode, file, null, cid, user.getId());
//		
//		PostDao dao=new PostDao(ConnectionProvider.getConnection());
//		boolean flag = dao.savePost(post);
//		if (flag) {
//			out.print("sucess");
//		}
//		out.print("error");
	}

}
