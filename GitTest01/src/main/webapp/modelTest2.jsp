<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증상 체크리스트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* 검색 입력 상자 스타일 */
        #search-box {
            margin-bottom: 10px;
            padding: 5px;
            width: 98%;
            display: flex;
            align-content: center;
        }
        /* 드롭다운 컨테이너 스타일 */
        .dropdown-container {
            position: relative;
        }
        /* 드롭다운 리스트 스타일 */
        #symptom-select {
            width: 100%;
            height: 200px; /* 필요에 따라 높이 조절 */
            overflow-y: auto;
        }
        /* 선택된 증상 리스트 스타일 */
        #selected-symptoms {
            margin-top: 20px;
            padding: 5px;
            border: 1px solid #ccc;
            width: 98%;
        }
        #selected-symptoms ul {
            list-style-type: none; /* 불릿 스타일 제거 */
            padding: 0;
        }
        #selected-symptoms li {
            margin: 5px 0;
        }
        /* 토글 스위치 스타일 */
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }
        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
        }
        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
        }
        input:checked + .slider {
            background-color: #2196F3;
        }
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        .slider.round {
            border-radius: 34px;
        }
        .slider.round:before {
            border-radius: 50%;
        }
    </style>
</head>
<body>
    
    <h1>증상 선택하기</h1>
    <form id="symptom-form">
        <div class="dropdown-container">
            <!-- 증상 검색 입력 상자 -->
            <input type="text" id="search-box" placeholder="증상 검색...">
            <br>
            <!-- 증상 선택 드롭다운 -->
            <label for="symptom-select">증상 선택:</label>
            <br>
            <select id="symptom-select" name="symptoms" multiple>
                <option value="Fever">발열</option>
                <option value="Nasal Discharge">코 분비물</option>
                <option value="Loss of appetite">식욕 부진</option>
                <option value="Weight Loss">체중 감소</option>
                <option value="Lameness">절뚝거림</option>
                <option value="Breathing Difficulty">호흡 곤란</option>
                <option value="Swollen Lymph nodes">림프절 부종</option>
                <option value="Lethargy">무기력</option>
                <option value="Depression">우울증</option>
                <option value="Coughing">기침</option>
                <option value="Diarrhea">설사</option>
                <option value="Seizures">발작</option>
                <option value="Vomiting">구토</option>
                <option value="Eating less than usual">평소보다 적은 식사</option>
                <option value="Excessive Salivation">과도한 침 분비</option>
                <option value="Redness around Eye area">눈 주위 발적</option>
                <option value="Severe Dehydration">심한 탈수</option>
                <option value="Pain">통증</option>
                <option value="Discomfort">불편감</option>
                <option value="Sepsis">패혈증</option>
                <option value="WeightLoss">체중 감소</option>
                <option value="Tender abdomen">복부 압통</option>
                <option value="Increased drinking and urination">물 섭취 및 배뇨 증가</option>
                <option value="Bloated Stomach">복부 팽창</option>
                <option value="Yellow gums">노란 잇몸</option>
                <option value="Constipation">변비</option>
                <option value="Paralysis">마비</option>
                <option value="Wrinkled forehead">이마 주름</option>
                <option value="Continuously erect and stiff ears">경직된 귀</option>
                <option value="Grinning appearance">안면경직</option>
                <option value="Stiff and hard tail">경직된 꼬리</option>
                <option value="Stiffness of muscles">근육 경직</option>
                <option value="Acute blindness">급성 실명</option>
                <option value="Blood in urine">소변에 혈액</option>
                <option value="Hunger">배고픔</option>
                <option value="Cataracts">백내장</option>
                <option value="Losing sight">시력 상실</option>
                <option value="Glucose in urine">소변 내 포도당</option>
                <option value="Burping">트림</option>
                <option value="blood in stools">대변에 혈액</option>
                <option value="Passing gases">가스 배출</option>
                <option value="Eating grass">풀 먹기</option>
                <option value="Scratching">긁기</option>
                <option value="Licking">핥기</option>
                <option value="Itchy skin">피부 가려움</option>
                <option value="Redness of skin">피부 발적</option>
                <option value="Face rubbing">얼굴 문지르기</option>
                <option value="Loss of Fur">털 빠짐</option>
                <option value="Swelling of gum">잇몸 붓기</option>
                <option value="Redness of gum">잇몸 발적</option>
                <option value="Receding gum">잇몸 후퇴</option>
                <option value="Bleeding of gum">잇몸 출혈</option>
                <option value="Plaque">플라그</option>
                <option value="Bad breath">입냄새</option>
                <option value="Tartar">치석</option>
                <option value="Lumps">덩어리 만져짐</option>
                <option value="Swelling">붓기</option>
                <option value="Red bumps">붉은 발진</option>
                <option value="Scabs">딱지</option>
                <option value="Irritation">자극</option>
                <option value="Dry Skin">건조한 피부</option>
                <option value="Fur loss">털 빠짐</option>
                <option value="Red patches">붉은 반점</option>
                <option value="Heart Complication">심장 문제</option>
                <option value="Weakness">허약함</option>
                <option value="Aggression">공격성</option>
                <option value="Pale gums">창백한 잇몸</option>
                <option value="Coma">혼수 상태</option>
                <option value="Collapse">붕괴</option>
                <option value="Abdominal pain">복부 통증</option>
                <option value="Difficulty Urinating">배뇨 어려움</option>
                <option value="Dandruff">비듬</option>
                <option value="Anorexia">식욕 부진</option>
                <option value="Blindness">실명</option>
                <option value="excess jaw tone">과도한 턱 긴장</option>
                <option value="Urine infection">소변 감염</option>
                <option value="Lack of energy">에너지 부족</option>
                <option value="Smelly">냄새</option>
                <option value="Neurological Disorders">신경 장애</option>
                <option value="Eye Discharge">눈 분비물</option>
                <option value="Loss of Consciousness">의식 상실</option>
                <option value="Enlarged Liver">간 비대</option>
                <option value="lethargy">무기력</option>
                <option value="Purging">구토</option>
                <option value="Bloody discharge">혈변 혈뇨</option>
                <option value="Wounds">상처</option>
            </select>
        </div>
        <button type="submit">제출</button>
        <button type="button" id="reset-button">리셋</button>

        
    </form>
    
    <!-- 선택된 증상을 표시할 공간 -->
    <div id="selected-symptoms">
        <h3>선택된 증상:</h3>
        <ul id="symptom-list"></ul>
    </div>
    
    

    <script>
    $(document).ready(function() {
        // 검색 입력 상자에 이벤트 리스너 추가
        $('#search-box').on('input', function() {
            var searchTerm = $(this).val().toLowerCase();
            
            // 드롭다운 옵션 필터링
            $('#symptom-select option').each(function() {
                var text = $(this).text().toLowerCase();
                if (text.indexOf(searchTerm) > -1) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });

        // 선택된 증상을 업데이트하는 함수
        function updateSelectedSymptoms(selectedSymptoms) {
            var symptomList = $('#symptom-list');
            symptomList.empty();
            selectedSymptoms.forEach(function(symptom) {
                var symptomText = $('#symptom-select option[value="' + symptom + '"]').text();
                symptomList.append('<li>' + symptomText + '</li>');
            });
        }

        var selectedSymptoms = [];

        // 드롭다운에서 선택이 변경될 때마다 선택된 증상을 업데이트
        $('#symptom-select').on('click', 'option', function(event) {
            var value = $(this).val();
            var index = selectedSymptoms.indexOf(value);
            if (index > -1) {
                selectedSymptoms.splice(index, 1);
                $(this).prop('selected', false);
            } else {
                selectedSymptoms.push(value);
                $(this).prop('selected', true);
            }
            updateSelectedSymptoms(selectedSymptoms);
        });

        $('#symptom-form').on('submit', function(event) {
            event.preventDefault();

            // 증상 데이터 객체 생성
            var symptomsData = {};
            $('#symptom-select option').each(function() {
                symptomsData[$(this).val()] = 0;
            });

            selectedSymptoms.forEach(function(symptom) {
                symptomsData[symptom] = 1;
            });

            $.ajax({
                url: 'http://localhost:5000/predict',  // Flask API URL
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(symptomsData),
                success: function(response) {
                    var message; // 출력할 메시지를 저장할 변수
                    switch (response.disease){
                    	case 'Tick fever':
                    		message = '진드기 열병';
                    		break;
                    	case 'Distemper':
                    		message = '홍역';
                    		break;
                    	case 'Parvovirus':
                    		message = '파보바이러스';
                    		break;
                    	case 'Hepatitis':
                    		message = '간염';
                    		break;
                    	case 'Tetanus':
                    		message = '파상풍';
                    		break;
                    	case 'Chronic kidney Disease':
                    		message = '만성 신장 질환';
                    		break;
                    	case 'Diabetes':
                    		message = '당뇨병';
                    		break;
                    	case 'Gastrointestinal Disease':
                    		message = '소화기 질환';
                    		break;
                    	case 'Allergies':
                    		message = '알레르기';
                    		break;
                    	case 'Gingitivis':
                    		message = '치은염';
                    		break;
                    	case 'Cancers':
                    		message = '암';
                    		break;
                    	case 'Skin Rashes':
                    		message = '피부 발진';
                    		break;
                    	default :
                    		message = response.disease;
                    		break;
                    }
                    
                    $('#result').html('예측된 질병: ' + message);
                },
                error: function(xhr, status, error) {
                    $('#result').html('오류 발생: ' + error);
                }
            });
        });

        // 리셋 버튼 관련 코드
        $('#reset-button').on('click', function() {
            selectedSymptoms = [];
            $('#symptom-select option').prop('selected', false);
            updateSelectedSymptoms(selectedSymptoms);
            $('#search-box').val('');
            $('#symptom-select option').show();
        });
    });

</script>

</body>
</html>
