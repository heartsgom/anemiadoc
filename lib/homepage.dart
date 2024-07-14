import 'package:flutter/material.dart';
import 'Camera.dart';
import 'ImageSelection.dart'; // Import the new Dart file

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgdr.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 190),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Hello, I am Anemia Doctor. I will help you detect if you have possible Anemia. Please scan your palm or select an image to get started!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SFPro', // Specify San Francisco font
                    fontWeight: FontWeight.w400, // Regular font weight
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton("Scan", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraScreen()),
                    );
                  }),
                  SizedBox(width: 20),
                  _buildButton("Select", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageSelectionPage()),
                    );
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
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 61, 183, 231),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(-4, -4),
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
}
