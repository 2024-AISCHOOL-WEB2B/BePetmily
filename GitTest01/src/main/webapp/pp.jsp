<!-- -이렇게 넣으면 효과도 넣을 수 있어서 ~ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/9e1b042d62.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>be petMily🐾🐾</title>
<link rel="stylesheet" type="text/css" href="pp.css">
</head>
<body
	style="background-image: url('assets/img/Unicode_bg.jpg'); background-size: cover;">
	<div class="video-container">
		<video id="introVideo" autoplay muted playsinline>
			<source src="assets/img/video.mp4" type="video/mp4">
		</video>
		<div class="text-overlay" id="textOverlay"></div>
	</div>

	<div style="text-align: center; font-size: xx-large; margin-top: 60px;">
		<a href="Main.jsp" class="abox"><i class="fa-solid fa-house fa-xl"></i></a>
		<!-- 여기 홈 수정해야함~ -->
		<a href="login.jsp" class="abox"><b>로그인</b></a>
	</div>
	
	<script>
  document.addEventListener("DOMContentLoaded", function() {
	    var video = document.getElementById('introVideo');

	    video.addEventListener('play', function() {
	        // 영상 시작 후 2초 뒤에 애니메이션 시작
	        setTimeout(function() {
	            video.style.animation = "fadeout 2s forwards";
	            // fadeout 애니메이션이 끝나는 시점에 display를 none으로 설정하기 위한 setTimeout
	            setTimeout(function() {
	                video.parentNode.style.display = 'none'; // video의 부모 요소인 video-container를 숨김
	            }, 2000); // fadeout 애니메이션의 지속 시간과 동일하게 설정
	        }, 2000); // 영상 시작 후 2초 대기
	    });
	});

	$(document).ready(function(){
	    $("#header").load("header.html");
	});

  $(document).ready(function(){
	  let text1 = "Be PetMily";
	  let duration = 2000; // 3초
	  let $overlay = $("#textOverlay");

	  function typeEffect(text) {
	    $overlay.html(""); // 오버레이 초기화
	    let i = 0;
	    let interval = setInterval(function() {
	      $overlay.append(text.charAt(i)); // 현재 문자 추가
	      i++;
	      if (i >= text.length) {
	        clearInterval(interval); // 모든 문자가 추가되면 인터벌 종료
	      }
	    }, duration / text.length); // 전체 길이에 대한 타이핑 속도 계산
	  }

	  typeEffect(text1); // text1에 대해 타이핑 효과 적용
	});

</script>
</body>
</html>

</body>
</html>