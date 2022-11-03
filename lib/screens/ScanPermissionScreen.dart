import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:majascan/majascan.dart';
import 'package:nxt_verify/model/SuccessModel.dart';
import 'package:nxt_verify/screens/NewQR.dart';
import 'package:nxt_verify/screens/NoInternetScreen.dart';
import 'package:nxt_verify/screens/QRViewExample.dart';
import 'package:nxt_verify/screens/QrCodeScannerScreen.dart';
import 'package:nxt_verify/screens/QrResultFailScreen.dart';
import 'package:nxt_verify/screens/QrResultScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:nxt_verify/utils/ShString.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanPermissionScreen extends StatefulWidget {
  const ScanPermissionScreen({Key? key}) : super(key: key);

  @override
  _ScanPermissionScreenState createState() => _ScanPermissionScreenState();
}

class _ScanPermissionScreenState extends State<ScanPermissionScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isoffline = false;
  SuccessModel? successModel;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<SuccessModel?> fetchStatus(String codes) async {
    try {


      Response response;
      response = await get(Uri.parse(
          'https://nxtverify.digitalsummation.com/public/api/verifyCode/435345?api_key=fdskdsfnd78435345dsfngfkehewr5gfk35g&code=$codes'));
      final jsonResponse = json.decode(response.body);
      print('not json $jsonResponse');
      print('Response bodyregi: ${response.body}');
      // listAllBackupModeldata!.clear();

      successModel = new SuccessModel.fromJson(jsonResponse);
      if(successModel!.status=='success'){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrResultScreen(),
          ),
        );
      }else if(successModel!.status=='failure'){
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

  // Platform messages are asynchronous, so we initialize in an async method.
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
    if(result == ConnectivityResult.none){
      //there is no any connection
      setState(() {
        isoffline = true;
      });
    }else{
      setState(() {
        isoffline = false;
      });
    }

  }

  Future _scanQR() async {
    try {
      String? qrResult = await MajaScan.startScan(
          title: "QRcode scanner",
          titleColor: Colors.white,
          qRCornerColor: Colors.white,
          qRScannerColor: Colors.white);

      fetchStatus(qrResult!);
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

    final serviceStatus = await Permission.camera.isGranted ;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
      _scanQR();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => NewQR(),
      //   ),
      // );
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
      Fluttertoast.showToast(
          msg: "Permission denied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
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
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


     CheckConnections(){
       if(isoffline){
         return NoInternetScreen();
       }else{
            return   Container(
        height: height,
        width: width,
        color: sh_colorPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 7,
                child: Center(
                  child: Container(
                    height: height*.30,
                    width: height*.30,
                    child: Image.asset(scanqr,fit: BoxFit.fill,),
                  ),
                )
            ),
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Camera Time",style: TextStyle(color: sh_white,fontSize: 30,fontWeight: FontWeight.bold),),
                      SizedBox(height: 12,),
                      Text(str_camera,style: TextStyle(color: sh_white,fontSize: 16,fontWeight: FontWeight.normal),),
                      SizedBox(height: 16,),
                      InkWell(
                        onTap: () async {
// MyCheck();
                          requestCameraPermission();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              top: 12, bottom: 14),
                          decoration: boxDecoration(
                              bgColor: sh_white, radius: 20, showShadow: false),
                          child: Center(child: Text(str_camera_access,style: TextStyle(color: sh_app_txt_color,fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(14.0,0,0,20),
                  height: height,
                  width: width,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrResultFailScreen(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Not now",style: TextStyle(color: sh_white,fontSize: 16,fontWeight: FontWeight.normal),),

                      ],
                    ),
                  ),
                ))
          ],
        ),

      );
       }
     }


    return Scaffold(
      body: CheckConnections()
//       Container(
//         height: height,
//         width: weight,
//         color: sh_colorPrimary,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//                 flex: 7,
//                 child: Center(
//                   child: Container(
//                     height: height*.30,
//                     width: height*.30,
//                     child: Image.asset(scanqr,fit: BoxFit.fill,),
//                   ),
//                 )
//             ),
//             Expanded(
//                 flex: 3,
//                 child: Container(
//                   padding: EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Camera Time",style: TextStyle(color: sh_white,fontSize: 30,fontWeight: FontWeight.bold),),
//                       SizedBox(height: 12,),
//                       Text(str_camera,style: TextStyle(color: sh_white,fontSize: 16,fontWeight: FontWeight.normal),),
//                       SizedBox(height: 16,),
//                       InkWell(
//                         onTap: () async {
// // MyCheck();
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           padding: EdgeInsets.only(
//                               top: 12, bottom: 14),
//                           decoration: boxDecoration(
//                               bgColor: sh_white, radius: 20, showShadow: false),
//                           child: Center(child: Text(str_camera_access,style: TextStyle(color: sh_app_txt_color,fontSize: 16,fontWeight: FontWeight.bold),)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(14.0,0,0,20),
//                   height: height,
//                   width: weight,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text("Not now",style: TextStyle(color: sh_white,fontSize: 16,fontWeight: FontWeight.normal),),
//
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//
//       ),

    );
  }
}
