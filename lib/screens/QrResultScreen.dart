import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShImages.dart';


class QrResultScreen extends StatefulWidget {
  const QrResultScreen({Key? key}) : super(key: key);

  @override
  _QrResultScreenState createState() => _QrResultScreenState();
}

class _QrResultScreenState extends State<QrResultScreen> {
  AudioCache? _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(prefix: "assets/audio/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));

    Timer(
    const Duration(milliseconds: 500),
    () {
      _audioCache!.play('successtone.mp3');
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
        title: const Text('Success'),
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
              Image.asset(sh_image_sucess,height: 150,width: 150,),
              SizedBox(height: 16,),
              Text("Verified",style: TextStyle(color: sh_my_green,fontSize: 40,fontWeight: FontWeight.bold),),


            ],
          ),
        ),
      ),
    );
  }
}
