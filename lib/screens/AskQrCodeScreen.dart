import 'package:flutter/material.dart';
import 'package:nxt_verify/screens/QrScanPermissionScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:sizer/sizer.dart';

class AskQrCodeScreen extends StatefulWidget {
  const AskQrCodeScreen({Key? key}) : super(key: key);

  @override
  _AskQrCodeScreenState createState() => _AskQrCodeScreenState();
}

class _AskQrCodeScreenState extends State<AskQrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            backgroundColor: sh_white,
            appBar: AppBar(
              elevation: 0,
              title: Text(""),
              backgroundColor: sh_white,
              iconTheme: IconThemeData(color: sh_textColorPrimary),
              actionsIconTheme: IconThemeData(color: sh_white),
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              child: Stack(
                children: [
                  Positioned.fill(

                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 50.h,
                        width: 65.w,
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 35.h,
                          child: Center(
                            child: Image.asset(
                              sh_my_qr,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(

                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50.h,
                        width: 100.w,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                        alignment: Alignment.topCenter,
                        decoration: boxDecoration6(
                             radius: 30, showShadow: true),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Color(0xff888888),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))),

                              child: Text("Scan QR Code",style: TextStyle(color: sh_white,fontSize: 16.sp,letterSpacing: 1.0,fontFamily: 'Medium'),),
                            ),
                            Container(
                              width: 80.w,
                              child: Text("Click on the bottom below to start scanning the QR Code",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xffC4C6C8),fontSize: 15.sp,letterSpacing: 1.0,fontFamily: 'Regular'),),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QrScanPermissionScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                width: 75.w,
                                decoration: boxDecoration(
                                    bgColor: Colors.white, radius: 10, showShadow: false),
                                child: Text(
                                  "SCAN QR CODE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff2CBA88),
                                      fontSize: 14.sp,
                                      letterSpacing: 1.1,
                                      wordSpacing: 1.1,
                                      fontFamily: "Medium"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
