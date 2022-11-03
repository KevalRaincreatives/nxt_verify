import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nxt_verify/screens/NoInternetScreen.dart';
import 'package:nxt_verify/screens/QrScanPermissionScreen.dart';

import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String? verificationId,phoneNumber;

  OtpVerifyScreen({this.verificationId,this.phoneNumber});



  @override
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isoffline = false;
  String? _status;
  bool hasError = false;
  AuthCredential? _phoneAuthCredential;
  String pintext = "";

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
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }


  Future<void> _login() async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    ///
    EasyLoading.show(status: 'Verifying...');
    // String pin=ot1Controller.text.toString()+ot2Controller.text.toString()+ot3Controller.text.toString()+ot4Controller.text.toString()
    //     +ot5Controller.text.toString()+ot6Controller.text.toString();
    try {

      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: widget.verificationId!, smsCode: pintext);
      FirebaseAuth auth = FirebaseAuth.instance;
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(phoneAuthCredential);
      EasyLoading.dismiss();
      // getUpdate();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QrScanPermissionScreen(),
        ),
      );
      setState(
            () {
          hasError = false;
          snackBar("OTP Verified!!");
        },
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => SignUpScreen(
      //           country_code: widget.country_code,
      //           fnlNumber: widget.fnlNumber
      //       )),
      // );
    } catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // toast(e.toString());
      setState(() {
        _status = e.toString() + '\n';
      });
      print(e.toString());
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


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color(0xff2CBA88), fontWeight: FontWeight.w600,fontFamily: 'Bold'),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(30),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      // border: Border.all(color: Color(0xff2CBA88)),
      // borderRadius: BorderRadius.circular(8),
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    CheckConnections() {
      if (isoffline) {
        return NoInternetScreen();
      } else {
        return Scaffold(
          backgroundColor: sh_white,
          appBar: AppBar(
            elevation: 0,
            title: Text("OTP Verification",
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
                        height: 40.h,
                        child: Center(
                          child: Image.asset(
                            sh_otp_veri,
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
                              "We sent a code",
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
                              "Enter 6 digit number that sent to your mobile number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xffC4C6C8),
                                  fontSize: 13.sp,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Regular'),
                            ),
                          ),
                          Container(
                            width: 90.w,
                            child: Pinput(
                              length: 6,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              submittedPinTheme: submittedPinTheme,
                              // validator: (s) {
                              //   return s == '2222' ? null : 'Pin is incorrect';
                              // },
                              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) {
                                pintext=pin;
                                print(pin);

                              }
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _login();

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
                                "CONTINUE",
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
