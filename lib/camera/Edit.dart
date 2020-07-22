import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan_me/camera/camerass.dart';
import 'package:scan_me/camera/filterScreen.dart';
import 'package:scan_me/camera/get_PDF_code.dart';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'package:photofilters/photofilters.dart';

import 'Crop.dart';

class Edit extends StatefulWidget {
  static const String id = "Edit";
  final File file;
  final String path;
  Edit({this.file,this.path});

  @override
  _EditState createState() => new _EditState();
}

class _EditState extends State<Edit> {
  final cropKey = GlobalKey<ImgCropState>();
  File newImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.file(widget.file)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Crop(
                                    file: widget.file,
                                  )));
                        },
                        child: Text(
                          "Crop",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        onPressed: ()async{

                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => FilterScreen(file:widget.file,path: widget.path,)));
                        newImage = widget.file;
                        return newImage;
                        },
                        child: Text("Add filter",style: TextStyle(color: Colors.white),),
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => Pdfs(file: widget.file,path: widget.path,)));


                        },
                        child: Text("Next",style: TextStyle(color: Colors.white),),
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
