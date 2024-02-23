package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/likeservlet")
public class LikeServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = resp.getWriter();
		
		String operation = req.getParameter("operation");
		int uid=Integer.parseInt(req.getParameter("uid"));
		int pid=Integer.parseInt(req.getParameter("pid"));
		
//		out.print(operation+uid +pid);
		
		if(operation.equals("like")) {
			
			LikeDao likeDao=new LikeDao(ConnectionProvider.getConnection());
			boolean insertLike = likeDao.insertLike(pid, uid);
			out.print(insertLike);
			
		}
	}

}
