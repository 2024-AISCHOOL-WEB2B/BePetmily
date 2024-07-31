package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DisDAO;
import com.model.DisDTO;

@WebServlet("/DiseasePredict")
public class DiseasePredict extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String disName = request.getParameter("disName");
//		System.out.println(disName);

		DisDAO dao = new DisDAO();
		DisDTO disease = dao.getDis(disName);

		if (disease != null) {
			HttpSession session = request.getSession();
			System.out.println(disease.getDisName());
			session.setAttribute("disease", disease);
		}

		response.sendRedirect("DiseasePrediction.jsp");

	}

}
