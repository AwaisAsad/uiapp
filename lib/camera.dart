import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'index.dart';

//import 'image_picker_channel.dart';

//void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Pest Scout App',
//       theme: ThemeData(
//         primarySwatch: Colors.lightGreen,
//       ),
//       home: MyHomePage(title: 'Pest Scout'),
//
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final ImagePicker _imagePicker = ImagePickerChannel();

  File _imageFile;

  Future<void> captureImage(ImageSource imageSource) async {
    try {
      final imageFile = await ImagePicker.pickImage(source: imageSource);
      setState(() {
        _imageFile = imageFile;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _buildImage() {
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else {
      return Text('Take an image to start', style: TextStyle(fontSize: 18.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,

        title: Text('Pest Scout',style: TextStyle(color: Colors.white60),),
        actions: <Widget>[
      IconButton(
      icon: Icon(
        Icons.close_rounded,
        color: Colors.white60,
      ),
        onPressed: () {
          setState(() {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => InputPage()));
          });
        },),],
    ),
      body: Column(
        children: [
          Expanded(child: Center(child: _buildImage())),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return ConstrainedBox(
        constraints: BoxConstraints.expand(height: 80.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildActionButton(
                key: Key('retake'),
                text: 'Photos',
                onPressed: () => captureImage(ImageSource.gallery),
              ),
              _buildActionButton(
                key: Key('upload'),
                text: 'Camera',
                onPressed: () => captureImage(ImageSource.camera),
              ),
            ]));
  }

  Widget _buildActionButton({Key key, String text, Function onPressed}) {
    return Expanded(
      child: FlatButton(
          key: key,
          child: Text(text, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
          shape: RoundedRectangleBorder(),
          color: Colors.lightGreen,
          textColor: Colors.black,
          onPressed: onPressed),
    );
  }
}
