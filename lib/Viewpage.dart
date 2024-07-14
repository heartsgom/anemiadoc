import 'package:flutter/material.dart';
import 'homepage.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 500),
              _buildCircularButton(() {
                print("Clicked Another Button");
              }),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton("Scan", () {
                    print("Clicked Scan");
                  }),
                  SizedBox(width: 20),
                  _buildButton("Select", () {
                    print("Select Image");
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, VoidCallback onPressed) {
    return Container(
      height: 35,
      width: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 61, 183, 231),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 99, 98, 98),
            spreadRadius: 1,
            blurRadius: 8,
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
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Color.fromARGB(255, 32, 30, 32),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'SFPro', // Specify San Francisco font
            ),
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
            color: Color.fromARGB(255, 99, 98, 98),
            spreadRadius: 1,
            blurRadius: 8,
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
