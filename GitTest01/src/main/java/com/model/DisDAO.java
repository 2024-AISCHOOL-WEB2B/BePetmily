package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DisDAO {

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

	public DisDTO getDis(String disName) {
		DisDTO disease = null;
		getConnection();

		try {
			String sql = "SELECT * FROM DISEASE WHERE DISEASE_NAME = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, disName);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String disTreate = rs.getString("DISEASE_TREAT");
				String diseaseName = rs.getString("DISEASE_INFO");

				disease = new DisDTO(disName, disTreate, diseaseName);
			}

		} catch (SQLException e) {
			System.out.println("sql 구문 오류");
			e.printStackTrace();
		} finally {
			close();
		}

		return disease;
	}

}
