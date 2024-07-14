import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionPage extends StatefulWidget {
  @override
  _ImageSelectionPageState createState() => _ImageSelectionPageState();
}

class _ImageSelectionPageState extends State<ImageSelectionPage> {
  Future<void> _handleImageSelection() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle selected image (you can add further processing here if needed)
      print("Image selected: ${pickedFile.path}");
    } else {
      print("No image selected");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleImageSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Image'),
      ),
      body: Container(), // Empty container, no UI shown
    );
  }
}
