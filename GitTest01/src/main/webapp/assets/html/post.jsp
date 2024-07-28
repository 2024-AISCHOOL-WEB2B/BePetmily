<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>���� �Խ��� �۾���</title>
    <link rel="stylesheet" href="post.css">
</head>
<body>
    <div class="container">
        <h1>�۾���</h1>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">����</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="content">����</label>
                <textarea id="content" name="content" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="file">���� ���ε�</label>
                <input type="file" id="file" name="file" accept="image/*" required>
            </div>
            <div class="form-group">
                <button type="submit">�ۼ��ϱ�</button>
            </div>
        </form>
    </div>
</body>
</html>

