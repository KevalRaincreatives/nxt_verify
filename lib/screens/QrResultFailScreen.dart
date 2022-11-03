import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:majascan/majascan.dart';
import 'package:nxt_verify/model/SuccessModel.dart';
import 'package:nxt_verify/screens/NoInternetScreen.dart';
import 'package:nxt_verify/screens/QrResultScreen.dart';
import 'package:nxt_verify/screens/QrResultSuccessScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';


class QrResultFailScreen extends StatefulWidget {
  const QrResultFailScreen({Key? key}) : super(key: key);

  @override
  _QrResultFailScreenState createState() => _QrResultFailScreenState();
}

class _QrResultFailScreenState extends State<QrResultFailScreen> {
  AudioCache? _audioCache;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isoffline = false;
  SuccessModel? successModel;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(prefix: "assets/audio/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));

    Timer(
      const Duration(milliseconds: 300),
          () {
        _audioCache!.play('Fail.mp3');
        // Navigate to your favorite place
      },
    );
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      // developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      //there is no any connection
      setState(() {
        isoffline = true;
      });
    } else {
      setState(() {
        isoffline = false;
      });
    }
  }

  Future<SuccessModel?> fetchStatus(String codes) async {
    // Fluttertoast.showToast(
    //     msg: codes,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    try {
      Response response;
      response = await get(Uri.parse(
          'https://nxtverify.digitalsummation.com/public/api/verifyCode/435345?api_key=fdskdsfnd78435345dsfngfkehewr5gfk35g&code=$codes'));
      final jsonResponse = json.decode(response.body);
      print('not json $jsonResponse');
      print('Response bodyregi: ${response.body}');
      // listAllBackupModeldata!.clear();

      successModel = new SuccessModel.fromJson(jsonResponse);
      if (successModel!.status == 'success') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrResultSuccessScreen(),
          ),
        );
      } else if (successModel!.status == 'failure') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrResultFailScreen(),
          ),
        );
      }

      return successModel;
    } catch (e) {
      print('caught error $e');
    }
  }

  Future _scanQR() async {
    try {
      String? qrResult = await MajaScan.startScan(
          title: "QRcode scanner",
          titleColor: Colors.white,
          qRCornerColor: Colors.white,
          qRScannerColor: Colors.white);

      if(qrResult!.length>2) {
        fetchStatus(qrResult);
      }
      // if (qrResult == "https://raincreatives.com/") {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => QrResultScreen(),
      //     ),
      //   );
      // } else {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => QrResultFailScreen(),
      //     ),
      //   );
      // }
      // setState(() {
      //   result = qrResult ?? 'null string';
      // });
    } on PlatformException catch (ex) {
      if (ex.code == MajaScan.CameraAccessDenied) {
        // setState(() {
        //   result = "Camera permission was denied";
        // });
      } else {
        // setState(() {
        //   result = "Unknown Error $ex";
        // });
      }
    } on FormatException {
      setState(() {
        // result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        // result = "Unknown Error $ex";
      });
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  sendEmail(String email) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: '$email',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Default subject',
          'body': 'Default body',
        }));

    await launch(emailLaunchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    CheckConnections() {
      if (isoffline) {
        return NoInternetScreen();
      } else {
        return Scaffold(
          backgroundColor: sh_white,
          appBar: AppBar(
            elevation: 0,
            title: Text("INValid!",
              textAlign: TextAlign.center,
              style: TextStyle(color: sh_black,fontFamily: 'Bold',fontSize: 20.sp,letterSpacing: 1.2),),
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
                            sh_fail_scan,
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
                      decoration: boxDecoration6(radius: 30, showShadow: true),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Color(0xff888888),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Text(
                              "Scan Result",
                              style: TextStyle(
                                  color: sh_white,
                                  fontSize: 16.sp,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Medium'),
                            ),
                          ),
                          Container(
                            width: 90.w,
                            child: Text(
                              "The Documents seems to be invalid!\n\nIf you think this is an error please contact issure",
                              style: TextStyle(
                                  color: Color(0xffC4C6C8),
                                  fontSize: 13.sp,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Regular'),
                            ),
                          ),
                          Container(
                            width: 90.w,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Contact\nNumber:",
                                      style: TextStyle(
                                          color: Color(0xff2CBA88),
                                          fontSize: 13.sp,
                                          letterSpacing: 1.0,
                                          fontFamily: 'Regular'),
                                    ),
                                    InkWell(
onTap: (){
  _makePhoneCall("+919998250977");
},
                                      child: Text(
                                        "+91-999 8250977",
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13.sp,
                                            letterSpacing: 1.0,
                                            fontFamily: 'Medium'),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Email:",
                                      style: TextStyle(
                                          color: Color(0xff2CBA88),
                                          fontSize: 13.sp,
                                          letterSpacing: 1.0,
                                          fontFamily: 'Regular'),
                                    ),
                                    InkWell(
                                      onTap: () {
sendEmail("hello@yoursite.xyz");
                                        // launchUrl(emailLaunchUri);
                                      },
                                      child: Text(
                                        "hello@yoursite.xyz",
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13.sp,
                                            letterSpacing: 1.0,
                                            fontFamily: 'Medium'),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _scanQR();
                              // requestCameraPermission();
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              width: 75.w,
                              decoration: boxDecoration(
                                  bgColor: Colors.white,
                                  radius: 10,
                                  showShadow: false),
                              child: Text(
                                "NEW SCAN",
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
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return CheckConnections();
    });
  }
}
