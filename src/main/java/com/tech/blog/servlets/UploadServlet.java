package com.tech.blog.servlets;
import com.tech.blog.entities.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.commons.io.output.ProxyOutputStream;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        if(request.getParameter("cid")==null) {
        	out.print("selectoption");
        	return;
        }
		final String path=request.getServletContext().getRealPath("/")+"pics";
        final Part filePart = request.getPart("file");
        int cid=Integer.parseInt(request.getParameter("cid"));
        String ptitle=request.getParameter("ptitle");
        String pcontent=request.getParameter("pcontent");
        String pcode=request.getParameter("pcode");
        InputStream inputStream = null;
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("currentUser");
        Connection con=ConnectionProvider.getConnection();
        PostDao dao=new  PostDao(con);	
       
        inputStream = filePart.getInputStream();
        
        Post post=new Post(ptitle, pcontent, pcode, inputStream,null,cid, user.getId());
        boolean savePost = dao.savePost(post, post.getPpic());
       
      
        if(savePost) {
        	
        	out.println("success");
        	
        }else {
        	out.println("error");
        }
    }
}
