<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.MemberDTO"%>
<%@ page import="com.model.MemberDAO"%>
<%@ page import="com.model.userDAO"%>
<%@ page import="com.model.userDTO"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 보기</title>
<link rel="stylesheet" href="assets/css/Base_style.css?v1.1">
<link rel="stylesheet" href="assets/css/post_view.css?v1.2">
</head>
<body>
	<header>
		<div class="logo">
			<a href="main.jsp"><img src="assets/img/Base_logo.png"
				alt="Be Petmily Logo"></a>
		</div>

		<!-- 주 네비게이션 -->
		<nav class="main-nav">
			<ul>
				<li class="dropdown products-tab"><a>제품</a>
					<div class="dropdown-content products-content">
						<a href="item_list.jsp?cate=food&page=1">사료</a> <a
							href="item_list.jsp?cate=snack&page=1">간식</a> <a
							href="item_list.jsp?cate=etc&page=1">용품</a>
					</div></li>
				<li class="dropdown facilities-tab"><a>시설</a>
					<div class="dropdown-content facilities-content">
						<a href="map.jsp?cate=hos&page=1&refresh=true">병원</a> <a
							href="map.jsp?cate=acco&page=1&refresh=true">숙박</a> <a
							href="map.jsp?cate=cafe&page=1&refresh=true">카페/식당</a> <a
							href="map.jsp?cate=etc&page=1&refresh=true">기타시설</a> <a
							href="map.jsp?cate=all&page=1&refresh=true">주변위치</a>
					</div></li>
				<li class="dropdown health-tab"><a>맞춤형 정보</a>
					<div class="dropdown-content health-content">
						<a href="DiseasePrediction.jsp" class="moveable">질병예측</a>
					</div></li>
				<li class="dropdown community-tab"><a>커뮤니티</a>
					<div class="dropdown-content community-content">
						<a href="postList">앨범게시판</a>
					</div></li>
			</ul>
		</nav>
		<hr>
		<!-- 브레드크럼 네비게이션 -->
		<div class="nav-background"></div>
		<div class="breadcrumb-background"></div>
		<!-- 사각형 도형을 추가 -->
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="main.jsp">홈</a><span>&gt;</span></li>
				<li class="breadcrumb-item"><a href="postList">앨범게시판</a><span>&gt;</span></li>
				<li class="breadcrumb-item active" aria-current="page">글 보기</li>
			</ol>
		</nav>
		<div class="user-options">
			<a href="Mypage2.jsp"><img src="assets/img/Base_user.png"
				alt="User Icon"></a> <a href="#"><img
				src="assets/img/Base_cart.png" alt="Cart Icon"></a>
		</div>
	</header>

	<div class="wrapper">
		<main>
			<div class="post-view-container">
				<div class="write-button-container">
					<a href="post.jsp" class="write-button">글쓰기</a>
				</div>

				<div class="album-grid" id="album-grid">
					<%
                List<MemberDTO> postOne = (List<MemberDTO>) request.getAttribute("postOne");
                if (postOne == null) {
                	postOne = new ArrayList<>(); // 빈 리스트로 초기화
                }

                for (MemberDTO post : postOne) {
                
                %>
					<div class="post-image">

						<% if (post.getImgFile() != null && !post.getImgFile().isEmpty()) { %>
						<img src="<%= post.getImgFile() %>" alt="앨범 이미지"
							onclick="DataView(<%= post.getPostId() %>)">
						<% } %>
						<h1><%=post.getPostId()%></h1>
					
						<h1 id="post-title"><%= post.getTitle() %></h1>
						<p id="post-body"><%= post.getContent() %></p>
					</div>

					<%
                }
                %>
				</div>

				<a href="postList">목록으로 돌아가기</a>

				<!-- -
                <div class="post-details">
                    <h1 id="post-title"><%=request.getAttribute("Title")%></h1>
                    <p id="post-body"><%=request.getAttribute("postContent")%></p>
                    <p id="post-id">
                        Post ID: <%=request.getAttribute("postId")%></p>
                </div>
                 -->
				<div class="post-actions">
					<form action="PostActionServlet" method="post">
						<button type="submit" name="action" value="like"
							class="button-like like-button">좋아요</button>
						<button type="submit" name="action" value="edit"
							class="button-like edit-button">수정</button>
						<button type="submit" name="action" value="delete"
							class="button-like delete-button">삭제</button>
					</form>
				</div>
			</div>
	</div>
	</main>
	</div>
	<!-- 배너: 전체 너비로 설정 -->
	<section class="banner">
		<img src="assets/img/Base_banner.png" alt="Be Petmily Banner">
	</section>
	<footer class="footer-wrapper">
		<div class="footer-container">
			<div class="footer-top-bar">
				<span class="footer-lang">🌐 대한민국/한국어 </span> <span
					class="footer-top"><a href="#" id="back-to-top1"><img
						src="assets/img/Base_up01.png" alt="맨 위" srcset=""></a></span>
			</div>
			<hr>
			<div class="footer-top">
				<div class="footer-links">
					<h3>제품</h3>
					<ul>
						<li><a href="item_list.jsp?cate=food&page=1">사료</a></li>
						<li><a href="item_list.jsp?cate=snack&page=1">간식</a></li>
						<li><a href="item_list.jsp?cate=etc&page=1">용품</a></li>
					</ul>
				</div>
				<div class="footer-links">
					<h3>애견 관련 시설</h3>
					<ul>
						<li><a href="map.jsp?cate=hos&page=1&refresh=true">병원</a></li>
						<li><a href="map.jsp?cate=acco&page=1&refresh=true">숙박</a></li>
						<li><a href="map.jsp?cate=cafe&page=1&refresh=true">카페</a></li>
						<li><a href="map.jsp?cate=all&page=1&refresh=true">주변위치</a></li>
					</ul>
				</div>
				<div class="footer-links">
					<h3>맞춤형 정보</h3>
					<ul>
						<li><a href="DiseasePrediction.jsp">질병예측</a></li>
					</ul>
				</div>
				<div class="footer-links">
					<h3>커뮤니티</h3>
					<ul>
						<li><a href="postList">앨범게시판</a></li>
					</ul>
				</div>
			</div>
			<hr>
			<div class="footer-contact">
				<p>Be Petmily와 상담하세요</p>
				<p>평일 09:00 ~ 18:00 주말/공휴일 휴무</p>
				<p>070-123-4567</p>
				<a href="mailto:info@bepetmily.com">문의하기</a>
			</div>
			<div class="footer-bottom">
				<p>개인정보 보호센터 | 법률정보 | 개인정보 처리방침</p>
				<p>©2017 Be Petmily. All rights reserved. An Affiliate of Mars,
					Incorporated.</p>
			</div>
			<div class="back-to-top">
				<a href="#" id="back-to-top"><img src="assets/img/Base_up02.png"
					alt="맨 위로"></a>
			</div>
		</div>
	</footer>

	<script>
		document.getElementById('back-to-top').addEventListener('click',
				function(e) {
					e.preventDefault();
					window.scrollTo({
						top : 0,
						behavior : 'smooth'
					});
				});
	</script>
</body>
</html>
