package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.model.userDAO;
import com.model.userDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String hashedPassword = BCrypt.hashpw(pw, BCrypt.gensalt());
		
		userDAO dao = new userDAO();
		userDTO dto = new userDTO(id, hashedPassword, name, email, phone);
		
		int cnt = dao.join(dto);
		
		if (cnt > 0)
			System.out.println("회원가입 성공");
		else
			System.out.println("회원가입 실패");

		response.sendRedirect("main.jsp");

	}

}
