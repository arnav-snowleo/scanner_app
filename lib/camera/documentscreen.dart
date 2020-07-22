import 'dart:io' as io;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_to_pdf/images_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:scan_me/camera/camerass.dart';
import 'Edit.dart';
import 'homepage.dart';

class Docscreen extends StatefulWidget {
  static const String id = "Docscreen";
  final File file;
  final String path;

  Docscreen({this.file, this.path});

  @override
  _DocscreenState createState() => _DocscreenState();
}

class _DocscreenState extends State<Docscreen> {
  List file = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listofFiles();
  }

  void _listofFiles() async {
    var directory = (await getApplicationDocumentsDirectory()).path;
    final  Directory extDir = await getApplicationDocumentsDirectory();
    setState(() {
      file = io.Directory('${extDir.path}/pdf/flutter_test').listSync();
    });
  }
  String _openResult = 'application/pdf';
  Future<void> openFile() async {
    var directory = (await getApplicationDocumentsDirectory()).path;
    final  Directory extDir = await getApplicationDocumentsDirectory();
    final filePath = '${extDir.path}/pdf/flutter_test';
    final result = await OpenFile.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });

  }
  // Build Part
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Homepage.id);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("Get List of Files with whole Path"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: file.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('open result: $_openResult\n'),
                      FlatButton(
                        child: Text('Tap to open file'),
                        onPressed: openFile,
                      ),
                    ],
                  );


                }),
          ),
          ],
      ),
    );
  }
}
