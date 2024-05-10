from flask import Flask, request, jsonify
from flask_cors import CORS
from resumeParsing import matchingPer
import json

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

resume_path1 = "resumes/resume.pdf"
resume_path2 = "resumes/Alice Clark CV.pdf"
resume_path3 = "resumes/Smith Resume.pdf"
resume_path4 = "resumes/myres.pdf"
resume_path5 = "resumes/data-scientist-resume-example.pdf"

@app.route('/', methods=['GET','POST'])
def display_disease():
    matchPer1 = matchingPer(resume_path1)
    matchPer2 = matchingPer(resume_path2)
    matchPer3 = matchingPer(resume_path3)
    matchPer4 = matchingPer(resume_path4)
    matchPer5 = matchingPer(resume_path5)
    
    # Preparing response
    result = [
        {
            "Name": matchPer1['name'],
            "Percentage" : matchPer1['per']
        },
        {
            "Name": matchPer2['name'],
            "Percentage" : matchPer2['per']
        },
        {
            "Name": matchPer3['name'],
            "Percentage" : matchPer3['per']
        },
        {
            "Name": matchPer4['name'],
            "Percentage" : matchPer4['per']
        },
        {
            "Name": matchPer5['name'],
            "Percentage" : matchPer5['per']
        }
    ]

    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True, port=3000)
