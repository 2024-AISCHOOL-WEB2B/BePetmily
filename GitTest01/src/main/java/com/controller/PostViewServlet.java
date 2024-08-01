package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;


@WebServlet("/PostViewServlet")
public class PostViewServlet extends HttpServlet {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
	    	
	    	request.setCharacterEncoding("UTF-8"); // 인코딩 설정
	    	
	    	String postId = request.getParameter("postId");
	        String action = request.getParameter("action");
	        MemberDAO dao = new MemberDAO();
	        
	        List<MemberDTO> postOne = dao.getOnePosts(postId);
	        
	        

	        request.setAttribute("postOne", postOne);
	        request.getRequestDispatcher("/post_view.jsp").forward(request, response);

	        response.sendRedirect("album_list.jsp");
	        
	    }
	}
