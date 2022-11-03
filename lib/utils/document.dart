/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nxt_verify/utils/PdfPagesExtenstion.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShConstant.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generateDocument(PdfPageFormat format, AddData data) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);
  final pdf = pw.Document();

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString('assets/document.svg');
  final swirls = await rootBundle.loadString('assets/swirls2.svg');
  const PdfColor appblue = PdfColor.fromInt(0xff044FA1);
  const PdfColor appwhite = PdfColor.fromInt(0xffFFFFFF);
  const PdfColor appblack = PdfColor.fromInt(0xff000000);
  const PdfColor apptextblack = PdfColor.fromInt(0xff333333);
  const PdfColor appsemiblack = PdfColor.fromInt(0xffA5A5A5);
  var title = data.title;
  var desc = data.descp;
  final bottomImage = pw.MemoryImage(
    (await rootBundle.load('assets/bottom_part.png')).buffer.asUint8List(),
  );

  final favImage = pw.MemoryImage(
    (await rootBundle.load('assets/like.png')).buffer.asUint8List(),
  );

  final page2Image = pw.MemoryImage(
    (await rootBundle.load('assets/page2.png')).buffer.asUint8List(),
  );

  final page22Image = pw.MemoryImage(
    (await rootBundle.load('assets/page22.png')).buffer.asUint8List(),
  );

  final colonImage = pw.MemoryImage(
    (await rootBundle.load('assets/colon.png')).buffer.asUint8List(),
  );

  final page3Image = pw.MemoryImage(
    (await rootBundle.load('assets/page3.png')).buffer.asUint8List(),
  );

  final dotImage = pw.MemoryImage(
    (await rootBundle.load('assets/dot.png')).buffer.asUint8List(),
  );

  final im1Image = pw.MemoryImage(
    (await rootBundle.load('assets/im1.png')).buffer.asUint8List(),
  );

  final im2Image = pw.MemoryImage(
    (await rootBundle.load('assets/im2.png')).buffer.asUint8List(),
  );

  final im3Image = pw.MemoryImage(
    (await rootBundle.load('assets/im3.png')).buffer.asUint8List(),
  );

  final im4Image = pw.MemoryImage(
    (await rootBundle.load('assets/im4.png')).buffer.asUint8List(),
  );

  final im5Image = pw.MemoryImage(
    (await rootBundle.load('assets/im5.png')).buffer.asUint8List(),
  );
  final im6Image = pw.MemoryImage(
    (await rootBundle.load('assets/im6.png')).buffer.asUint8List(),
  );
  final im7Image = pw.MemoryImage(
    (await rootBundle.load('assets/im7.png')).buffer.asUint8List(),
  );
  final im8Image = pw.MemoryImage(
    (await rootBundle.load('assets/im8.png')).buffer.asUint8List(),
  );
  final im9Image = pw.MemoryImage(
    (await rootBundle.load('assets/im9.png')).buffer.asUint8List(),
  );

  final dotborderImage = pw.MemoryImage(
    (await rootBundle.load('assets/dotborder.png')).buffer.asUint8List(),
  );

  final mywork1Image = pw.MemoryImage(
    (await rootBundle.load('assets/mywork1.png')).buffer.asUint8List(),
  );

  final mywork2Image = pw.MemoryImage(
    (await rootBundle.load('assets/mywork2.png')).buffer.asUint8List(),
  );

  final mywork3Image = pw.MemoryImage(
    (await rootBundle.load('assets/mywork3.png')).buffer.asUint8List(),
  );

  final mywork4Image = pw.MemoryImage(
    (await rootBundle.load('assets/mywork4.png')).buffer.asUint8List(),
  );

  final mob1Image = pw.MemoryImage(
    (await rootBundle.load('assets/mob1.png')).buffer.asUint8List(),
  );

  final mob2Image = pw.MemoryImage(
    (await rootBundle.load('assets/mob2.png')).buffer.asUint8List(),
  );

  final mob3Image = pw.MemoryImage(
    (await rootBundle.load('assets/mob3.png')).buffer.asUint8List(),
  );

  final mob4Image = pw.MemoryImage(
    (await rootBundle.load('assets/mob4.png')).buffer.asUint8List(),
  );

  final mob5Image = pw.MemoryImage(
    (await rootBundle.load('assets/mob5.png')).buffer.asUint8List(),
  );

  final mob6Image = pw.MemoryImage(
    (await rootBundle.load('assets/mob6.png')).buffer.asUint8List(),
  );

  final offer1Image = pw.MemoryImage(
    (await rootBundle.load('assets/offer1.png')).buffer.asUint8List(),
  );
  final offer2Image = pw.MemoryImage(
    (await rootBundle.load('assets/offer2.png')).buffer.asUint8List(),
  );
  final offer3Image = pw.MemoryImage(
    (await rootBundle.load('assets/offer3.png')).buffer.asUint8List(),
  );
  final offer4Image = pw.MemoryImage(
    (await rootBundle.load('assets/offer4.png')).buffer.asUint8List(),
  );
  final offer5Image = pw.MemoryImage(
    (await rootBundle.load('assets/offer5.png')).buffer.asUint8List(),
  );

  final rainlogoImage = pw.MemoryImage(
    (await rootBundle.load('assets/rainlogo.png')).buffer.asUint8List(),
  );

  doc.addPage(
      pageDoc1(format, font1,font2,favImage,bottomImage)
  );

  doc.addPage(
    pageDoc2(format, font1, font2,page2Image,page22Image,colonImage)
    );

  doc.addPage(
      pageDoc3(format, font1, font2,page3Image,offer1Image,offer2Image,offer3Image,offer4Image,offer5Image)
  );

  doc.addPage(
      pageDoc4(format, font1, font2)
  );

  doc.addPage(
      pageDoc5(format, font1, font2,dotImage)
  );

  doc.addPage(
      pageDoc6(format, font1, font2,im1Image,im2Image,im3Image,im4Image,im5Image,im6Image,
      im7Image,im8Image,im9Image,dotborderImage)
  );
  doc.addPage(
      pageDoc7(format, font1, font2,mywork1Image)
  );

  doc.addPage(
      pageDoc8(format, font1, font2,mywork2Image)
  );

  doc.addPage(
      pageDoc9(format, font1, font2,mywork3Image)
  );

  doc.addPage(
      pageDoc10(format, font1, font2,mywork4Image)
  );

  doc.addPage(
      pageDoc11(format, font1, font2,mob1Image,mob2Image,mob3Image)
  );

  doc.addPage(
      pageDoc12(format, font1, font2,mob4Image,mob5Image,mob6Image)
  );

  // pw.Expanded(
  //     flex: 2,
  //     child: pw.Stack(children: [
  //       pw.Positioned(
  //           bottom: 0,
  //           right: 0,
  //           left: 0,
  //           child: pw.Padding(
  //               padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
  //               child: pw.Column(
  //                   mainAxisAlignment:
  //                   pw.MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     pw.Container(height: 1, color: appsemiblack),
  //                     pw.SizedBox(height: 10),
  //                     pw.Row(
  //                         mainAxisAlignment:
  //                         pw.MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           RichTextBold('Business Profile',
  //                               textColor: appblack,
  //                               fontSize: textSizeSmall,
  //                               fontFamily: fontBold),
  //                           RichTextNormal(
  //                               'hello@raincreatives.com | +91 9998250977',
  //                               textColor: appblack,
  //                               fontSize: textSizeSmall10,
  //                               fontFamily: fontBold),
  //                         ])
  //                   ]))
  //       )
  //     ]))
  return await doc.save();
}
