import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _ImageState();
}
class _ImageState extends State<ImageView>{
  File image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Image Display here!!"),
      ),
      body: new Container(
        child: new Center(
          child: image==null
              ? new Text("No Image is Selected")
          : Image.file(image),
        ),
      ),
    );

  }
  //access image from camera or gallery
  Future imagePicker()async {
    File img =  await ImagePicker.pickImage(source: ImageSource.camera); //get image via camera
    //File img = await ImagePicker.pickVideo(source: ImageSource.gallery); //get access to gallery
    if (img != null) {
      image = img;
      print(image.path);
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
        imagePicker();
  }
}