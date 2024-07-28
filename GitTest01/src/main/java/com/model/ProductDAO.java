package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_id = "Insa5_SpringB_hacksim_3";
			String db_pw = "aishcool3";
			String db_url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("동적 로딩 실패");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("권한 확인 실패");
		}
	}

	private void close() {
		try {
			// rs는 사용된 적이 없으면 반납하지 않도록
			// insert, update, delete메서드에서xx
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("자원 반납 오류");
		}
	}

	public ArrayList<ProductDTO> getProductList(int curPage) {

		ArrayList<ProductDTO> products = new ArrayList<>();

		getConnection();

		try {
			String sql = "SELECT * FROM PRODUCT WHERE ROWNUM>=? AND ROWNUM <=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, (curPage - 1) * 15 + 1);
			psmt.setInt(2, curPage * 15);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				int productId = rs.getInt("PRODUCT_ID");
				String productName = rs.getString("PRODUCT_NAME");
				String productPrice = rs.getString("PRODUCT_PRICE");
				String productCate = rs.getString("PRODUCT_CATEGORY");
				int stock = rs.getInt("STOCK");
				String productUrl = rs.getString("PRODUCT_URL");
				ProductDTO dto = new ProductDTO(productId, productName, productPrice, productCate, stock, productUrl);
				products.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return products;
	}

}
