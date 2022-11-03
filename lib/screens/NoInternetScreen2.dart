import 'package:flutter/material.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShImages.dart';
import 'package:nxt_verify/utils/ShString.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var weight=MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: weight,
      color: sh_colorPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Center(
                child: Container(),
              )
          ),
          Expanded(
              flex: 7,
              child: Center(
                child: Container(
                  height: height*.22,
                  width: height*.25,
                  child: Image.asset(noinernet,fit: BoxFit.fill,),
                ),
              )
          ),
          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(str_nointernet,style: TextStyle(color: sh_white,fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(height: 12,),
                    Text(str_long_nointernet,style: TextStyle(color: sh_white,fontSize: 16,fontWeight: FontWeight.normal),),
                    SizedBox(height: 16,),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(14.0,0,0,20),
                height: height,
                width: weight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Try Again",style: TextStyle(color: sh_white,fontSize: 16,fontWeight: FontWeight.normal),),

                  ],
                ),
              ))
        ],
      ),

    );
  }
}
