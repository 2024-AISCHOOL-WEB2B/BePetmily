// URL에서 쿼리 파라미터를 추출하는 함수
function getQueryParam(param) {
    var urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(param);
}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        alert("실패");
    }
}

function showPosition(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var cate = getQueryParam('cate'); // URL에서 'cate' 파라미터를 추출

    // 카카오 지도 API를 이용해 지도 생성 및 마커 추가
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(lat, lon),
        map: map
    });

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:5px;">현재 위치</div>'
    });
    infowindow.open(map, marker);

    // 위치 정보를 서버로 전송
    sendPosition(lat, lon, cate); // cate를 함께 전송
}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            alert("사용자가 위치 정보를 제공하지 않았습니다.");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("위치 정보를 사용할 수 없습니다.");
            break;
        case error.TIMEOUT:
            alert("요청 시간이 초과되었습니다.");
            break;
        case error.UNKNOWN_ERROR:
            alert("알 수 없는 오류가 발생했습니다.");
            break;
    }
}

function sendPosition(lat, lon, cate) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "FacLocation", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // 요청이 성공하면 할 일
            
            var places = JSON.parse(xhr.responseText);
            updatePlacesList(places);

        }
    };
    // cate 파라미터를 포함하여 데이터 전송
    xhr.send("latitude=" + encodeURIComponent(lat) + "&longitude=" + encodeURIComponent(lon) + "&cate=" + encodeURIComponent(cate));
}

function updatePlacesList(places) {
    var placesList = document.getElementById('places-list');
    placesList.innerHTML = '';
    places.forEach(function(place) {
        var li = document.createElement('li');
        li.textContent = place.name;
        placesList.appendChild(li);
    });
}

// 페이지가 로드될 때 위치 정보 요청
window.onload = getLocation;
