<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 상세 페이지</title>
    <link rel="stylesheet" href="assets/css/Base_style.css">
    <link rel="stylesheet" href="assets/css/post2.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="main.jsp"><img src="assets/img/Base_logo.png" alt="Be Petmily Logo"></a>
        </div>
        
        <!-- 주 네비게이션 -->
        <nav class="main-nav">
            <ul>
                <!-- 개별 드롭다운 메뉴 설정 -->
                <li class="dropdown products-tab">
                    <a>제품</a>
                    <div class="dropdown-content products-content">
                        <a href="item_list.jsp?cate=food&page=1">사료</a>
                        <a href="item_list.jsp?cate=snack&page=1">간식</a>
                        <a href="item_list.jsp?cate=etc&page=1">용품</a>
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
                        <a href="DiseasePrediction.jsp" class="moveable">질병예측</a>
                    </div>
                </li>
                <li class="dropdown community-tab">
                    <a>커뮤니티</a>
                    <div class="dropdown-content community-content">
                        <a href="album_list.jsp">앨범게시판</a>
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
                <li class="breadcrumb-item"><a href="main.jsp">홈</a><span>&gt;</span></li>
                <li class="breadcrumb-item"><a href="item_list.html">앨범게시판</a><span>&gt;</span></li>
                <li class="breadcrumb-item active" aria-current="page">글쓰기</li> 
            </ol>
        </nav>
        <div class="user-options">
            <a href="MyPage.jsp"><img src="assets/img/Base_user.png" alt="User Icon"></a>
            <a href="#"><img src="assets/img/Base_cart.png" alt="Cart Icon"></a>
        </div>
    </header>

    <!-- Wrapper: 메인 콘텐츠 및 푸터를 중앙에 배치 -->
    <div class="wrapper">
        <main>
        <div class="container1">
            <form>
                <div class="container">
                    <h1>글쓰기</h1>
                    <form action="uploadServlet" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="title">글쓰기</label>
                            <input type="text" id="title" name="title" required>
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="content" style="width: 400px; height: 190px;" rows="5" required></textarea>
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
                
            </form>    
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
                <span class="footer-lang">🌐 대한민국/한국어 </span>
                <span class="footer-top"><a href="#" id="back-to-top1"><img src="assets/img/Base_up01.png" alt="맨 위" srcset=""></a></span>
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
                        <li><a href="map.jsp?cate=hos&page=1">병원</a></li>
                        <li><a href="map.jsp?cate=acco&page=1">숙박</a></li>
                        <li><a href="map.jsp?cate=cafe&page=1">카페</a></li>
                        <li><a href="map.jsp?cate=all&page=1">주변위치</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>맞춤형 정보</h3>
                    <ul>
                        <!-- <li><a href="HealthCare.html">건강관리</a></li> -->
                        <li><a href="DiseasePrediction.jsp">질병예측</a></li>
                    </ul>
                </div>
                <div class="footer-links">
                    <h3>커뮤니티</h3>
                    <ul>
                        <!-- <li><a href="#">자주 묻는 질문</a></li> -->
                        <li><a href="album_list.jsp">앨범게시판</a></li>
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

    <script>
        document.getElementById('back-to-top').addEventListener('click', function(e) {
            e.preventDefault();
            window.scrollTo({top: 0, behavior: 'smooth'});
        });
    </script>
</body>
</html>
