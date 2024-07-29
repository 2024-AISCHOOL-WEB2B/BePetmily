<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link rel="stylesheet" href="../css/Base_style.css">
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="main.html"><img src="../img/Base_logo.png" alt="Be Petmily Logo"></a>
        </div>
        
        <!-- 주 네비게이션 -->
        <nav class="main-nav">
            <ul>
                <!-- 개별 드롭다운 메뉴 설정 -->
                <li class="dropdown products-tab">
                    <a>제품</a>
                    <div class="dropdown-content products-content">
                        <a href="item_list.html">사료</a>
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
                        <a href="map.html">주변위치</a>
                    </div>
                </li>
                <li class="dropdown health-tab">
                    <a>맞춤형 정보</a>
                    <div class="dropdown-content health-content">
                        <a href="#" class="moveable">질병예측</a>
                    </div>
                </li>
                <li class="dropdown community-tab">
                    <a>커뮤니티</a>
                    <div class="dropdown-content community-content">
                        <a href="#">앨범게시판</a>
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
                <li class="breadcrumb-item"><a href="main.html">홈</a><span>&gt;</span></li>
            </ol>
        </nav>
        <div class="user-options">
            <a href="#"><img src="../img/Base_user.png" alt="User Icon"></a>
            <a href="#"><img src="../img/Base_cart.png" alt="Cart Icon"></a>
        </div>
    </header>

    <!-- Wrapper: 메인 콘텐츠 및 푸터를 중앙에 배치 -->
    <div class="wrapper">
        <main>
            <div class="top-content">
                <div class="left-section">
                    <img src="../img/main_banner.jpg" alt="Sample Image">
                </div>
                <div class="right-section">
                    <div class="banner-text">
                        <h2 class=""><span class="BP">BE PETMILY</span>를  <hr>안전하고 편리하게 이용하세요</h2>
                        <button><a href="login.html">BE PETMILY 로그인</a></button>
                        <div class="login">
                            <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="sign_up.html">회원가입</a>
                        </div>
                    </div>
                    <hr>
                    <div class="banner-text-bottom">
                        <button class="register-button">동물 등록번호 등록하기</button>
                    </div>
                </div>
            </div>

            <div class="section">  <!--상품 알려주는 코드 -->
                <h2>이 상품은 어때요?</h2>
                <div class="product-list">
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back10.jpg" alt="Product 1"></a>
                        </button>
                        <div>
                            <p>ANF 6Free 연어와 병아리콩 6.5kg</p>
                            <p class="price">47,400원</p>
                        </div>
                    </div>


                    <!--  더미  -->
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back9.jpg" alt="Product 2"></a>
                        </button>
                        <p>도쿄펫 아이스 크림 120ml 3개</p>
                        <p class="price">18,000원</p>
                    </div>
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back8.jpg" alt="Product 3"></a>
                        </button>
                        <p>망고왕 수영장</p>
                        <p class="price">9,500원</p>
                    </div>
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back7.jpg" alt="Product 4"></a>
                        </button>
                        <p>요셉의 프로젝트 매트</p>
                        <p class="price">34,000원</p>
                    </div>
                </div>
            </div>

            <div class="section">
                <h2>안전한 산책, 귀여움 한스푼!</h2>
                <div class="product-list">
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back6.jpg" alt="Product 5"></a>
                        </button>
                        <p>두잇 버그 리페</p>
                        <p class="price">22,900원</p>
                    </div>
                    <!--  더미  -->
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back5.jpg" alt="Product 6"></a>
                        </button>
                        <p>팬티온 소프트 팬티</p>
                        <p class="price">13,000원</p>
                    </div>
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back4.jpg" alt="Product 7"></a>
                        </button>
                        <p>펫프랜드 셔츠</p>
                        <p class="price">29,900원</p>
                    </div>
                    <div class="product-item">
                        <button type="button">
                            <a href="#"><img src="../img/album_back13.jpg" alt="Product 8"></a>
                        </button>
                        <p>박스앤홀 목줄</p>
                        <p class="price">22,000원</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <!-- 배너: 전체 너비로 설정 -->
    <section class="banner">
        <img src="../img/Base_banner.png" alt="Be Petmily Banner">
    </section>
    <footer class="footer-wrapper">
        <div class="footer-container">
            <div class="footer-top-bar">
                <span class="footer-lang">🌐 대한민국/한국어 </span>
                <span class="footer-top"><a href="#" id="back-to-top1"><img src="../img/Base_up01.png" alt="맨 위" srcset=""></a></span>
            </div>
            <hr> 
            <div class="footer-top">
                <div class="footer-links">
                    <h3>제품</h3>
                    <ul>
                        <li><a href="item_list.html">사료</a></li>
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
                        <li><a href="#">주변시설</a></li>
                        <li><a href="map.html">주변위치</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>맞춤형 정보</h3>
                    <ul>
                        <li><a href="#">질병예측</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>커뮤니티</h3>
                    <ul>
                        <li><a href="#">앨범게시판</a></li>
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
                <a href="#" id="back-to-top"><img src="../img/Base_up02.png" alt="맨 위로"></a>
            </div>
        </div>
    </footer>

    <script>
        document.getElementById('back-to-top').addEventListener('click', function(e) {
            e.preventDefault();
            window.scrollTo({top: 0, behavior: 'smooth'});
        });
    </script>
</body>
</html>

