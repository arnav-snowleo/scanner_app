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

import 'get_PDF_code.dart';

enum _sheetType { gallery, camera }

class Crop extends StatelessWidget {
  File file;
  final String path;
  Crop({this.file, this.path});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "crop_page": (context) => Crops(
              file: file,
              path: path,
            ),
        "/": (context) => MyHomeRoute(
              file: file,
            )
      },
    );
  }
}

class MyHomeRoute extends StatefulWidget {
  File file;
  MyHomeRoute({this.file});
  @override
  _MyHomeRouteState createState() => new _MyHomeRouteState();
}

class _MyHomeRouteState extends State<MyHomeRoute> {
  @override
  void initState() {
    super.initState();
    getImage();
  }

  Future getImage() async {
    Navigator.of(context)
        .pushNamed('crop_page', arguments: {'image': widget.file});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Crops extends StatefulWidget {
  File file;
  final String path;
  Crops({this.file, this.path});
  @override
  _CropsState createState() => _CropsState();
}

class _CropsState extends State<Crops> {
  final cropKey = GlobalKey<ImgCropState>();

  Future<Null> showImage(BuildContext context, File file) async {
    new FileImage(file)
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      print('-------------------------------------------$info');
    }));
    return showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                'Current screenshot：',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.1),
              ),
              actions: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('NEXT'),
                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: () async {
                    String timestamp() =>
                        DateTime.now().millisecondsSinceEpoch.toString();
                    final Directory extDir =
                        await getApplicationDocumentsDirectory();
                    final String dirPath = '${extDir.path}/Images/flutter_test';
                    await Directory(dirPath).create(recursive: true);
                    final File newImage =
                        await file.copy('$dirPath/${timestamp()}.jpg');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Edit(
                                  file: file,
                                  path: dirPath,
                                )));
                    File tempLocalFile = widget.file;
                    if (tempLocalFile.existsSync()) {
                      await tempLocalFile.delete(
                        recursive: true,
                      );
                    }
                  },
                ),
              ],
              content: Image.file(file));
        });
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Zoom and Crop',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon:
                new Icon(Icons.navigate_before, color: Colors.black, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: ImgCrop(
            key: cropKey,
            // chipRadius: 100,
            // chipShape: 'rect',
            maximumScale: 3,
            image: FileImage(args['image']),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () async {
            final crop = cropKey.currentState;
            final croppedFile =
                await crop.cropCompleted(args['image'], pictureQuality: 600);
            showImage(context, croppedFile);
          },
          tooltip: 'Increment',
          child: Text(
            'Crop',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }
}
