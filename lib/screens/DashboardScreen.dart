import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nxt_verify/screens/AskQrCodeScreen.dart';
import 'package:nxt_verify/screens/EnterNumberScreen.dart';
import 'package:nxt_verify/screens/OtpVerifyScreen.dart';
import 'package:nxt_verify/screens/PDFViewScreen.dart';
import 'package:nxt_verify/screens/ScanPermissionScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:pdf/pdf.dart';
import 'package:sizer/sizer.dart';
import 'package:pdf/widgets.dart' as pw;
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: Container(
            color: sh_white,
            height: 100.h,
            width: 100.w,
            // margin: EdgeInsets.fromLTRB(12,0,12,2),
            padding: EdgeInsets.fromLTRB(12,0,12,0),
            child: Column(children: [
              Container(height: 7.h,),
              Container(
                  height: 15.h,
                  padding: EdgeInsets.all(12),
                  child: Image.asset(
                    sh_app_logo,
                    // height: 100,
                    // width: 100,
                  )),
              Container(
                  height: 33.h,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.fromLTRB(20.0,20,20,0),
                  decoration: boxDecoration5(
                      bgColor: Colors.black87, radius: 20, showShadow: true),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "If you want user to identify themselves use with Authentication",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: sh_white,
                            fontSize: 16.sp,
                            letterSpacing: 1.1,
                            wordSpacing: 1.1,
                            fontFamily: "Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnterNumberScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          width: 65.w,
                          decoration: boxDecoration(
                              bgColor: Colors.white, radius: 10, showShadow: false),
                          child: Text(
                            "WITH AUTHENTICATION",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: sh_green,
                                fontSize: 10.sp,
                                letterSpacing: 1.1,
                                wordSpacing: 1.1,
                                fontFamily: "Medium"),
                          ),
                        ),
                      )
                    ],
                  )),
Container(height: 5.h,),
              Container(
                  height: 33.h,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.fromLTRB(20.0,00,20,0),
                  decoration: boxDecoration5(
                      bgColor: Colors.black87, radius: 20, showShadow: true),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "If you want user to remain anonymos use with Authentication",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: sh_white,
                            fontSize: 16.sp,
                            letterSpacing: 1.1,
                            wordSpacing: 1.1,
                            fontFamily: "Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => PDFViewScreen(
                          //         Added : false,
                          //         Title:  "",
                          //         Desc: "",
                          //         doc: pw.Document(pageMode: PdfPageMode.outlines),
                          //       )),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AskQrCodeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 65.w,
                          padding: EdgeInsets.all(16),
                          decoration: boxDecoration(
                              bgColor: Colors.white, radius: 10, showShadow: false),
                          child: Text(
                            "WITHOUT AUTHENTICATION",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: sh_green,
                                fontSize: 10.sp,
                                letterSpacing: 1.1,
                                wordSpacing: 1.1,
                                fontFamily: "Medium"),
                          ),
                        ),
                      )
                    ],
                  )),
              Container(height: 3.h,),
            ])),
      );
    });
  }
}
