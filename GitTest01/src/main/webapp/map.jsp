<%@page import="com.model.PageDTO"%>
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
    <link rel="stylesheet" href="assets/css/Base_style.css?v1.1">
    <link rel="stylesheet" href="assets/css/map3.css?v1.1">
	<script>
    window.addEventListener('load', function() {
        // URLSearchParams 사용하여 변수 확인
        const urlParams = new URLSearchParams(window.location.search);
        const refresh = urlParams.get('refresh');
        if (refresh === 'true') {
            setTimeout(function() {
                // refresh 파라미터를 false로 설정하여 새로고침
                urlParams.set('refresh', 'false');
                window.location.search = urlParams.toString();
            }, 800); // 0.8초(800ms) 후에 페이지를 새로고침
        }
    });
	</script>
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
                        <a href="map.jsp?cate=hos&page=1&refresh=true">병원</a>
                        <a href="map.jsp?cate=acco&page=1&refresh=true">숙박</a>
                        <a href="map.jsp?cate=cafe&page=1&refresh=true">카페/식당</a>
                        <a href="map.jsp?cate=etc&page=1&refresh=true">기타시설</a>
                        <a href="map.jsp?cate=all&page=1&refresh=true">주변위치</a>
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
                        <a href="postList">앨범게시판</a>
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
            <a href="Mypage2.jsp"><img src="assets/img/Base_user.png" alt="User Icon"></a>
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
                String cate = request.getParameter("cate");
                String pageS = request.getParameter("page");
                int curPage = (pageS != null) ? Integer.parseInt(pageS) : 1;
                
                FacDAO dao = new FacDAO();
                ArrayList<FacDTO> facs = (ArrayList<FacDTO>)session.getAttribute("facs");
                PageDTO pages = (PageDTO) session.getAttribute("pages"); 
                /* ArrayList<Double> distances = (ArrayList<Double>)session.getAttribute("distances"); */
                if (pages == null) {
                	pages = new PageDTO(curPage, 8, dao.getTotal(cate)); // 현재 페이지를 기준으로 PageDTO를 생성합니다.
                }
				%>
                   <!--<h2>가까운 장소</h2>  --> 	
                    <ul id="places-list">
                        <!-- 가까운 장소 목록이 여기에 추가됩니다 -->
                        <%if ( facs != null){
                        	for(int i = (curPage-1)*8 + 1 ; i <= curPage*8 ; i++){
                        		FacDTO fac = facs.get(i); %>
                        		<li>
	                        		<strong>건물 이름:</strong><%= fac.getFacName() %> <br>
	                        		<strong>주소:</strong> <%= fac.getFacAddress() %><br>
	                        		<strong>전화번호:</strong><%= fac.getFacTel() %> <br>
	                        	</li>
                        	<% } %>
                        		
                        	

            	        <% } else {
						    out.println("시설을 찾을 수 없습니다.<br>");
						}%>                        	
<%--                         <%if ( distances != null){						<!--거리 계산 다시하기 -->
	                       	for (Double distance : distances){%>
	                       	<li>
	                       		<strong>거리:</strong> <%= distance %> km
	                       	</li>
	                        <%}%>
                        <%}else {
						    out.println("시설을 찾을 수 없습니다.<br>");
						}%> --%>
                    </ul>
                </div>
            </section>
           	<div class="pagination">
                <a href="item_list.jsp?cate=<%= cate %>&page=<%= pages.getCurPage() - 1 %>&refresh=true" class="prev-page">&laquo;</a>
                <% for (int i = pages.getStartPage(); i <= pages.getEndPage(); i++) { %>
                    <a href="item_list.jsp?cate=<%=cate%>&page=<%= i %>&refresh=true" class="page-number"><%= i %></a>
                <% } %>
                <a href="item_list.jsp?cate=<%= cate %>&page=<%= pages.getCurPage() + 1 %>&refresh=true" class="next-page">&raquo;</a>                
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
                        <li><a href="map.jsp?cate=hos&page=1&refresh=true">병원</a></li>
                        <li><a href="map.jsp?cate=acco&page=1&refresh=true">숙박</a></li>
                        <li><a href="map.jsp?cate=cafe&page=1&refresh=true">카페/식당</a></li>
                        <li><a href="map.jsp?cate=etc&page=1&refresh=true">기타시설</a></li>
                        <li><a href="map.jsp?cate=all&page=1&refresh=true">주변위치</a></li>
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