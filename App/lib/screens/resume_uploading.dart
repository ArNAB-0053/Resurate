// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   File? _selectedFile;
//
//   Future<void> _selectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );
//
//     if (result != null) {
//       setState(() {
//         _selectedFile = File(result.files.single.path!);
//       });
//     }
//   }
//
//   Future<void> _uploadFile() async {
//     if (_selectedFile != null) {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('YOUR_UPLOAD_ENDPOINT_HERE'),
//       );
//
//       request.files.add(
//         await http.MultipartFile.fromPath('pdf', _selectedFile!.path),
//       );
//
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         print('File uploaded successfully');
//       } else {
//         print('Error uploading file: ${response.reasonPhrase}');
//       }
//     } else {
//       print('No file selected');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Resume Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _selectFile,
//               child: Text('Select Resume'),
//             ),
//             SizedBox(height: 20),
//             if (_selectedFile != null)
//               Text(
//                 'Selected File: ${_selectedFile!.path}',
//                 textAlign: TextAlign.center,
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadFile,
//               child: Text('Upload Resume'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }