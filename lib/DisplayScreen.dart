import 'dart:io';

import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String imagePath;

  DisplayScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Captured Image'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
