import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// var jd =
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  // Future<void> _sortResumes() async {
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(''),
  //     );
  //
  //     // request.files.add(
  //     //   await http.MultipartFile.fromPath('pdf', _selectedFile!.path),
  //     // );
  //
  //     var response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       print('File uploaded successfully');
  //     } else {
  //       print('Error uploading file: ${response.reasonPhrase}');
  //     }
  //   } catch(e) {
  //     print(e);
  //   }
  // }


  Future<void> sendPostRequest() async {
    try {
      // Define the API endpoint
      var url = Uri.parse('AI');

      // Define the request body (if needed)
      var body =  {
        {
          "Job_Title": "Data Scientist",
          "Company": "Microsoft",
          "Location": "Bangalore",
          "Job_Type": "Full Time",
          "Job_Summary": {
            "About_the_role": "We are looking for a skilled Data Scientist to join our team. As a Data Scientist, you will be responsible for analyzing complex datasets, developing predictive models, and providing valuable insights to drive business decision-making."
          },
          "Responsibilities": {
            [
              "Analyze and interpret large datasets to provide actionable insights.",
              "Develop machine learning models and algorithms for predictive analysis.",
              "Collaborate with cross-functional teams to understand business needs and deliver solutions.",
              "Create data visualizations to communicate findings effectively.",
              "Stay updated with the latest trends and technologies in data science."
            ]
          },
          "Skills_Required": [
            "Python",
            "Machine Learning",
            "Data Analysis",
            "Statistical Analysis",
            "Data Visualization",
            "Communication Skills"
          ],
          "Eligibility": {
            "Bachelor's/Master's degree in Computer Science, Statistics, Mathematics, or related field.",
            "[X years] of experience in data science or related field."
          }
        }

      };

      // Send the POST request
      var response = await http.post(
        url,
        body: body,
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Request successful, print response
        print('Response: ${response.body}');
      } else {
        // Request failed
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.grey.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: sendPostRequest,
              child: Text('Sort Resume'),
            ),
          ],
        ),
      ),
    );
  }
}

