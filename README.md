# flutter_galery

[Source](https://pub.dev/packages/image_picker)
 [Tutorial](https://www.youtube.com/watch?v=3xlREA-SL_k&ab_channel=CodewithKavit)

```
dependencies:
    ...
  image_picker: ^0.8.3
```

- ios/Runner/Info.plist
```
<plist version="1.0">
<dict>
    ...
	<key>NSPhotoLibraryUsageDescription</key>
	<string>Photo Library Access Warning</string>
	<key>NSCameraUsageDescription</key>
	<string>Camera Library Access Warning</string>
</dict>
</plist>
```

- android/app/src/main/AndroidManifest.xml
```xml
<manifest
    ...
    package="com.gzeinnumer.fluttergalery.flutter_galery">
   <application
        android:requestLegacyExternalStorage="true"
        ...
        android:icon="@mipmap/ic_launcher">
            ...
    </application>
</manifest>
```


- [main.dart](https://github.com/gzeinnumer/flutter_galery/blob/master/lib/main.dart)
```dart
import 'dart:io';

...

class _MyHomePageState extends State<MyHomePage> {
  File? image;

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
                onPressed: () {
                  pickImageGalery();
                },
              ),
              MaterialButton(
                onPressed: () {
                  pickImageCamera();
                },
              ),
              if(image != null) Text('Path : ${image!.path}'),
              SizedBox(
                height: 500,
                child: image != null ? Image.file(image!) : const Text("No Image Selected"),
              )
            ],
          ),
        ),
    );
  }
}
```

---

```
Copyright 2022 M. Fadli Zein
```
