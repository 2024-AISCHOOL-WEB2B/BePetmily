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

	public ArrayList<FacDTO> getFacs(String latitude, String longitude, String cate) {

		ArrayList<FacDTO> facs = new ArrayList<FacDTO>();

		double lat = Double.parseDouble(latitude);
		double lon = Double.parseDouble(longitude);
		String all = "SELECT FAC_CATEGORY FROM FACILITY";
		getConnection();

		try {
			String sql = "SELECT * FROM (SELECT FACILITY.*, "
					+ "(6371 * acos(cos(? * (3.141592653589793 / 180)) * cos(FAC_LAT * (3.141592653589793 / 180)) * "
					+ "cos((FAC_LONG - ?) * (3.141592653589793 / 180)) + sin(? * (3.141592653589793 / 180)) * "
					+ "sin(FAC_LAT * (3.141592653589793 / 180)))) AS distance " + "FROM FACILITY "
					+ "WHERE FAC_CATEGORY IN (?)) DATA WHERE DATA.distance < 5";

			psmt = conn.prepareStatement(sql);

			psmt.setDouble(1, lat);
			psmt.setDouble(2, lon);
			psmt.setDouble(3, lat);
			if (!cate.equals("all")) {
				psmt.setString(4, cate);
			} else {
				psmt.setString(4, all);
			}

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

	public int getTotal(String cate) {
		int totalCnt = 0;

		getConnection();

		try {
			String sql = "SELECT COUNT(*) AS CNT FROM FACILITY WHERE CATE = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, cate);

			rs = psmt.executeQuery();

			if (rs.next()) {
				totalCnt = rs.getInt("CNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql 구문 오류");
		}finally {
			close();
		}

		return totalCnt;
	}

//	public ArrayList<Double> getDistance(ArrayList<FacDTO> facs, String latitude, String longitude) {
//		ArrayList<Double> distances = null;
//		for (FacDTO fac : facs) {
//			double dLat = Math.toRadians(Double.parseDouble(fac.getFacLat()) - Double.parseDouble(latitude));
//			double dLon = Math.toRadians(Double.parseDouble(fac.getFacLon()) - Double.parseDouble(longitude));
//			double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(Double.parseDouble(latitude)) * Math.cos(Math.toRadians(Double.parseDouble(fac.getFacLat()) * Math.sin(dLon / 2) * Math.sin(dLon / 2))));
//			double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//			double d = 6371 * c; 
//			
//			distances.add(d);
//			
//		}
//		return distances;
//	}

}
