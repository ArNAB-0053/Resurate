import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/jdModel.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({super.key});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  late TextEditingController nameController;
  late TextEditingController companyController;
  late TextEditingController jobSummeryController;
  late TextEditingController responsibilitiesController;
  late TextEditingController skillsController;
  late TextEditingController experienceController;
  late TextEditingController eligibilityController;
  late TextEditingController payController;
  late TextEditingController jobTypeController;
  late TextEditingController locationController;
  late TextEditingController openingController;
  late TextEditingController startController;
  late TextEditingController endController;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    companyController = TextEditingController();
    jobSummeryController = TextEditingController();
    responsibilitiesController = TextEditingController();
    skillsController = TextEditingController();
    experienceController = TextEditingController();
    eligibilityController = TextEditingController();
    payController = TextEditingController();
    jobTypeController = TextEditingController();
    locationController = TextEditingController();
    openingController = TextEditingController();
    startController = TextEditingController();
    endController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    companyController.dispose();
    jobSummeryController.dispose();
    responsibilitiesController.dispose();
    skillsController.dispose();
    experienceController.dispose();
    eligibilityController.dispose();
    payController.dispose();
    jobTypeController.dispose();
    locationController.dispose();
    openingController.dispose();
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  Future<void> _postJdModel() async {
    final jdModel = JdModel(
      name: nameController.text,
      company: companyController.text,
      jobSummary: jobSummeryController.text,
      responsibities: responsibilitiesController.text,
      skils: skillsController.text,
      eligbilty: eligibilityController.text,
      experience: experienceController.text,
      pay: payController.text,
      jobType: jobTypeController.text,
      location: locationController.text,
      openings: int.parse(openingController.text),
      startDate: startController.text,
      endDate: endController.text

    );


    final url = 'https://resurate.onrender.com/api/v1/job/new?id=Hello';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(jdModel.toJson()),
    );
try{
    if (response.statusCode == 200) {
      print('JdModel posted successfully');
    } else {
      print('Failed to post JdModel: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
  print('Error posting JdModel: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Job Description",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: companyController,
                decoration: InputDecoration(
                  labelText: "Company",
                  prefixIcon: Icon(
                    Icons.description_sharp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: jobSummeryController,
                decoration: InputDecoration(
                  labelText: "Job Summery",
                  prefixIcon: Icon(
                    Icons.repartition,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: responsibilitiesController,
                decoration: InputDecoration(
                  labelText: "Responsibility",
                  prefixIcon: Icon(
                    Icons.restore_page_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: skillsController,
                decoration: InputDecoration(
                  labelText: "Skills",
                  prefixIcon: Icon(
                    Icons.analytics,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: payController,
                decoration: InputDecoration(
                  labelText: "Salary",
                  prefixIcon: Icon(
                    Icons.money,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: experienceController,
                decoration: InputDecoration(
                  labelText: "Experience",
                  prefixIcon: Icon(
                    Icons.work_history,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: eligibilityController,
                decoration: InputDecoration(
                  labelText: "Eligibility",
                  prefixIcon: Icon(
                    Icons.plus_one_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: jobTypeController,
                decoration: InputDecoration(
                  labelText: "Job Types",
                  prefixIcon: Icon(
                    Icons.type_specimen,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Location",
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: openingController,
                decoration: InputDecoration(
                  labelText: "Openings",
                  prefixIcon: Icon(
                    Icons.open_in_browser,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: startController,
                decoration: InputDecoration(
                  labelText: "Start Date",
                  prefixIcon: Icon(
                    Icons.start_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: endController,
                decoration: InputDecoration(
                  labelText: "End Date",
                  prefixIcon: Icon(
                    Icons.pin_end,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // TextFormField(
              //   controller: companyController,
              //   decoration: InputDecoration(
              //     labelText: "Company",
              //     prefixIcon: Icon(
              //       Icons.email,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10),
              // Add other TextFormField widgets here for capturing other inputs
              SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    _postJdModel;
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}