package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FacDAO {

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

	public ArrayList<FacDTO> getFacs(String latitude, String longitude,String cate) {

		ArrayList<FacDTO> facs = new ArrayList<FacDTO>();
		
		double lat = Double.parseDouble(latitude);
		double lon = Double.parseDouble(longitude);
				
		getConnection();

		try {
			String sql = "SELECT * FROM (SELECT FACILITY.*, "
			        + "(6371 * acos(cos(? * (3.141592653589793 / 180)) * cos(FAC_LAT * (3.141592653589793 / 180)) * "
			        + "cos((FAC_LONG - ?) * (3.141592653589793 / 180)) + sin(? * (3.141592653589793 / 180)) * "
			        + "sin(FAC_LAT * (3.141592653589793 / 180)))) AS distance "
			        + "FROM FACILITY "
			        + "WHERE FAC_CATEGORY=?) DATA WHERE DATA.distance < 5";


			psmt = conn.prepareStatement(sql);
			
			psmt.setDouble(1, lat);
			psmt.setDouble(2, lon);
			psmt.setDouble(3, lat);
			psmt.setString(4, cate);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int facId = rs.getInt("FAC_ID");
				String facName = rs.getString("FAC_NAME");
				String facLat = rs.getString("FAC_LAT");
				String facLong = rs.getString("FAC_Long");
				String facCategory = rs.getString("FAC_CATEGORY");
				String facAddress = rs.getString("FAC_ADDRESS");
				String facTel = rs.getString("FAC_TEL");
				FacDTO dto = new FacDTO(facId, facName, facLat, facLong, facCategory, facAddress, facTel);

				facs.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql 오류");
		} finally {
			close();
		}

		return facs;
	}

}
