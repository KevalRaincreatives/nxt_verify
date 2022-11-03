import 'package:flutter/material.dart';
import 'package:nxt_verify/screens/PDFViewScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShConstant.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:pdf/widgets.dart' as pw;

class AddDummyPDF extends StatefulWidget {
  final pw.Document doc;
  final String? title;
  final String? desc;
  final bool? added;
  AddDummyPDF({required this.doc,this.added,this.title,this.desc});

  @override
  _AddDummyPDFState createState() => _AddDummyPDFState();
}

class _AddDummyPDFState extends State<AddDummyPDF> {
  final _formKey = GlobalKey<FormState>();
  var oldpasswordCont = TextEditingController();
  var passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
appBar: AppBar(
  elevation: 0,
  backgroundColor: sh_colorPrimary2,
  title: Text(
    "Add Page",
    style: TextStyle(color: sh_white,fontFamily: 'Cursive',fontSize: 40),
  ),
  iconTheme: IconThemeData(color: sh_white),

),
      body: Container(
        height: height,
        width: width,
        color: sh_white,
        margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child:  Container(
          height: height,
          width: width,
          color: sh_white,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(spacing_standard_new),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: spacing_standard_new),
                            Text(
                              'Title',
                              style: TextStyle(
                                  color: sh_colorPrimary2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              autofocus: false,
                              controller: oldpasswordCont,
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  color: sh_textColorPrimary,
                                  fontFamily: fontRegular,
                                  fontSize: textSizeMedium),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: false,
                                  hintText: 'Title',

                                  hintStyle: TextStyle(
                                      color: sh_textColorSecondary,
                                      fontFamily: fontRegular,
                                      fontSize: textSizeMedium),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5), width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5), width: 0))),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: sh_colorPrimary2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              autofocus: false,
                              controller: passwordCont,
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(
                                  color: sh_textColorPrimary,
                                  fontFamily: fontRegular,
                                  fontSize: textSizeMedium),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: false,
                                  hintText: "Description",

                                  hintStyle: TextStyle(
                                      color: sh_textColorSecondary,
                                      fontFamily: fontRegular,
                                      fontSize: textSizeMedium),
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5), width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5), width: 0))),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              // height: double.infinity,
                              child: MaterialButton(
                                padding: EdgeInsets.all(spacing_standard),
                                child: text("Add",
                                    fontSize: textSizeNormal,
                                    fontFamily: fontMedium,
                                    textColor: sh_white),
                                textColor: sh_white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(40.0)),
                                color: sh_colorPrimary2,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // TODO submit
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    String jj="true|"+oldpasswordCont.text+"|"+passwordCont.text;
                                    Navigator.pop(context, jj);
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => PDFViewScreen(
                                    //           Added : true,
                                    //           Title:  oldpasswordCont.text,
                                    //           Desc: passwordCont.text,
                                    //         doc: widget.doc,
                                    //       )),
                                    // );
                                    // getChange();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
