<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="com.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 리스트 페이지</title>
<link rel="stylesheet" href="assets/css/Base_style.css?v=1.0">
<link rel="stylesheet" href="assets/css/item_list.css?v=1.0">
</head>
<body>
    <header>
        <div class="logo">
            <a href="main.html"><img src="assets/img/Base_logo.png" alt="Be Petmily Logo"></a>
        </div>
        <!-- 주 네비게이션 -->
        <nav class="main-nav">
            <ul>
                <li class="dropdown products-tab"><a>제품</a>
                    <div class="dropdown-content products-content">
                        <a href="item_list.jsp?page=1">사료</a>
                        <a href="#">간식</a>
                        <a href="#">용품</a>
                    </div>
                </li>
                <li class="dropdown facilities-tab"><a>시설</a>
                    <div class="dropdown-content facilities-content">
                        <a href="#">병원</a>
                        <a href="#">숙박</a>
                        <a href="#">카페/식당</a>
                        <a href="#">기타시설</a>
                        <a href="kaomap2 ok.html">주변위치</a>
                    </div>
                </li>
                <li class="dropdown health-tab"><a>맞춤형 정보</a>
                    <div class="dropdown-content health-content">
                        <a href="HealthCare.html" class="moveable">건강관리</a>
                        <a href="#" class="moveable">질병예측</a>
                    </div>
                </li>
                <li class="dropdown community-tab"><a>커뮤니티</a>
                    <div class="dropdown-content community-content">
                        <a href="#">자유게시판</a>
                    </div>
                </li>
            </ul>
        </nav>
        <hr>
        <!-- 브레드크럼 네비게이션 -->
        <div class="nav-background"></div>
        <div class="breadcrumb-background"></div>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main.html">홈</a><span>&gt;</span></li>
                <li class="breadcrumb-item"><a href="item_list.jsp?page=1">제품</a><span>&gt;</span></li>
            </ol>
        </nav>
        <div class="user-options">
            <a href="#"><img src="assets/img/Base_user.png" alt="User Icon"></a>
            <a href="#"><img src="assets/img/Base_cart.png" alt="Cart Icon"></a>
        </div>
    </header>
    <!-- Wrapper: 메인 콘텐츠 및 푸터를 중앙에 배치 -->
    <div class="wrapper">
        <main>
            <div class="container">
                <div class="product-grid">
                    <%
                        String curPageParam = request.getParameter("page");
                        int curPage = 1; // 기본값
                        if (curPageParam != null) {
                            try {
                                curPage = Integer.parseInt(curPageParam);
                            } catch (NumberFormatException e) {
                                curPage = 1; // 잘못된 값이 들어오면 기본값 사용
                            }
                        }
                        ProductDAO dao = new ProductDAO();
                        ArrayList<ProductDTO> products = dao.getProductList(curPage);
                    %>
                    <!-- 제품 목록 출력 -->
                    <% for (ProductDTO product : products) { %>
                        <div class="product-detail">
                            <a href="#"><img src="<%= product.getProductUrl() %>" alt="제품 이미지"></a>
                            <h1><%= product.getProductName() %></h1>
                            <p>가격: <%= product.getProductPrice() %></p>
                            <form action="buy.html" method="get">
                                <button type="submit">구매하기</button>
                            </form>
                        </div>
                    <% } %>
                </div>
            </div>
            <div class="pagination">
                <a href="item_list.jsp?page=<%= curPage - 1 %>" class="prev-page">&laquo;</a>
                <% for (int i = 1; i <= 5; i++) { %>
                    <a href="item_list.jsp?page=<%= i %>" class="page-number"><%= i %></a>
                <% } %>
                <a href="item_list.jsp?page=<%= curPage + 1 %>" class="next-page">&raquo;</a>
            </div>
        </main>
        <!-- 배너: 전체 너비로 설정 -->
        <section class="banner">
            <img src="assets/img/Base_banner.png" alt="Be Petmily Banner">
        </section>
        <footer class="footer-wrapper">
            <div class="footer-container">
                <div class="footer-top-bar">
                    <span class="footer-lang"> 대한민국/한국어 </span>
                    <span class="footer-top"><a href="#" id="back-to-top1"><img src="assets/img/Base_up01.png" alt="맨 위"></a></span>
                </div>
                <hr>
                <div class="footer-top">
                    <div class="footer-links">
                        <h3>제품</h3>
                        <ul>
                            <li><a href="item_list.jsp?page=1">사료</a></li>
                            <li><a href="#">간식</a></li>
                            <li><a href="#">용품</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h3>애견 관련 시설</h3>
                        <ul>
                            <li><a href="#">병원</a></li>
                            <li><a href="#">숙박</a></li>
                            <li><a href="#">카페</a></li>
                            <li><a href="kaomap2 ok.html">주변위치</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h3>맞춤형 정보</h3>
                        <ul>
                            <li><a href="HealthCare.html">건강관리</a></li>
                            <li><a href="#">질병예측</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
