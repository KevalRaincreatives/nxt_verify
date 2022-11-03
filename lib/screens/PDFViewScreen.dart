import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nxt_verify/screens/AddDummyPDF.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/data.dart';
import 'package:nxt_verify/utils/document.dart';
import 'package:nxt_verify/utils/document2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFViewScreen extends StatefulWidget {
  final String? Title,Desc;
  final bool? Added;
  final pw.Document doc;
   PDFViewScreen({this.Added,this.Title,this.Desc,required this.doc}) ;

  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> with SingleTickerProviderStateMixin{
  var _data = const CustomData();
  var _data2 = const AddData();
  // PdfPageFormat? pageFormat;



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _init();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _init() async {

  //   if(widget.Added!){
  //   setState(() {
  //     _data2=AddData(isAdded: true,title: widget.Title!,descp: widget.Desc!)    ;
  //   });
  //
  // }
    // askName(context).then((value) {
    //   if (value != null) {
    //     setState(() {
    //       _data = CustomData(name: value);
    //     });
    //   }
    // });
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> _saveAsFile(BuildContext context, LayoutCallback build, PdfPageFormat pageFormat,) async {
    final bytes = await build(pageFormat);
    pageFormat=pageFormat;

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  Future<String?> askName(BuildContext context) {
    return showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          final controller = TextEditingController();

          return AlertDialog(
            title: const Text('Please type your Details:'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: TextField(
              decoration: const InputDecoration(hintText: 'Growth Oriented Enterprises'),
              controller: controller,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (controller.text != '') {
                    Navigator.pop(context, controller.text);
                  }
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {


    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];





    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter PDF Demo'),
        iconTheme: IconThemeData(color: sh_white),
        actions: <Widget>[
          IconButton(
              color: sh_white,
              icon: Icon(Icons.add),
              onPressed: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.setString('from', "address");
                //
                var bool = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddDummyPDF(doc: widget.doc,))) ?? false;
                // if (bool) {
                //   fetchData();
                // }
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddDummyPDF(doc: widget.doc,
                        added: true,title: '',desc: '')));
                if (!mounted) return;

                // After the Selection Screen returns a result, hide any previous snackbars
                // and show the new result.

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$result')));
              }),
          SizedBox(
            width: 22,
          ),
        ],
      ),
      body:

      PdfPreview(
        maxPageWidth: 900,
        build: (format) => generateDocument(format, _data2),
        actions: actions,
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
      ),
    );
  }
}
