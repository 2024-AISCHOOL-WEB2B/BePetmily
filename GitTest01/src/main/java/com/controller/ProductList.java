package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ProductDAO;
import com.model.ProductDTO;

@WebServlet("/ItemList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int curPage = Integer.parseInt(request.getParameter("curPage"));
		
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductDTO> products = dao.getProductList(curPage);
		
	}

}
