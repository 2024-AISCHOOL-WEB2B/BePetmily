package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ImageDTO;
import com.model.PageDTO;
import com.model.ProductDAO;
import com.model.ProductDTO;

@WebServlet("/ItemList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageSize = 15;
		int curPage = Integer.parseInt(request.getParameter("curPage"));
		String cate = request.getParameter("cate");
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductDTO> products = dao.getProductList(curPage,cate);		
		int totalCnt = dao.getTotal(cate);
		PageDTO pages = new PageDTO(curPage, pageSize, totalCnt);
		
		
		request.setAttribute("products", products);
		request.setAttribute("pages", pages);
		request.getRequestDispatcher("/item_list.jsp").forward(request, response);
	}

}
