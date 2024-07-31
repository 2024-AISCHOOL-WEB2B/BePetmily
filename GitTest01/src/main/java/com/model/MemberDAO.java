package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    private Connection conn;

    // 데이터베이스 연결 초기화
    public MemberDAO() {
        try {
            Class.forName("oracle.jdbc.OracleDriver"); // 드라이버 클래스 이름 확인
            String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe"; // 데이터베이스 URL
            String username = "Insa5_SpringB_hacksim_3"; // 사용자 이름
            String password = "aishcool3"; // 비밀번호
            conn = DriverManager.getConnection(url, username, password);
            if (conn != null) {
                System.out.println("데이터베이스 연결이 성공적으로 설정되었습니다.");
            } else {
                System.err.println("데이터베이스 연결 설정에 실패했습니다.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("JDBC 드라이버 로드 실패: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("데이터베이스 연결 실패: " + e.getMessage());
        }
    }

    // 데이터베이스 연결 종료
    public void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 글 저장 메서드
    public int writeSave(MemberDTO dto) throws SQLException {
        int postId = 0;
        String sqlPost = "INSERT INTO POSTS (POST_ID, TITLE, CONTENT, AUTHOR_ID, POST_DATE, LIKES) VALUES (?, ?, ?, ?, ?, ?)";
        String sqlImage = "INSERT INTO IMAGE (image_id, POST_ID, IMAGE_PATH) VALUES (IMAGE_SEQ.NEXTVAL, ?, ?)";

        if (conn == null) {
            System.err.println("데이터베이스 연결이 초기화되지 않았습니다.");
            return postId;
        }

        try (
            // POST_ID 시퀀스 값 생성
            PreparedStatement seqStmt = conn.prepareStatement("SELECT post_id_seq.NEXTVAL FROM IMAGE");
            ResultSet seqRs = seqStmt.executeQuery();
        ) {
            if (seqRs.next()) {
                postId = seqRs.getInt(1);
            }

            try (
                PreparedStatement pstmtPost = conn.prepareStatement(sqlPost);
                PreparedStatement pstmtImage = conn.prepareStatement(sqlImage);
            ) {
                // 게시글 저장
                pstmtPost.setInt(1, postId); // POST_ID 값 설정
                pstmtPost.setString(2, dto.getTitle());
                pstmtPost.setString(3, dto.getContent());
                pstmtPost.setString(4, dto.getAuthorId());
                pstmtPost.setTimestamp(5, dto.getPostDate());
                pstmtPost.setInt(6, dto.getLikes());

                int affectedRows = pstmtPost.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("게시글 저장 실패, no rows affected.");
                }

                // 이미지 저장
                pstmtImage.setInt(1, postId);
                pstmtImage.setString(2, dto.getImgFile());
//                pstmtImage.setInt(3, 1); // product_id는 임의로 1로 설정
                pstmtImage.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return postId;
    }

    // 글 ID로 글 조회
    public MemberDTO getPostById(int postId) {
        MemberDTO dto = null;

        if (conn == null) {
            System.err.println("데이터베이스 연결이 초기화되지 않았습니다.");
            return dto;
        }

        try {
            String sql = "SELECT * FROM POSTS WHERE POST_ID = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, postId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        dto = new MemberDTO();
                        dto.setPostId(rs.getInt("POST_ID"));
                        dto.setTitle(rs.getString("TITLE"));
                        dto.setContent(rs.getString("CONTENT"));
                        dto.setAuthorId(rs.getString("AUTHOR_ID"));
                        dto.setPostDate(rs.getTimestamp("POST_DATE"));
                        dto.setLikes(rs.getInt("LIKES"));
                    }
                }
            }

            // 이미지 정보 추가 조회
            String sqlImage = "SELECT IMAGE_PATH FROM IMAGE WHERE POST_ID = ?";
            try (PreparedStatement pstmtImage = conn.prepareStatement(sqlImage)) {
                pstmtImage.setInt(1, postId);
                try (ResultSet rsImage = pstmtImage.executeQuery()) {
                    if (rsImage.next() && dto != null) {
                        dto.setImgFile(rsImage.getString("IMAGE_PATH"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dto;
    }

    // 모든 게시물 조회
    public List<MemberDTO> getAllPosts() {
        List<MemberDTO> posts = new ArrayList<>();
        if (conn == null) {
            System.err.println("데이터베이스 연결이 초기화되지 않았습니다.");
            return posts;
        }
        try {
            String sql = "SELECT * FROM POSTS ORDER BY POST_DATE DESC";
            try (PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MemberDTO dto = new MemberDTO();
                    dto.setPostId(rs.getInt("POST_ID"));
                    dto.setTitle(rs.getString("TITLE"));
                    dto.setContent(rs.getString("CONTENT"));
                    dto.setAuthorId(rs.getString("AUTHOR_ID"));
                    dto.setPostDate(rs.getTimestamp("POST_DATE"));
                    dto.setLikes(rs.getInt("LIKES"));

                    // 이미지 정보 추가 조회
                    String sqlImage = "SELECT IMAGE_PATH FROM IMAGE WHERE POST_ID = ?";
                    try (PreparedStatement pstmtImage = conn.prepareStatement(sqlImage)) {
                        pstmtImage.setInt(1, dto.getPostId());
                        try (ResultSet rsImage = pstmtImage.executeQuery()) {
                            if (rsImage.next()) {
                                dto.setImgFile(rsImage.getString("IMAGE_PATH"));
                            }
                        }
                    }

                    posts.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
}
