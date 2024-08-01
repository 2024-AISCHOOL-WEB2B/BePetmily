from flask import Flask, jsonify, request
from flask_cors import CORS
import joblib
import pandas as pd
import numpy as np

app = Flask(__name__)
CORS(app)  # CORS 설정 추가(찾아보기)

# KNN 모델 로드
knn_model = joblib.load('models/knn_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        symptoms = list(data.keys())
        values = np.array(list(data.values())).reshape(1,86)
        
        # 증상은 리스트형태, 값은 np.array형태로 DF 생성
        df = pd.DataFrame(values,columns=symptoms)
        
        # 데이터프레임확인
        # print(df)
        predictions = knn_model.predict(df)
        
        response = {'status': 'success', 'disease': predictions[0]}
        return jsonify(response)

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'status': 'error', 'message': str(e)})

if __name__ == '__main__':
    app.run(port=5000)
