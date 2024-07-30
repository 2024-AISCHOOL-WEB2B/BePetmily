<%@page import="com.model.FacDAO"%>
<%@page import="com.model.FacDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 위치 기반 서비스</title>
    <link rel="stylesheet" href="assets/css/Base_style.css">
    <link rel="stylesheet" href="assets/css/map3.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="main.html"><img src="assets/img/Base_logo.png" alt="Be Petmily Logo"></a>
        </div>
        
        <!-- 주 네비게이션 -->
        <nav class="main-nav">
            <ul>
                <!-- 개별 드롭다운 메뉴 설정 -->
                <li class="dropdown products-tab">
                    <a>제품</a>
                    <div class="dropdown-content products-content">
                        <a href="assets/html/item_list.html">사료</a>
                        <a href="#">간식</a>
                        <a href="#">용품</a>
                    </div>
                </li>
                <li class="dropdown facilities-tab">
                    <a>시설</a>
                    <div class="dropdown-content facilities-content">
                        <a href="map.jsp?cate=hos&page=1">병원</a>
                        <a href="map.jsp?cate=acco&page=1">숙박</a>
                        <a href="map.jsp?cate=cafe&page=1">카페/식당</a>
                        <a href="map.jsp?cate=etc&page=1">기타시설</a>
                        <a href="map.jsp?cate=all&page=1">주변위치</a>
                    </div>
                </li>
                <li class="dropdown health-tab">
                    <a>맞춤형 정보</a>
                    <div class="dropdown-content health-content">
                        <!-- <a href="HealthCare.html" class="moveable">건강관리</a> -->
                        <a href="assets/html/DiseasePrediction.html" class="moveable">질병예측</a>
                    </div>
                </li>
                <li class="dropdown community-tab">
                    <a>커뮤니티</a>
                    <div class="dropdown-content community-content">
                        <a href="assets/html/album_list.html">앨범게시판</a>
                    </div>
                </li>
            </ul>
        </nav>
        <hr>
        <!-- 브레드크럼 네비게이션 -->
        <div class="nav-background"></div>
        <div class="breadcrumb-background"></div> <!-- 사각형 도형을 추가 -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="assets/html/main.html">홈</a><span>&gt;</span></li>
                <!-- <li class="breadcrumb-item"><a href="item_list.html">제품</a><span>&gt;</span></li> -->
                <li class="breadcrumb-item active" aria-current="page">주변위치</li> 
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
            <section class="map-section">
                <div id="map" style="width:600px;height:400px;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d65efe482352843c1373a29f486cdb0f"></script>
                <script type="text/javascript" src="assets/js/geolocation.js"></script> 
                <div class="location-list">
                <%
                ArrayList<FacDTO> facs = (ArrayList<FacDTO>) request.getAttribute("facs");
				if (facs != null) {
				    for (FacDTO fac : facs) {
				        out.println("JSP에서 시설 이름: " + fac.getFacName() + "<br>");
				    }
				} else {
				    out.println("시설을 찾을 수 없습니다.<br>");
				}
				%>
                   <!--<h2>가까운 장소</h2>  --> 
                    <ul id="places-list">
                        <!-- 가까운 장소 목록이 여기에 추가됩니다 -->
                        
                    </ul>
                </div>
            </section>
        </main>
    </div>        

    <!-- 배너: 전체 너비로 설정 -->
    <section class="banner">
        <img src="assets/img/Base_banner.png" alt="Be Petmily Banner">
    </section>
    <footer class="footer-wrapper">
        <div class="footer-container">
            <div class="footer-top-bar">
                <span class="footer-lang">🌐 대한민국/한국어 </span>
                <span class="footer-top"><a href="#" id="back-to-top1"><img src="assets/img/Base_up01.png" alt="맨 위" srcset=""></a></span>
            </div>
             <hr> 
            <div class="footer-top">
                <div class="footer-links">
                    <h3>제품</h3>
                    <ul>
                        <li><a href="assets/html/item_list.html">사료</a></li>
                        <li><a href="#">간식</a></li>
                        <li><a href="#">용품</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>애견 관련 시설</h3>
                    <ul>
                        <li><a href="map.jsp?cate=hos&page=1">병원</a></li>
                        <li><a href="map.jsp?cate=acco&page=1">숙박</a></li>
                        <li><a href="map.jsp?cate=cafe&page=1">카페/식당</a></li>
                        <li><a href="map.jsp?cate=etc&page=1">기타시설</a></li>
                        <li><a href="map.jsp?cate=all&page=1">주변위치</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>맞춤형 정보</h3>
                    <ul>
                        <!-- <li><a href="HealthCare.html">건강관리</a></li> -->
                        <li><a href="assets/html/DiseasePrediction.html">질병예측</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>커뮤니티</h3>
                    <ul>
                        <!-- <li><a href="#">자주 묻는 질문</a></li> -->
                        <li><a href="assets/html/album_list.html">앨범게시판</a></li>
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
                <p>©2017 Be Petmily. All rights reserved. An Affiliate of Mars, Incorporated.</p>
            </div>
            <div class="back-to-top">
                <a href="#" id="back-to-top"><img src="assets/img/Base_up02.png" alt="맨 위로"></a>
            </div>
        </div>
    </footer>
</body>