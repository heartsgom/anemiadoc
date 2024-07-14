import 'package:flutter/material.dart';
import 'homepage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/doctor.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 540),
              _buildCircularButton(() {
                print("Clicked Another Button");
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(VoidCallback onPressed) {
    return Container(
      width: 60, // Adjust the width according to your preference
      height: 60, // Adjust the height according to your preference
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 61, 183, 231),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 43, 42, 42),
            spreadRadius: 8,
            blurRadius: 14,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Color.fromARGB(255, 95, 95, 95),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child:
            Icon(Icons.check, size: 40, color: Colors.white), // Check mark icon
      ),
    );
  }
}
