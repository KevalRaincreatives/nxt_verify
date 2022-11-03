import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majascan/majascan.dart';
import 'package:nxt_verify/screens/QrResultFailScreen.dart';
import 'package:nxt_verify/screens/QrResultScreen.dart';

class NewQR extends StatefulWidget {
  const NewQR({Key? key}) : super(key: key);

  @override
  _NewQRState createState() => _NewQRState();
}

class _NewQRState extends State<NewQR> {
  String result = "Hey there !";


  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  Future _scanQR() async {
    try {
      String? qrResult = await MajaScan.startScan(
          title: "QRcode scanner",
          titleColor: Colors.white,
          qRCornerColor: Colors.white,
          qRScannerColor: Colors.white);
      if (qrResult == "https://raincreatives.com/") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrResultScreen(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrResultFailScreen(),
          ),
        );
      }
      // setState(() {
      //   result = qrResult ?? 'null string';
      // });
    } on PlatformException catch (ex) {
      if (ex.code == MajaScan.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
