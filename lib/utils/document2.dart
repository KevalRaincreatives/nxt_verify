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
import 'package:nxt_verify/utils/data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


Future<Uint8List> generateDocument2(
    PdfPageFormat format, AddData data,pw.Document doc) async {

  final pdf = pw.Document();

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString('assets/document.svg');
  final swirls = await rootBundle.loadString('assets/swirls2.svg');
  const PdfColor appblue = PdfColor.fromInt(0xff044FA1);
  const PdfColor appwhite = PdfColor.fromInt(0xffFFFFFF);
  const PdfColor appblack = PdfColor.fromInt(0xff000000);
  var title=data.title;
  var desc=data.descp;
  final bottomImage = pw.MemoryImage(
    (await rootBundle.load('assets/bottom_part.png')).buffer.asUint8List(),
  );

  final favImage = pw.MemoryImage(
    (await rootBundle.load('assets/like.png')).buffer.asUint8List(),
  );

// if(data.isAdded) {
  doc.addPage(pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      build: (pw.Context context) =>
      <pw.Widget>[
        pw.Header(level: 0, text: 'Title'),
        pw.Paragraph(
            text: title),
        pw.Header(level: 1, text: 'Description'),
        pw.Paragraph(
            text: desc),
      ]));
// }

  return await doc.save();
}
