package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

public class userDAO {

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

	public int join(userDTO dto) {

		int cnt = 0;

		getConnection();

		try {
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,SYSDATE)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getPw());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getPhone());

			cnt = psmt.executeUpdate();

			if (cnt > 0)
				System.out.println("추가 성공");
			else
				System.out.println("추가 실패");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("권한1 확인 실패");
		} finally {
			close();
		}
		return cnt;
	}

	public userDTO login(userDTO dto) {

		userDTO info = null;

		getConnection();

		try {
			String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getId());

			rs = psmt.executeQuery();

			if (rs.next()) {
				// 아이디 조회 성공
				String hashedpassword = rs.getString("PW");
				if(BCrypt.checkpw(dto.getPw(), hashedpassword)) {
					String id = rs.getString("MEMBER_ID");
					String email = rs.getString("EMAIL");
					String pw = rs.getString("PW");
					String name = rs.getString("NAME");
					String phone = rs.getString("PHONE");
					info = new userDTO(id, pw, name, email, phone);
				}else {
					System.out.println("아이디 오류");
				}				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("sql오류");
		} finally {
			close();
		}

		return info;
	}

	public int update(userDTO dto) {
		int cnt = 0;

		getConnection();

		try {
			String sql = "UPDATE MEMBER SET PW = ?, PHONE = ?  WHERE EMAIL = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getEmail());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public String idcheck(String inputE) {
		// TODO Auto-generated method stub
		return null;
	}

}
