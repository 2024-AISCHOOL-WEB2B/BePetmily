package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ImageDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.PageDTO;

@WebServlet("/postList")
public class postList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		List<MemberDTO> posts = dao.getAllPosts();		
		
		
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("/album_list.jsp").forward(request, response);
	}

}
