import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'DisplayScreen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isButtonPressed = false;
  XFile? _capturedImage; // To store captured image file

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras[0], // Select the first camera
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onCaptureButtonPressed() async {
    setState(() {
      _isButtonPressed = true;
    });

    try {
      // Ensure the controller is initialized before attempting to take a picture
      await _initializeControllerFuture;

      // Attempt to take a picture and log where it's been saved
      final XFile file = await _controller.takePicture();

      setState(() {
        _capturedImage = file;
      });
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void _onRetakeButtonPressed() {
    setState(() {
      _capturedImage = null;
      _isButtonPressed = false; // Reset button animation
    });
    initializeCamera(); // Reinitialize camera for another shot
  }

  void _onConfirmButtonPressed() {
    // Navigate to the DisplayScreen with the captured image path
    if (_capturedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayScreen(imagePath: _capturedImage!.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Camera', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _capturedImage != null
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(
                            File(_capturedImage!.path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 20.0,
                            right: 20.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: _onRetakeButtonPressed,
                                  iconSize: 40.0,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  icon: Icon(Icons.check),
                                  onPressed: _onConfirmButtonPressed,
                                  iconSize: 40.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _isButtonPressed ? null : _onCaptureButtonPressed,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _isButtonPressed ? 70.0 : 80.0,
                height: _isButtonPressed ? 70.0 : 80.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: _isButtonPressed ? 0.0 : 4.0,
                  ),
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: _isButtonPressed ? 50.0 : 60.0,
                    height: _isButtonPressed ? 50.0 : 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: _isButtonPressed ? 0.0 : 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
