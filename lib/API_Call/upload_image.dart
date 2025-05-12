import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImages() async {
    final pickerFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickerFile != null) {
      image = File(pickerFile.path);
      print("Image Picked From $image");
      setState(() {});
    } else {
      print("No Image Selected.");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    print("image :  $image");

    var stream = http.ByteStream(image!.openRead());
    print("Stream $stream");
    stream.cast();

    var length = await image!.length();
    var url = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', url);
    request.fields['title'] = "Static Title";
    var multiport = new http.MultipartFile('image', stream, length);
    request.files.add(multiport);
    var response = await request.send();

    print(response.stream.toString());

    if (response.statusCode == 200) {
      print("Image Uploaded.");

      setState(() {
        showSpinner = false;
      });
    } else {
      print("Fail");
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Images"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ()=>getImages(),
              child: Container(
                child: image == null
                    ? Center(
                        child: Text("Pick Image"),
                      )
                    : Container(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                color: Colors.green,
                child: Align(alignment: Alignment.center,child: Text("Upload")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
