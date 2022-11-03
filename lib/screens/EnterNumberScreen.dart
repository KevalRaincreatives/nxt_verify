import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nxt_verify/screens/NoInternetScreen.dart';
import 'package:nxt_verify/screens/OtpVerifyScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:sizer/sizer.dart';

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({Key? key}) : super(key: key);

  @override
  _EnterNumberScreenState createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isoffline = false;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  String? _status;

  AuthCredential? _phoneAuthCredential;
  String? _verificationId;
  int? _code;
  String? myphone;

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

  Future<String?> getCheck() async {
    try {
      String phoneNumber =  controller.text.toString().trim();
      if (phoneNumber == null || phoneNumber.isEmpty|| phoneNumber.length<5) {
        // toast('Please Enter Mobile Number');
        Fluttertoast.showToast(
            msg: "Please Enter Mobile Number",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }else{
        _submitPhoneNumber();
      }
    } catch (e) {
      print('caught error $e');
    }
  }


  Future<void> _submitPhoneNumber() async {
//    FirebaseCrashlytics.instance.crash();
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    EasyLoading.show(status: 'Sending Code...');
    String phoneNumber = "+"+controller.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
        _status = 'verificationCompleted\n';
      });
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(FirebaseAuthException error) {
      EasyLoading.dismiss();
      // Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      print('verificationFailed');
      Fluttertoast.showToast(
          msg: "verificationFailed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _status = '$error\n';
      });
      print(error);
    }

    void codeSent(String verificationId, [int? code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
//      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      EasyLoading.dismiss();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpVerifyScreen(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
            )),
      );
//      launchScreen(context, OtpScreen.tag);
//      setState(() {
//        _status += 'Code Sent\n';
//      });
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status = 'codeAutoRetrievalTimeout\n';
      });
      print(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: myphone,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above

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
    CheckConnections() {
      if (isoffline) {
        return NoInternetScreen();
      } else {
        return Scaffold(
          backgroundColor: sh_white,
          appBar: AppBar(
            elevation: 0,
            title: Text("Enter Number",
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
                              "Mobile Number",
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
                              "We'll send you a message to confirm your identity.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xffC4C6C8),
                                  fontSize: 13.sp,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Regular'),
                            ),
                          ),
                          Container(
                            width: 80.w,
                            padding: EdgeInsets.fromLTRB(10, 2, 10,2),
                            decoration: boxDecoration(
                                bgColor: Colors.white,
                                radius: 10,
                                showShadow: false),
                            child:  InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                print(number.phoneNumber);
                                myphone=number.phoneNumber;
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },

                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(color: Color(0xff2CBA88),fontSize: 13.sp,fontFamily: 'Medium'),
                              initialValue: number,
                              textFieldController: controller,
                              textStyle: TextStyle(color: Color(0xff2CBA88),fontSize: 14.sp,fontFamily: 'Medium'),
                              formatInput: false,
                              cursorColor: Color(0xff2CBA88),
                              keyboardType:
                              TextInputType.numberWithOptions(signed: true, decimal: true),
                              // inputBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(1.0),
                              //     borderSide: BorderSide(
                              //         color: Colors.grey.withOpacity(0.5), width: 5.5)),
                              onSaved: (PhoneNumber number) {
                                print('On Saved: $number');
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => OtpVerifyScreen(),
                              //   ),
                              // );
                              getCheck();
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              width: 80.w,
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
