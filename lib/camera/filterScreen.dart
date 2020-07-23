import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/widgets/photo_filter.dart';
import 'package:scan_me/camera/Edit.dart';

import 'get_PDF_code.dart';

class FilterScreen extends StatefulWidget {
  static const String id = "FilterScreen";
  final File file;
  final String path;
  FilterScreen({this.file, this.path});

  @override
  _FilterScreenState createState() => new _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String fileName;
  List<Filter> filters = presetFiltersList;
  File imageFile;

  Future getImage(context) async {
    imageFile = widget.file;
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image, width: 600);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter Example"),
          image: image,
          filters: presetFiltersList,
          filename: fileName,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
      });
      print(imageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Photo Filter'),
      ),
      body: Center(
          child: new Container(
              height: 400,
              width: 400,
              child: imageFile == null
                  ? Center(
                      child: Image.file(widget.file),
                    )
                  : Container(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Image.file(imageFile),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            onPressed: () async {
                              String timestamp() => DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              final Directory extDir =
                                  await getApplicationDocumentsDirectory();
                              final String dirPath =
                                  '${extDir.path}/Images/flutter_test';
                              await Directory(dirPath).create(recursive: true);
                              final File newImage = await imageFile
                                  .copy('$dirPath/${timestamp()}.jpg');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edit(
                                            file: newImage,
                                            path: dirPath,
                                          )));
                              File tempLocalFile = widget.file;
                              if (tempLocalFile.existsSync()) {
                                await tempLocalFile.delete(
                                  recursive: true,
                                );
                              }
                            },
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.indigo,
                          )
                        ],
                      ),
                    ))),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => getImage(context),
        tooltip: 'Pick Image',
        child: new Icon(Icons.filter),
      ),
    );
  }
}
