<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>앨범 게시판</title>
    <link rel="stylesheet" href="assets/css/Base_style.css?v1.1">
    <link rel="stylesheet" href="assets/css/album_list2.css?v1.1">
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
                <li class="breadcrumb-item active" aria-current="page">앨범</li>

            </ol>
        </nav>
        <div class="user-options">
            <a href="Mypage2.jsp"><img src="assets/img/Base_user.png" alt="User Icon"></a>
            <a href="#"><img src="assets/img/Base_cart.png" alt="Cart Icon"></a>
        </div>
    </header>

    <div class="header-section">
        <div class="header-content">
            <!-- <h1>댕댕이 사진첩</h1> -->
            <!-- <p></p> -->
        </div>
    </div>

    <div class="wrapper">
        <main>
            <div class="container">
                <div class="write-button-container">
                    <a href="post.jsp" class="write-button">글쓰기</a>
                </div>
                <div class="album-grid" id="album-grid">
                    <div class="album-item">
                    	<a href="post_view.jsp">
	                    	<img src="assets/img/album_back2.jpg" alt="앨범 이미지">
	                        <h1>강아지 제목</h1>
	                        <p>강아지 설명 및 상세 정보</p>
                        </a>
                        
                    </div>
                    <div class="album-item">
                    <a href="post_view.jsp">
                        <img src="assets/img/album_back3.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </a>
                    </div>
                    <div class="album-item">
                    <a href="post_view.jsp">
                        <img src="assets/img/album_back4.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </a>
                    </div>
                    <div class="album-item">
                        <img src="assets/img/album_back5.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </div>
                    <div class="album-item">
                        <img src="assets/img/album_back6.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </div>
                    <div class="album-item">
                        <img src="assets/img/album_back7.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </div>
                    <div class="album-item">
                        <img src="assets/img/album_back8.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </div>
                    <div class="album-item">
                        <img src="assets/img/album_back9.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </div>
                    <div class="album-item">
                        <img src="assets/img/album_back10.jpg" alt="앨범 이미지">
                        <h1>앨범 제목</h1>
                        <p>앨범 설명 및 상세 정보</p>
                    </div>
                    
                </div>
                
                <div class="pagination-container">
                    <div class="search-container">
                        <input type="text" id="search-input" placeholder="앨범 제목 검색">
                        <button id="search-button">검색</button>
                    </div>
                    <div class="sort-container">
                        <select id="sort-dropdown">
                            <option value="title">제목순 정렬</option>
                            <option value="date">날짜순 정렬</option>
                            <option value="date">좋아요 정렬</option>
                        </select>
                    </div>
                </div> <!-- 추가된 닫는 태그 -->
                <div class="pagination-sub">
                    <div class="pagination">
                        <a href="#">&laquo;</a>
                        <a class="active" href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">&raquo;</a>
                    </div>
                </div>
                
            </div>
        </main>
    </div>

    <footer class="footer-wrapper">
        <div class="footer-container">
            <div class="footer-top-bar">
                <span class="footer-lang">🌐 대한민국/한국어 </span>
                <span class="footer-top"><a href="#" id="back-to-top1"><img src="assets/img/Base_up01.png" alt="맨 위로"></a></span>
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
                        <li><a href="map.jsp?cate=cafe&page=1">카페/식당</a></li>
                        <li><a href="map.jsp?cate=etc&page=1">기타시설</a></li>
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

        document.getElementById('search-button').addEventListener('click', function() {
            const searchInput = document.getElementById('search-input').value.toLowerCase();
            const albumItems = document.querySelectorAll('.album-item');
            albumItems.forEach(item => {
                const title = item.querySelector('h1').textContent.toLowerCase();
                if (title.includes(searchInput)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });

        document.getElementById('sort-dropdown').addEventListener('change', function() {
            const sortOption = this.value;
            const albumGrid = document.getElementById('album-grid');
            const albums = Array.from(albumGrid.getElementsByClassName('album-item'));
            albums.sort((a, b) => {
                let compareA, compareB;
                if (sortOption === 'title') {
                    compareA = a.querySelector('h1').textContent.toLowerCase();
                    compareB = b.querySelector('h1').textContent.toLowerCase();
                } else if (sortOption === 'date') {
                    compareA = a.querySelector('p').textContent; // Assuming the date is in the <p> tag for simplicity
                    compareB = b.querySelector('p').textContent;
                }
                return compareA.localeCompare(compareB);
            });
            albumGrid.innerHTML = '';
            albums.forEach(album => albumGrid.appendChild(album));
        });

        // 페이지네이션 클릭 이벤트 처리
        document.querySelectorAll('.pagination a').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                // 모든 페이지네이션 링크에서 active 클래스 제거
                document.querySelectorAll('.pagination a').forEach(item => {
                    item.classList.remove('active');
                });
                // 클릭된 링크에 active 클래스 추가
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>
