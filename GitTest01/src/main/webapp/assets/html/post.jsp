<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사진 게시판 글쓰기</title>
    <link rel="stylesheet" href="post.css">
</head>
<body>
    <div class="container">
        <h1>글쓰기</h1>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="file">사진 업로드</label>
                <input type="file" id="file" name="file" accept="image/*" required>
            </div>
            <div class="form-group">
                <button type="submit">작성하기</button>
            </div>
        </form>
    </div>
</body>
</html>

