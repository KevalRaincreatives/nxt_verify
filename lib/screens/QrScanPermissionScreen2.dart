import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:majascan/majascan.dart';
import 'package:nxt_verify/screens/QrResultSuccessScreen.dart';
import 'package:nxt_verify/screens/ScannerScreen.dart';
import 'package:nxt_verify/utils/ImageScannerAnimation.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nxt_verify/model/SuccessModel.dart';
import 'package:nxt_verify/screens/NoInternetScreen.dart';
import 'package:nxt_verify/screens/QRViewExample.dart';
import 'package:nxt_verify/screens/QrCodeScannerScreen.dart';
import 'package:nxt_verify/screens/QrResultFailScreen.dart';
import 'package:nxt_verify/screens/QrResultScreen.dart';

class QrScanPermissionScreen extends StatefulWidget {
  const QrScanPermissionScreen({Key? key}) : super(key: key);

  @override
  _QrScanPermissionScreenState createState() => _QrScanPermissionScreenState();
}

class _QrScanPermissionScreenState extends State<QrScanPermissionScreen> with SingleTickerProviderStateMixin{
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isoffline = false;
  SuccessModel? successModel;

  AnimationController? _animationController;
  bool _animationStopped = false;
  String scanText = "Scan";
  bool scanning = false;

  bool _isVisible = true;
  bool _isVisible_success = false;



  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _animationController = new AnimationController(
        duration: new Duration(seconds: 1), vsync: this);

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _animationController!.dispose();
    super.dispose();
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController!.reverse(from: 1.0);
    } else {
      _animationController!.forward(from: 0.0);
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

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ScannerScreen(),
        //   ),
        // );
      }

      return successModel;
    } catch (e) {
      print('caught error $e');
    }
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

  Future _scanQR() async {
    try {
      String? qrResult = await MajaScan.startScan(
          title: "",
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

  Future<void> requestCameraPermission() async {
    final serviceStatus = await Permission.camera.isGranted;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
      _scanQR();

      animateScanAnimation(false);

      setState(() {
        _isVisible = false;
        _isVisible_success = true;
        _animationStopped = false;
        scanning = true;
        scanText = "Stop";
      });

    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
      Fluttertoast.showToast(
          msg: "Permission denied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
      Fluttertoast.showToast(
          msg: "Permission Permanently Denied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    SuccesVisiblity() {
      if(_isVisible_success){
        return  Visibility(
            visible: _isVisible_success,
            child:  ImageScannerAnimation(
          _animationStopped,
          334,
          animation: _animationController,
        ));
      }else{
        return Container();
      }

    }


    CheckConnections() {
      if (isoffline) {
        return NoInternetScreen();
      } else {
        return Stack(
          children: [
          Visibility(
          visible: _isVisible,
          child: Scaffold(
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
                              sh_scan_permission,
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
                                "Camera Time",
                                style: TextStyle(
                                    color: sh_white,
                                    fontSize: 16.sp,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Medium'),
                              ),
                            ),
                            Container(
                              width: 80.w,
                              child: Text(
                                "Give us access to the camera so we can scan QR-Code and verify your documents",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xffC4C6C8),
                                    fontSize: 15.sp,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Regular'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                requestCameraPermission();

                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                width: 75.w,
                                decoration: boxDecoration(
                                    bgColor: Colors.white,
                                    radius: 10,
                                    showShadow: false),
                                child: Text(
                                  "GIVE CAMERA ACCESS",
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
          ),
        ),
            SuccesVisiblity(),
          ],
        );
      }
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return CheckConnections();
    });
  }
}
