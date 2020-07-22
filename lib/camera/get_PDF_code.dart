import 'dart:io' as io;
import 'dart:io';
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

class Pdfs extends StatefulWidget {
  static const String id = "Pdfs";
  final File file;
  final String path;

  Pdfs({this.file, this.path});

  @override
  _PdfsState createState() => _PdfsState();
}

class _PdfsState extends State<Pdfs> {
  List file = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listofFiles();
  }

  File _pdfFile;
  String _status = "Not created";
  FileStat _pdfStat;
  bool _generating = false;

  Future<File> _assetFromBundle(String name) async {
    final tempDir = await getApplicationDocumentsDirectory();
    final output = File(path.join(tempDir.path, name));

    if (!await output.exists()) {
      final data = await rootBundle.load(widget.path);
      final buffer = data.buffer;
      output.writeAsBytes(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    }

    return output;
  }

  Future<void> _createPdf() async {
    try {
      this.setState(() => _generating = true);
      String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
      final  Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/pdf/flutter_test';
      await Directory(dirPath).create(recursive: true);
      final output = File(path.join('$dirPath/${timestamp()}.pdf'));
      this.setState(() => _status = 'Preparing images...');
      this.setState(() => _status = 'Generating PDF');
      await ImagesToPdf.createPdf(
        pages: file
            .map(
              (file) => PdfPage(
                imageFile: file,
                size: Size(	1240 , 1754),
                compressionQuality: 0.5,
              ),
            )
            .toList(),
        output: output,
      );
      _pdfStat = await output.stat();
      this.setState(() {
        _pdfFile = output;
        _status = 'PDF Generated (${_pdfStat.size ~/ 1024}kb)';
        final dir = Directory(widget.path);
        dir.deleteSync(recursive: true);
      });
    } catch (e) {
      this.setState(() => _status = 'Failed to generate pdf: $e".');
    } finally {
      this.setState(() => _generating = false);
    }
  }

  Future<void> _openPdf() async {
    if (_pdfFile != null) {
      try {
        final bytes = await _pdfFile.readAsBytes();
        await Printing.sharePdf(
            bytes: bytes, filename: path.basename(_pdfFile.path));
      } catch (e) {
        _status = 'Failed to open pdf: $e".';
      }
    }
  }

  void _listofFiles() async {
    var directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      file = io.Directory(widget.path)
          .listSync();
    });
  }

  // Build Part
  @override
  Widget build(BuildContext context) {
    final isLoading = _generating;
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(file[index]),
                  );
                }),
          ),
          if (isLoading) CircularProgressIndicator(),
          if (!isLoading) ...[
            if (_pdfFile == null)
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                  onTap:_createPdf ,
                  child: Container(
                    decoration:    ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),color: Colors.black
                  ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40,10,40,10),
                      child: Text("Generate PDF",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                )
              ),
            if (_pdfFile != null)
              Padding(
                padding: const EdgeInsets.all(25.0),

                child: GestureDetector(
                  onTap: _openPdf ,
                  child: Container(
                    decoration:    ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),color: Colors.black
                    ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40,10,40,10),
                      child: Text("Open PDF",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              )


          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.linked_camera),
          onPressed: () {
            Navigator.pushNamed(context, CameraMain.id);
          }),
    );
  }
}
