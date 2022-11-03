import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nxt_verify/screens/DashboardScreen.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static String tag='/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int mysec=3;

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        mysec--;

      });

      if(mysec==0){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: Container(
              height: 100.h,
              width: 100.w,
              child: Stack(
                children: [
                  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("STRAP IT",style: TextStyle(color: sh_black,fontFamily: "ExtraBold",fontSize: 36),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 6),
                        child: Container(
                            margin: EdgeInsets.fromLTRB(50, 50, 50, 10),
                            child: Image.asset(sh_app_logo,height: 110,width: 110,)),
                      ),
                      Text("nxt", style: TextStyle(color: sh_app_black,
                          fontSize: 20.sp,
                          fontFamily: "Medium"),),
                      SizedBox(height: 4,),
                      Text("VERIFY", style: TextStyle(color: sh_app_black,
                          fontSize: 20.sp,
                          fontFamily: "Medium"),),
                      SizedBox(height: 4,),
                      Text("blockchain\nverification", style: TextStyle(
                          color: sh_app_black,
                          fontSize: 16.sp,
                          fontFamily: "Regular"),)

                    ],
                  ),
                ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(sh_loader, height: 17.h, width: 100.w,fit: BoxFit.fill,),
                      )
                    // Image.network("https://raincreatives.com/wp-content/uploads/2021/03/rc_logo_web_header.png")
                  )

                ],
              ),

            ),
          );
        }
    );
  }
}
