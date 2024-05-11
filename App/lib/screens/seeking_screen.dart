import 'package:flutter/material.dart';

class SeekingPage extends StatefulWidget {
  const SeekingPage({super.key});

  @override
  State<SeekingPage> createState() => _SeekingPageState();
}

class _SeekingPageState extends State<SeekingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is seeking job page"),
    );
  }
}
