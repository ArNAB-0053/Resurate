import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:resurate/models/Model_api.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _selectedFile;
  List<ModelApi> apiList = [];

  Future<void> _selectAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });

      await _uploadFile();
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile != null) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.0.2.2:3000'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('resume', _selectedFile!.path),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Error uploading file: ${response.reasonPhrase}');
      }
    } else {
      print('No file selected');
    }
  }

  Future<List<ModelApi>> getRequest() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      final List<ModelApi> tempList = [];

      if (responseData is List) {
        for (Map<String, dynamic> i in responseData) {
          ModelApi modelApi = ModelApi(
            name: i['Name'] ?? '',
            percentage: i['Percentage'] ?? 0,
          );
          tempList.add(modelApi);
        }
      } else if (responseData is Map<String, dynamic>) {
        ModelApi modelApi = ModelApi(
          name: responseData['Name'] ?? '',
          percentage: responseData['Percentage'] ?? 0,
        );
        tempList.add(modelApi);
      }

      return tempList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _sortData() {
    apiList.sort((a, b) => b.percentage.compareTo(a.percentage));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text('Resume Upload',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<ModelApi>>(
              future: getRequest(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  apiList = snapshot.data!;
                  return ListView.builder(
                    itemCount: apiList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(apiList[index].name),
                        subtitle: Text(
                            'Percentage: ${apiList[index].percentage}'),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    backgroundColor: Colors.grey[200],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _selectAndUploadFile,
                    child: Text('Upload Resume', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _sortData,
                    child: Text('Sorting Resume', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
