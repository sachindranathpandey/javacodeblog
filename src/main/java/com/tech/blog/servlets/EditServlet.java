package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ResponseCache;
import java.sql.Connection;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/editservlet")
@MultipartConfig
public class EditServlet extends  HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		PrintWriter out = resp.getWriter();
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String gender=req.getParameter("gender");
		String about=req.getParameter("about");
		Part part = req.getPart("image");
		
		
		System.out.println("part is ");
		String imageName = part.getSubmittedFileName();
		
		HttpSession session = req.getSession();
		
		User user= (User)session.getAttribute("currentUser");
		
		 
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setGender(gender);
			user.setAbout(about);
			user.setProfile(imageName);
	
			
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		String path=req.getServletContext().getRealPath("/")+"pics"+File.separator+user.getProfile();
		System.out.println(path);
		Helper.deleteFile(path);
		boolean saveFile = Helper.saveFile(part.getInputStream(), path);
//		System.out.println(saveFile+"updated");
//		if(Helper.saveFile(part.getInputStream(), path)) {
//			
//			out.print("Profile Updated");
//			
//		}else {
//			out.print("Profile Not updated");
//		}
		
		
		if (part != null && part.getSize() > 0) {
            // File was uploaded, process it
            // Your file processing logic here
        } else {
            // File parameter was empty or null
            // Handle the case where no file was uploaded
            // You can send a message back to the user or perform any other action
            resp.getWriter().println("No file selected.");
        }
		boolean isSave = dao.updateUser(user);
		
		if (isSave) {
			
			resp.sendRedirect("profile.jsp");
			
		}else {
			System.err.println("Not Updated");
		}
		
	}
	
	
	public boolean isProfilePicUpdated() {
		
		boolean flag=false;
		
		
		return flag;
	}

}
