<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질병 예측</title>
    <link rel="stylesheet" href="assets/css/Base_style.css">
    <link rel="stylesheet" href="assets/css/DiseasePrediction.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
        <div class="logo">
            <a href="main.html"><img src="assets/img/Base_logo.png" alt="Be Petmily Logo"></a>
        </div>
        <nav>
            <ul>
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
                        <a href="#">병원</a>
                        <a href="#">숙박</a>
                        <a href="#">카페/식당</a>
                        <a href="#">기타시설</a>
                        <a href="assets/html/map.html">주변위치</a>
                    </div>
                </li>
                <li class="dropdown health-tab">
                    <a>맞춤형 정보</a>
                    <div class="dropdown-content health-content">
                        <a href="DiseasePrediction.jsp" class="moveable">질병예측</a>
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
                <!-- <li class="breadcrumb-item"><a href="item_list.html">제품</a><span>&gt;</span></li>
                <li class="breadcrumb-item active" aria-current="page">사료</li> -->
            </ol>
        </nav>
        <div class="user-options">
            <a href="#"><img src="assets/img/Base_user.png" alt="User Icon"></a>
            <a href="#"><img src="assets/img/Base_cart.png" alt="Cart Icon"></a>
        </div>
    </header>

    <div class="wrapper">
        <main class="main-container">
            <div class="left-content">
                <%@ include file="modelTest2.jsp" %>
            </div>
            <div class="right-content">
                <section class="custom-info">
                    <div class="info-container">
                        <div class="info-box small">
                            <div class="info-text"><h1>질병 이름</h1></div>
                            <p>슬개골 탈구</p>
                        </div>
                        <div class="info-box large">
                        <h2>질병케어 방법</h2>
                            <p>강아지의 무릎에는 동그랗고 작은 뼈인 슬개골이 있다.
                            본래 슬개골은 깊게 파인 활차구 홈 안에 들어가서 무릎 관절이 움직이도록 도와주는 역할을 하지만,
                            슬개골이 본래의 위치에서 벗어날 수 있다. 
                            이러한 상태를 강아지 슬개골 탈구라고 부른다. </p>
                        </div>
                        
                        
                     <!--   <div class="info-box small">
                            <div class="info-image"></div>
                            <div class="info-text">제품 정보</div>
                        </div>
                        <div class="info-box small">
                            <div class="info-image"></div>
                            <div class="info-text">제품 정보</div>
                        </div>
                        <div class="info-box small">
                            <div class="info-image"></div>
                            <div class="info-text">제품 정보</div>
                         --> 
                         
                        </div>   
                    </div>
                </section>
            </div>
        </main>
    </div>
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
                        <li><a href="#">병원</a></li>
                        <li><a href="#">숙박</a></li>
                        <li><a href="#">카페/식당</a></li>
                        <li><a href="#">기타시설</a></li>
                        <li><a href="assets/html/map.html">주변위치</a></li>
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
</html>
