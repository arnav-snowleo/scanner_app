import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scan_me/camera/Edit.dart';
import 'package:scan_me/camera/filterScreen.dart';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'package:photofilters/photofilters.dart';

enum _sheetType { gallery, camera }


class CameraMain extends StatefulWidget {
  static const String id = "CameraMain";
  @override
  _CameraMainState createState() => new _CameraMainState();
}

class _CameraMainState extends State<CameraMain> {
  final cropKey = GlobalKey<ImgCropState>();

  Future getImage(type) async {
    var image = await ImagePicker.pickImage(
        source: type == _sheetType.gallery
            ? ImageSource.gallery
            : ImageSource.camera);
    if (image == null) return ;
    String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
    final Directory extDir = await getApplicationDocumentsDirectory();

    final String dirPath = '${extDir.path}/Images/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final File newImage = await image.copy('$dirPath/${timestamp()}.jpg');
    setState(() {
      image = newImage;
    });
    Navigator.pushNamed(context, Edit.id);
    Navigator.push(
        context, MaterialPageRoute(
        builder: (context) => Edit(file: newImage,path: dirPath,)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select image'),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Camera",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  color: Colors.deepOrange,
                  onPressed:(){ getImage(_sheetType.camera);}  )),

            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  color: Colors.deepOrange,
                  onPressed:(){getImage(_sheetType.gallery);}),
            ),
          ],
        ),
      )

    );
  }
}



