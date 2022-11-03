// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class QrCodeScannerScreen extends StatefulWidget {
//   const QrCodeScannerScreen({Key? key}) : super(key: key);
//
//   @override
//   _QrCodeScannerScreenState createState() => _QrCodeScannerScreenState();
// }
//
// class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: MobileScanner(
//           allowDuplicates: false,
//           onDetect: (barcode, args) {
//             if (barcode.rawValue == null) {
//               debugPrint('Failed to scan Barcode');
//             } else {
//               final String code = barcode.rawValue!;
//               debugPrint('Barcode found! $code');
//             }
//           }),
//     );
//   }
// }
