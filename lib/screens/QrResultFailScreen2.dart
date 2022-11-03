import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShImages.dart';


class QrResultFailScreen extends StatefulWidget {
  const QrResultFailScreen({Key? key}) : super(key: key);

  @override
  _QrResultFailScreenState createState() => _QrResultFailScreenState();
}

class _QrResultFailScreenState extends State<QrResultFailScreen> {
  AudioCache? _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(prefix: "assets/audio/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));

    Timer(
      const Duration(milliseconds: 500),
          () {
        _audioCache!.play('Fail.mp3');
        // Navigate to your favorite place
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Fail'),
      ),
      body: Center(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(sh_image_fail,height: 150,width: 150,),
              SizedBox(height: 16,),
              Text("Verification Failed",style: TextStyle(color: sh_my_red,fontSize: 30,fontWeight: FontWeight.bold),),


            ],
          ),
        ),
      ),
    );
  }
}
