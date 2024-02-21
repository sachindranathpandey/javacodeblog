package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		//out.print("Login" + email +" "+password);
		
		System.out.println(ConnectionProvider.getConnection());
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
	
		User user = dao.getUserByEmailAndPassword(email, password);
		
		if(user!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("currentUser", user);
			
			resp.sendRedirect("profile.jsp"); 
			
		}else {
			HttpSession s=req.getSession();
			Message message=new Message("Invalid Email or Password! Try again", "error", "alert alert-danger");
			s.setAttribute("msg", message);
			resp.sendRedirect("login.jsp");
		}
	}

}
