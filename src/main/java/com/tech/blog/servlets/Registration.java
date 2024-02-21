package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
@MultipartConfig
public class Registration extends HttpServlet {

	
 static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = resp.getWriter();
		
		
		try {
			Thread.sleep(1000);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	    String name = req.getParameter("name");
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    String gender = req.getParameter("gender");
	    String about = req.getParameter("about");
	    String check = req.getParameter("check");
	    
	    User user=new User(name,email,password,gender,about);
	    UserDao dao=new UserDao(ConnectionProvider.getConnection());
	    
	    
	    	try {
				boolean isExist = dao.checkUserInDb(email);
				if (isExist) {
					out.print("already_registered");
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   
	    if (check==null) {
			out.print("terms");
		}else {
			 boolean flag=dao.saveUser(user);
			 if (flag) {
				out.print("success");
			}else {
				out.print("failed");
			}
		}    
	    
	}
}

