package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.net.URLEncoder;
import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/UploadphotoServlet")
@MultipartConfig
public class UploadphotoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads"; // 업로드할 파일의 디렉토리

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // 인코딩 설정
        HttpSession session = request.getSession(); // 세션 가져오기
        
        
        session.setAttribute("login_id", "admin");
        // 세션에서 Author_ID 가져오기
        String authorID = (session != null && session.getAttribute("Author_ID") != null) 
                ? session.getAttribute("Author_ID").toString() 
                : "12345"; // 기본값 설정
        
        
        authorID = session.getAttribute("login_id").toString();
        

        // 파일 업로드 처리
        String imgFile = null;
        List<MemberDTO> posts = null;
        try {
            // 업로드 디렉토리 경로 설정
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // 파일 파트 처리
            Part filePart = request.getPart("file");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                if (isValidFileName(fileName)) {
                    imgFile = UPLOAD_DIR + File.separator + fileName;
                    filePart.write(uploadPath + File.separator + fileName);
                    System.out.println("파일 업로드 완료: " + imgFile);
                } else {
                    System.out.println("유효하지 않은 파일 이름: " + fileName);
                    response.sendRedirect("error.jsp?msg=" + URLEncoder.encode("유효하지 않은 파일 이름입니다.", "UTF-8"));
                    return;
                }
            } else {
                System.out.println("파일이 선택되지 않았습니다.");
                response.sendRedirect("error.jsp?msg=" + URLEncoder.encode("파일이 선택되지 않았습니다.", "UTF-8"));
                return;
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=" + URLEncoder.encode("파일 업로드 오류.", "UTF-8"));
            return;
        }

        // DTO 준비 및 DB에 저장
        MemberDTO dto = new MemberDTO();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setImgFile(imgFile); // 이미지 파일 경로
        dto.setAuthorId(authorID); // 작성자 ID
        dto.setPostDate(new java.sql.Timestamp(System.currentTimeMillis())); // 현재 시간 설정
        dto.setLikes(0); // 초기 좋아요 수 설정

        MemberDAO dao = new MemberDAO();
        int result = 0;
        try {
            result = dao.writeSave(dto);
            System.out.println("writeSave 호출됨, 결과: " + result);
            if (result > 0) {
                System.out.println("게시물 저장 성공");

                posts = dao.getAllPosts(); // 모든 게시물 조회
                request.setAttribute("posts", posts); // 게시물 목록을 request에 설정
//                response.sendRedirect("board.jsp"); // 성공 시 게시판 페이지로 리디렉션
                request.getRequestDispatcher("album_list.jsp").forward(request, response);
            } else {
                System.out.println("게시물 저장 실패");
                response.sendRedirect("error.jsp?msg=" + URLEncoder.encode("게시물 저장 실패.", "UTF-8"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?msg=" + URLEncoder.encode("데이터베이스 저장 오류.", "UTF-8"));
        } finally {
            if (dao != null) {
                dao.close(); // DAO 연결 종료
            }
        }
    }

    // 유효한 파일 이름 검사
    private boolean isValidFileName(String fileName) {
        // 파일 이름이 비어있지 않고, 허용된 확장자만 포함되어 있는지 검사
        return fileName != null && !fileName.isEmpty() && fileName.matches("^[a-zA-Z0-9_\\.-]+$");
    }
}
