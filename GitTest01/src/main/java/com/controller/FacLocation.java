package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.FacDAO;
import com.model.FacDTO;

@WebServlet("/FacLocation")
public class FacLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String latitude = request.getParameter("latitude");
    	String longitude = request.getParameter("longitude");
        String cate = request.getParameter("cate");
        
//        System.out.println("Category: " + cate);
//        System.out.println("Latitude: " + latitude);
//        System.out.println("Longitude: " + longitude); 	//jsp 에서 잘 받아와 지는지 확인

        FacDAO dao = new FacDAO();
        ArrayList<FacDTO> facs = dao.getFacs(latitude, longitude, cate);
        
//        for(FacDTO fac : facs) {
//        	System.out.println(fac.getFacId());		//객체 생성 확인
//        }		
        
        request.setAttribute("facs", facs);
        request.getRequestDispatcher("/map.jsp").forward(request, response);

    }
}

