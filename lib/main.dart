import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;

  //todo 3
  Future pickImageGalery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on Exception catch (e) {
      print("Failed to pick image : $e");
    }
  }

  //todo 4
  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on Exception catch (e) {
      print("Failed to pick image : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: const Text("Pick Image From Galery", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  //todo 5
                  pickImageGalery();
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: const Text("Pick Image From Camera", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  //todo 6
                  pickImageCamera();
                },
              ),
              const SizedBox(height: 20),
              if(image != null) Text('Path : ${image!.path}'),
              SizedBox(
                height: 500,
                child: image != null ? Image.file(image!) : const Text("No Image Selected"),
              )
            ],
          ),
        ));
  }
}

//todo 2
/*
- ios/Runner/Info.plist

IoS Config

<key>NSPhotoLibraryUsageDescription</key>
<string>Photo Library Access Warning</string>
<key>NSCameraUsageDescription</key>
<string>Camera Library Access Warning</string>
 */
/*
Android Config

requestLegacyExternalStorage="true"
 */
