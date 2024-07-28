<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Symptom Checker</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>Select Symptoms</h1>
    <form id="symptom-form">
        <div>
            <!-- List all 86 symptoms -->
            <label><input type="checkbox" name="symptom" value="Fever"> Fever</label>
            <label><input type="checkbox" name="symptom" value="Nasal Discharge"> Nasal Discharge</label>
            <label><input type="checkbox" name="symptom" value="Loss of appetite"> Loss of appetite</label>
            <label><input type="checkbox" name="symptom" value="Weight Loss"> Weight Loss</label>
            <label><input type="checkbox" name="symptom" value="Lameness"> Lameness</label>
            <label><input type="checkbox" name="symptom" value="Breathing Difficulty"> Breathing Difficulty</label>
            <label><input type="checkbox" name="symptom" value="Swollen Lymph nodes"> Swollen Lymph nodes</label>
            <label><input type="checkbox" name="symptom" value="Lethargy"> Lethargy</label>
            <label><input type="checkbox" name="symptom" value="Depression"> Depression</label>
            <label><input type="checkbox" name="symptom" value="Coughing"> Coughing</label>
            <label><input type="checkbox" name="symptom" value="Diarrhea"> Diarrhea</label>
            <label><input type="checkbox" name="symptom" value="Seizures"> Seizures</label>
            <label><input type="checkbox" name="symptom" value="Vomiting"> Vomiting</label>
            <label><input type="checkbox" name="symptom" value="Eating less than usual"> Eating less than usual</label>
            <label><input type="checkbox" name="symptom" value="Excessive Salivation"> Excessive Salivation</label>
            <label><input type="checkbox" name="symptom" value="Redness around Eye area"> Redness around Eye area</label>
            <label><input type="checkbox" name="symptom" value="Severe Dehydration"> Severe Dehydration</label>
            <label><input type="checkbox" name="symptom" value="Pain"> Pain</label>
            <label><input type="checkbox" name="symptom" value="Discomfort"> Discomfort</label>
            <label><input type="checkbox" name="symptom" value="Sepsis"> Sepsis</label>
            <label><input type="checkbox" name="symptom" value="WeightLoss"> WeightLoss</label>
            <label><input type="checkbox" name="symptom" value="Tender abdomen"> Tender abdomen</label>
            <label><input type="checkbox" name="symptom" value="Increased drinking and urination"> Increased drinking and urination</label>
            <label><input type="checkbox" name="symptom" value="Bloated Stomach"> Bloated Stomach</label>
            <label><input type="checkbox" name="symptom" value="Yellow gums"> Yellow gums</label>
            <label><input type="checkbox" name="symptom" value="Constipation"> Constipation</label>
            <label><input type="checkbox" name="symptom" value="Paralysis"> Paralysis</label>
            <label><input type="checkbox" name="symptom" value="Wrinkled forehead"> Wrinkled forehead</label>
            <label><input type="checkbox" name="symptom" value="Continuously erect and stiff ears"> Continuously erect and stiff ears</label>
            <label><input type="checkbox" name="symptom" value="Grinning appearance"> Grinning appearance</label>
            <label><input type="checkbox" name="symptom" value="Stiff and hard tail"> Stiff and hard tail</label>
            <label><input type="checkbox" name="symptom" value="Stiffness of muscles"> Stiffness of muscles</label>
            <label><input type="checkbox" name="symptom" value="Acute blindness"> Acute blindness</label>
            <label><input type="checkbox" name="symptom" value="Blood in urine"> Blood in urine</label>
            <label><input type="checkbox" name="symptom" value="Hunger"> Hunger</label>
            <label><input type="checkbox" name="symptom" value="Cataracts"> Cataracts</label>
            <label><input type="checkbox" name="symptom" value="Losing sight"> Losing sight</label>
            <label><input type="checkbox" name="symptom" value="Glucose in urine"> Glucose in urine</label>
            <label><input type="checkbox" name="symptom" value="Burping"> Burping</label>
            <label><input type="checkbox" name="symptom" value="blood in stools"> blood in stools</label>
            <label><input type="checkbox" name="symptom" value="Passing gases"> Passing gases</label>
            <label><input type="checkbox" name="symptom" value="Eating grass"> Eating grass</label>
            <label><input type="checkbox" name="symptom" value="Scratching"> Scratching</label>
            <label><input type="checkbox" name="symptom" value="Licking"> Licking</label>
            <label><input type="checkbox" name="symptom" value="Itchy skin"> Itchy skin</label>
            <label><input type="checkbox" name="symptom" value="Redness of skin"> Redness of skin</label>
            <label><input type="checkbox" name="symptom" value="Face rubbing"> Face rubbing</label>
            <label><input type="checkbox" name="symptom" value="Loss of Fur"> Loss of Fur</label>
            <label><input type="checkbox" name="symptom" value="Swelling of gum"> Swelling of gum</label>
            <label><input type="checkbox" name="symptom" value="Redness of gum"> Redness of gum</label>
            <label><input type="checkbox" name="symptom" value="Receding gum"> Receding gum</label>
            <label><input type="checkbox" name="symptom" value="Bleeding of gum"> Bleeding of gum</label>
            <label><input type="checkbox" name="symptom" value="Plaque"> Plaque</label>
            <label><input type="checkbox" name="symptom" value="Bad breath"> Bad breath</label>
            <label><input type="checkbox" name="symptom" value="Tartar"> Tartar</label>
            <label><input type="checkbox" name="symptom" value="Lumps"> Lumps</label>
            <label><input type="checkbox" name="symptom" value="Swelling"> Swelling</label>
            <label><input type="checkbox" name="symptom" value="Red bumps"> Red bumps</label>
            <label><input type="checkbox" name="symptom" value="Scabs"> Scabs</label>
            <label><input type="checkbox" name="symptom" value="Irritation"> Irritation</label>
            <label><input type="checkbox" name="symptom" value="Dry Skin"> Dry Skin</label>
            <label><input type="checkbox" name="symptom" value="Fur loss"> Fur loss</label>
            <label><input type="checkbox" name="symptom" value="Red patches"> Red patches</label>
            <label><input type="checkbox" name="symptom" value="Heart Complication"> Heart Complication</label>
            <label><input type="checkbox" name="symptom" value="Weakness"> Weakness</label>
            <label><input type="checkbox" name="symptom" value="Aggression"> Aggression</label>
            <label><input type="checkbox" name="symptom" value="Pale gums"> Pale gums</label>
            <label><input type="checkbox" name="symptom" value="Coma"> Coma</label>
            <label><input type="checkbox" name="symptom" value="Collapse"> Collapse</label>
            <label><input type="checkbox" name="symptom" value="Abdominal pain"> Abdominal pain</label>
            <label><input type="checkbox" name="symptom" value="Difficulty Urinating"> Difficulty Urinating</label>
            <label><input type="checkbox" name="symptom" value="Dandruff"> Dandruff</label>
            <label><input type="checkbox" name="symptom" value="Anorexia"> Anorexia</label>
            <label><input type="checkbox" name="symptom" value="Blindness"> Blindness</label>
            <label><input type="checkbox" name="symptom" value="excess jaw tone"> excess jaw tone</label>
            <label><input type="checkbox" name="symptom" value="Urine infection"> Urine infection</label>
            <label><input type="checkbox" name="symptom" value="Lack of energy"> Lack of energy</label>
            <label><input type="checkbox" name="symptom" value="Smelly"> Smelly</label>
            <label><input type="checkbox" name="symptom" value="Neurological Disorders"> Neurological Disorders</label>
            <label><input type="checkbox" name="symptom" value="Eye Discharge"> Eye Discharge</label>
            <label><input type="checkbox" name="symptom" value="Loss of Consciousness"> Loss of Consciousness</label>
            <label><input type="checkbox" name="symptom" value="Enlarged Liver"> Enlarged Liver</label>
            <label><input type="checkbox" name="symptom" value="lethargy"> lethargy</label>
            <label><input type="checkbox" name="symptom" value="Purging"> Purging</label>
            <label><input type="checkbox" name="symptom" value="Bloody discharge"> Bloody discharge</label>
            <label><input type="checkbox" name="symptom" value="Wounds"> Wounds</label>
        </div>
        <button type="submit">Submit</button>
    </form>

    <div id="result"></div>

    <script>
        $(document).ready(function() {
            $('#symptom-form').on('submit', function(event) {
                event.preventDefault();
                
                // Create a list of 86 symptoms initialized to 0
                var symptomsList = [
                    'Fever', 'Nasal Discharge', 'Loss of appetite', 'Weight Loss', 'Lameness', 'Breathing Difficulty', 
                    'Swollen Lymph nodes', 'Lethargy', 'Depression', 'Coughing', 'Diarrhea', 'Seizures', 'Vomiting',
                    'Eating less than usual', 'Excessive Salivation', 'Redness around Eye area', 'Severe Dehydration', 
                    'Pain', 'Discomfort', 'Sepsis', 'WeightLoss', 'Tender abdomen', 'Increased drinking and urination',
                    'Bloated Stomach', 'Yellow gums', 'Constipation', 'Paralysis', 'Wrinkled forehead',
                    'Continuously erect and stiff ears', 'Grinning appearance', 'Stiff and hard tail', 
                    'Stiffness of muscles', 'Acute blindness', 'Blood in urine', 'Hunger', 'Cataracts', 
                    'Losing sight', 'Glucose in urine', 'Burping', 'blood in stools', 'Passing gases', 
                    'Eating grass', 'Scratching', 'Licking', 'Itchy skin', 'Redness of skin', 'Face rubbing', 
                    'Loss of Fur', 'Swelling of gum', 'Redness of gum', 'Receding gum', 'Bleeding of gum',
                    'Plaque', 'Bad breath', 'Tartar', 'Lumps', 'Swelling', 'Red bumps', 'Scabs', 
                    'Irritation', 'Dry Skin', 'Fur loss', 'Red patches', 'Heart Complication', 'Weakness', 
                    'Aggression', 'Pale gums', 'Coma', 'Collapse', 'Abdominal pain', 'Difficulty Urinating',
                    'Dandruff', 'Anorexia', 'Blindness', 'excess jaw tone', 'Urine infection', 'Lack of energy',
                    'Smelly', 'Neurological Disorders', 'Eye Discharge', 'Loss of Consciousness', 'Enlarged Liver',
                    'lethargy', 'Purging', 'Bloody discharge', 'Wounds'
                ];

                var selectedSymptoms = {};
                symptomsList.forEach(function(symptom) {
                    selectedSymptoms[symptom] = 0;
                });

                $('input[name="symptom"]:checked').each(function() {
                    selectedSymptoms[$(this).val()] = 1;
                });

                $.ajax({
                    url: 'http://localhost:5000/predict',  // Flask API URL
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(selectedSymptoms),
                    success: function(response) {
                        $('#result').html('Predicted Disease: ' + response.disease);
                    },
                    error: function(xhr, status, error) {
                        $('#result').html('An error occurred: ' + error);
                    }
                });
            });
        });
    </script>
</body>
</html>
    