import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nxt_verify/utils/ShColors.dart';
import 'package:nxt_verify/utils/ShConstant.dart';
import 'package:nxt_verify/utils/ShExtension.dart';
import 'package:nxt_verify/utils/data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const PdfColor appblue = PdfColor.fromInt(0xff044FA1);
const PdfColor appwhite = PdfColor.fromInt(0xffFFFFFF);
const PdfColor appblack = PdfColor.fromInt(0xff000000);
const PdfColor apptextblack = PdfColor.fromInt(0xff212121);
const PdfColor appsemiblack = PdfColor.fromInt(0xffA5A5A5);
const PdfColor apppageback = PdfColor.fromInt(0xffE6E6E6);
const PdfColor applighblack = PdfColor.fromInt(0xffcccccc);
const PdfColor appblack1 = PdfColor.fromInt(0xff757575);

pw.Page pageDoc1(PdfPageFormat format, final font1, final font2, final favImage,
    final bottomImage) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Expanded(
                flex: 5,
                child: pw.Container(
                  padding: const pw.EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: const pw.BoxDecoration(
                    color: appblack,
                  ),
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(children: [
                        pw.Image(favImage, height: 24, width: 24),
                        pw.SizedBox(width: 8),
                        pw.RichText(
                            text: pw.TextSpan(children: [
                          pw.TextSpan(
                            text: 'tech from india',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                                color: appwhite),
                          ),
                        ])),
                      ]),

                      // pw.Spacer(),
                      pw.RichText(
                          text: pw.TextSpan(children: [
                        pw.TextSpan(
                          text: 'business\nprofile',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 80,
                              color: appwhite),
                        ),
                      ])),
                    ],
                  ),
                )),
            pw.Expanded(
                flex: 5,
                child: pw.Stack(children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Expanded(flex: 2, child: pw.Container()),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Column(children: [
                              pw.RichText(
                                  textAlign: pw.TextAlign.center,
                                  text: pw.TextSpan(children: [
                                    pw.TextSpan(
                                      text:
                                          'Technology Specialist for\nGrowth Oriented Enterprises',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 30,
                                          color: appblack),
                                    ),
                                  ])),
                              pw.RichText(
                                  textAlign: pw.TextAlign.center,
                                  text: pw.TextSpan(children: [
                                    pw.TextSpan(
                                      text: '2nd August 2022 | BWQ202238101',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 20,
                                          color: appblack),
                                    ),
                                  ]))
                            ]))
                      ]),
                  pw.Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: pw.Padding(
                        padding: pw.EdgeInsets.all(1.0),
                        child: pw.Image(bottomImage),
                      )
                      // Image.network("https://raincreatives.com/wp-content/uploads/2021/03/rc_logo_web_header.png")
                      )
                ]))
          ]);
    },
  );
}

pw.Page pageDoc2(PdfPageFormat format, final font1, final font2,
    final page2Image,final page22Image, final colonImage) {
  return pw.Page(
      pageTheme: pw.PageTheme(
        pageFormat: format.copyWith(
          marginBottom: 0,
          marginLeft: 0,
          marginRight: 0,
          marginTop: 0,
        ),
        orientation: pw.PageOrientation.portrait,
        theme: pw.ThemeData.withFont(
          base: font1,
          bold: font2,
        ),
      ),
      build: (context) {
        return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Expanded(
                  flex: 5,
                  child: pw.Stack(children: [
                    pw.Image(page22Image, fit: pw.BoxFit.fill),
                  ])),
              pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                    color: appblack,
        padding: pw.EdgeInsets.fromLTRB(30,0,0,0),
        alignment: pw.Alignment(-1.0, -1.0),
                    child: RichTextBold('table of content',
                        textColor: appwhite,
                        fontSize: textSizeXLarge38,
                        fontFamily: fontBold),
                  )),
              pw.Expanded(
                  flex: 4,
                  child: pw.Container(
                      padding: pw.EdgeInsets.all(16),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Image(colonImage, height: 20, width: 20),
                                  pw.SizedBox(width: 4),
                                  RichTextNormal('About Rain Creatives',
                                      textColor: appblack,
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontBold)
                                ]),
                            pw.SizedBox(height: 8),
                            pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Image(colonImage, height: 20, width: 20),
                                  pw.SizedBox(width: 4),
                                  RichTextNormal('Our Clients',
                                      textColor: appblack,
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontBold)
                                ]),
                            pw.SizedBox(height: 8),
                            pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Image(colonImage, height: 20, width: 20),
                                  pw.SizedBox(width: 4),
                                  RichTextNormal('Our Works',
                                      textColor: appblack,
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontBold)
                                ]),
                            pw.SizedBox(height: 8),
                            pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Image(colonImage, height: 20, width: 20),
                                  pw.SizedBox(width: 4),
                                  RichTextNormal('Project Specification',
                                      textColor: appblack,
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontBold)
                                ]),
                            pw.SizedBox(height: 8),
                            pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Image(colonImage, height: 20, width: 20),
                                  pw.SizedBox(width: 4),
                                  RichTextNormal('Time-line of Project',
                                      textColor: appblack,
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontBold)
                                ]),
                            pw.SizedBox(height: 8),
                            pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Image(colonImage, height: 20, width: 20),
                                  pw.SizedBox(width: 4),
                                  RichTextNormal('Project Acceptance',
                                      textColor: appblack,
                                      fontSize: textSizeSMedium,
                                      fontFamily: fontBold)
                                ])
                          ]))),
              pw.Expanded(
                  flex: 2,
                  child: pw.Stack(children: [
                    pw.Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: pw.Padding(
                            padding: pw.EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Container(height: 1, color: appsemiblack),
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichTextBold('Business Profile',
                                            textColor: appblack,
                                            fontSize: textSizeSmall,
                                            fontFamily: fontBold),
                                        RichTextNormal(
                                            'hello@raincreatives.com | +91 9998250977',
                                            textColor: appblack,
                                            fontSize: textSizeSmall10,
                                            fontFamily: fontBold),
                                      ])
                                ]))

                        // Image.network("https://raincreatives.com/wp-content/uploads/2021/03/rc_logo_web_header.png")
                        )
                  ]))
            ]);
      });
}

pw.Page pageDoc3(
    PdfPageFormat format,
    final font1,
    final font2,
    final page3Image,
    final offer1Image,
    final offer2Image,
    final offer3Image,
    final offer4Image,
    final offer5Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Container(
          padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: pw.Column(children: [
            pw.Expanded(
                flex: 9,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    RichTextBoldUnderline('about raincreatives:',
                        textColor: appblack,
                        fontSize: textSizeXNormal,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 20),
                    RichTextNormal(
                        'With over 12+ years of experience in digital business, we provide with most efficient solutions, to any of the business problems.',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 10),
                    RichTextBold('We Offer',
                        textColor: appblack1,
                        fontSize: textSizeLargeMedium,
                        fontFamily: fontBold),

                    pw.Row(
                      children: [
                        pw.Expanded(flex: 2,
                        child: pw.Container(
                            color: appwhite,
                            child: pw.Center(
                              child: pw.Column(children: [
                                pw.Container(
                                  padding: pw.EdgeInsets.fromLTRB(20,20,20,10),
                                  child: pw.Image(offer1Image),
                                ),
                                pw.SizedBox(height: 4),
                                RichTextBoldCenter('Web/App\nDevelopment',
                                    textColor: appblack1,
                                    fontSize: textSizeSMedium2,
                                    fontFamily: fontBold),
                              ]),
                            )),),
                        pw.SizedBox(width: 8),
                        pw.Expanded(flex: 2,
                        child: pw.Container(
                            color: appwhite,
                            child: pw.Center(
                              child: pw.Column(children: [
                                pw.Container(
                                  padding: pw.EdgeInsets.fromLTRB(20,20,20,10),
                                  child: pw.Image(offer2Image),
                                ),
                                pw.SizedBox(height: 4),
                                RichTextBoldCenter('E-commerce\nM-commerce',
                                    textColor: appblack1,
                                    fontSize: textSizeSMedium2,
                                    fontFamily: fontBold),
                              ]),
                            )),),
                        pw.SizedBox(width: 8),
                        pw.Expanded(flex: 2,
                        child: pw.Container(
                            color: appwhite,
                            child: pw.Center(
                              child: pw.Column(children: [
                                pw.Container(
                                  padding: pw.EdgeInsets.fromLTRB(20,20,20,10),
                                  child: pw.Image(offer3Image),
                                ),
                                pw.SizedBox(height: 4),
                                RichTextBoldCenter('Dashboards\nKPIs',
                                    textColor: appblack1,
                                    fontSize: textSizeSMedium2,
                                    fontFamily: fontBold),
                              ]),
                            )),),
                        pw.SizedBox(width: 8),
                        pw.Expanded(flex: 2,
                        child: pw.Container(
                            color: appwhite,
                            child: pw.Center(
                              child: pw.Column(children: [
                                pw.Container(
                                  padding: pw.EdgeInsets.fromLTRB(20,20,20,10),
                                  child: pw.Image(offer4Image),
                                ),
                                pw.SizedBox(height: 4),
                                RichTextBoldCenter('Predictive\nAnalytics',
                                    textColor: appblack1,
                                    fontSize: textSizeSMedium2,
                                    fontFamily: fontBold),
                              ]),
                            )),),
                        pw.SizedBox(width: 8),
                        pw.Expanded(flex: 2,
                        child: pw.Container(
                            color: appwhite,
                            child: pw.Center(
                              child: pw.Column(children: [
                                pw.Container(
                                  padding: pw.EdgeInsets.fromLTRB(20,20,20,10),
                                  child: pw.Image(offer5Image),
                                ),
                                pw.SizedBox(height: 4),
                                RichTextBoldCenter('Digital\nCreatives',
                                    textColor: appblack1,
                                    fontSize: textSizeSMedium2,
                                    fontFamily: fontBold),
                              ]),
                            )),)



                      ]
                    ),
                    pw.SizedBox(height: 20),
                    // pw.Image(page3Image, fit: pw.BoxFit.fitWidth),
                    RichTextNormal(
                        'Rain Creatives is a well established company, specialized in providing efficient custom applications for enterprise level cloud, web and mobility solutions. Our in-house team comprises hand picked professionals, who are passionate, enthusiastic and well determined towards delivering unmatched services with an average of 7+ years of industry experience. They are highly qualified and have excellence in different areas such as System Analysis, Database Administration, Designing, Application Development, Mobility Solutions, Security Implementation, Project Management, Quality Assurance, User Training and Support.',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 10),
                    RichTextNormal(
                        'Rain Creatives has been purely indulged in providing customized, secure and scalable solutions. We are specialized in database driven development with custom business logic and advanced security implementation process in the base of our development methodology. We have carried out many large scale application developments with inventory management system capabilities, complex database schema involved, different user access levels and advanced security implemented. Almost all the projects that we build and deploy are easily accessible and properly viewed through multiple devices such as desktop computers, mobile devices, tablets, etc.',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 10),
                    RichTextNormal(
                        'Our client-centric approach, effective collaboration & Quality Delivered on Time haveallowed us to achieve a high client retention ratio. Our after-sales support & maintenanceplans backs-up our client’s faith in us.',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                  ],
                )),
            pw.Expanded(
                flex: 2,
                child: pw.Stack(children: [
                  pw.Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: pw.Padding(
                          padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                          child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Container(height: 1, color: appsemiblack),
                                pw.SizedBox(height: 10),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichTextBold('Business Profile',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      RichTextNormal(
                                          'hello@raincreatives.com | +91 9998250977',
                                          textColor: appblack,
                                          fontSize: textSizeSmall10,
                                          fontFamily: fontBold),
                                    ])
                              ])))
                ]))
          ]));
    },
  );
}

pw.Page pageDoc4(PdfPageFormat format, final font1, final font2) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Container(
          padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: pw.Column(children: [
            pw.Expanded(
                flex: 15,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    RichTextBoldUnderline('company qualifications :',
                        textColor: appblack,
                        fontSize: textSizeXNormal,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 20),
                    RichTextNormal(
                        'The below information table has been prepared to give you glimpse of our experience withenterprise application development and other areas related to the development of the yourapplication:',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 10),
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextBold('Criteria',
                                  textColor: appblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            )),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextBold(
                                  'Our Qualification/Experience',
                                  textColor: appblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            ))
                      ]),
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'Knowledge and experience of dynamic application development by making use of innovative technologies.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            )),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'From year 2010, we strictly adopted method of delivering database driven and dynamic application solutions and thus far, we have been providing these services while adopting new platform and technologies from time to time, keeping up with latest technologies which deliver the best outcome for our customers.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            ))
                      ]),
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'Experience in Inventory & Vehicle Management.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            )),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'We have developed similar application for many of our clients who are market leaders. We have developed these systems based on our client’s requirement & to their satisfaction and that is the reason that we still have maintenance contract with them.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            ))
                      ]),
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'Qualified team for the project. ',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            )),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'We have been developing business application since our inception and so, our team is well-versed with handling system design and development complexity. Our experienced project manager, tech lead & developer have a minimum of 7+ years of experience in application development.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            ))
                      ]),
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'Excellent communication skills and the capacity to be responsive to changing needs and requirements as discovered during the initial Analysis &amp; Discovery phase.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            )),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(6),
                              child: RichTextNormal(
                                  'Clear and timely communication is one of our most effictive tool in project execution. We proactively communicate our updates/progress with our client as per the project plan/schedule. We understand that in this evolving and very challenging world, iterations are sometimes very obvious to accommodate to meet the primary goals set for any web based system and through our years of experience, we have learned the flexibility in adopting the changing needs throughout the project, ensuring that we don’t overrun the stipulated time as well as budget for the project.',
                                  textColor: apptextblack,
                                  fontSize: textSizeSmall,
                                  fontFamily: fontBold),
                            ))
                      ]),
                    ])
                  ],
                )),
            pw.Expanded(
                flex: 1,
                child: pw.Stack(children: [
                  pw.Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: pw.Padding(
                          padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                          child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Container(height: 1, color: appsemiblack),
                                pw.SizedBox(height: 10),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichTextBold('Business Profile',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      RichTextNormal(
                                          'hello@raincreatives.com | +91 9998250977',
                                          textColor: appblack,
                                          fontSize: textSizeSmall10,
                                          fontFamily: fontBold),
                                    ])
                              ])))
                ]))
          ]));
    },
  );
}

pw.Page pageDoc5(
    PdfPageFormat format, final font1, final font2, final dotImage) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Container(
          padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: pw.Column(children: [
            pw.Expanded(
                flex: 9,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    RichTextBoldUnderline('our engagement process:',
                        textColor: appblack,
                        fontSize: textSizeXNormal,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 20),
                    RichTextNormal(
                        'During our 12+years of experience and executing various large projects, we understand that each project is unique in its business requirements with its special needs. So, in order to guide the development process we follow the following process for each our clients.',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 30),
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 3,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                color: appblack,
                                child: pw.Column(children: [
                                  RichTextBold('01',
                                      textColor: appwhite,
                                      fontSize: textSizeXLarge32,
                                      fontFamily: fontBold),
                                  pw.SizedBox(height: 2),
                                  RichTextBold('CONSULT',
                                      textColor: appwhite,
                                      fontSize: textSizeXNormal,
                                      fontFamily: fontBold),
                                ]))),
                        pw.Expanded(
                            flex: 7,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(30, 6, 6, 6),
                                child: pw.Container(
                                    child: pw.Column(
                                        mainAxisSize: pw.MainAxisSize.min,
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.center,
                                        children: [
                                      pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(dotImage,
                                                height: 4, width: 4),
                                            pw.SizedBox(width: 8),
                                            RichTextNormal(
                                                'Understand Client Requirements',
                                                textColor: apptextblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                          ]),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(dotImage,
                                                height: 4, width: 4),
                                            pw.SizedBox(width: 8),
                                            RichTextNormal('Research',
                                                textColor: apptextblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                          ]),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.center,
                                          children: [
                                            pw.Image(dotImage,
                                                height: 4, width: 4),
                                            pw.SizedBox(width: 8),
                                            RichTextNormal(
                                                'Proposal Submission',
                                                textColor: apptextblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                          ])
                                    ]))))
                      ]),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 3,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                color: appblack,
                                child: pw.Column(children: [
                                  RichTextBold('02',
                                      textColor: appwhite,
                                      fontSize: textSizeXLarge32,
                                      fontFamily: fontBold),
                                  pw.SizedBox(height: 2),
                                  RichTextBold('DESIGN',
                                      textColor: appwhite,
                                      fontSize: textSizeXNormal,
                                      fontFamily: fontBold),
                                ]))),
                        pw.Expanded(
                            flex: 7,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(30, 6, 30, 6),
                                child: pw.Column(
                                    mainAxisSize: pw.MainAxisSize.min,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.SizedBox(height: 12),
                                      pw.Container(
                                        child: pw.Table(children: [
                                          pw.TableRow(children: [
                                            pw.Expanded(
                                                child: pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Image(dotImage,
                                                          height: 4, width: 4),
                                                      pw.SizedBox(width: 8),
                                                      RichTextNormal(
                                                          'Wire-framing',
                                                          textColor:
                                                              apptextblack,
                                                          fontSize:
                                                              textSizeSmall,
                                                          fontFamily: fontBold),
                                                    ]),
                                                flex: 5),
                                            pw.Expanded(
                                              flex: 5,
                                              child: pw.Row(
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Image(dotImage,
                                                        height: 4, width: 4),
                                                    pw.SizedBox(width: 8),
                                                    RichTextNormal(
                                                        'Content Creation',
                                                        textColor: apptextblack,
                                                        fontSize: textSizeSmall,
                                                        fontFamily: fontBold),
                                                  ]),
                                            )
                                          ])
                                        ]),
                                      ),
                                      pw.SizedBox(height: 10),
                                      pw.Container(
                                        child: pw.Table(children: [
                                          pw.TableRow(children: [
                                            pw.Expanded(
                                                child: pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Image(dotImage,
                                                          height: 4, width: 4),
                                                      pw.SizedBox(width: 8),
                                                      RichTextNormal(
                                                          'Design Concepts',
                                                          textColor:
                                                              apptextblack,
                                                          fontSize:
                                                              textSizeSmall,
                                                          fontFamily: fontBold),
                                                    ]),
                                                flex: 5),
                                            pw.Expanded(
                                              flex: 5,
                                              child: pw.Row(
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Image(dotImage,
                                                        height: 4, width: 4),
                                                    pw.SizedBox(width: 8),
                                                    RichTextNormal(
                                                        'Design Review',
                                                        textColor: apptextblack,
                                                        fontSize: textSizeSmall,
                                                        fontFamily: fontBold),
                                                  ]),
                                            )
                                          ])
                                        ]),
                                      ),
                                    ])))
                      ]),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 3,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                color: appblack,
                                child: pw.Column(children: [
                                  RichTextBold('03',
                                      textColor: appwhite,
                                      fontSize: textSizeXLarge32,
                                      fontFamily: fontBold),
                                  pw.SizedBox(height: 2),
                                  RichTextBold('DEVELOP',
                                      textColor: appwhite,
                                      fontSize: textSizeXNormal,
                                      fontFamily: fontBold),
                                ]))),
                        pw.Expanded(
                            flex: 7,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(30, 6, 30, 6),
                                child: pw.Column(
                                    mainAxisSize: pw.MainAxisSize.min,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.SizedBox(height: 12),
                                      pw.Container(
                                        child: pw.Table(children: [
                                          pw.TableRow(children: [
                                            pw.Expanded(
                                                child: pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Image(dotImage,
                                                          height: 4, width: 4),
                                                      pw.SizedBox(width: 8),
                                                      RichTextNormal('Code Dev',
                                                          textColor:
                                                              apptextblack,
                                                          fontSize:
                                                              textSizeSmall,
                                                          fontFamily: fontBold),
                                                    ]),
                                                flex: 5),
                                            pw.Expanded(
                                              flex: 5,
                                              child: pw.Row(
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Image(dotImage,
                                                        height: 4, width: 4),
                                                    pw.SizedBox(width: 8),
                                                    RichTextNormal(
                                                        'Beta Testing',
                                                        textColor: apptextblack,
                                                        fontSize: textSizeSmall,
                                                        fontFamily: fontBold),
                                                  ]),
                                            )
                                          ])
                                        ]),
                                      ),
                                      pw.SizedBox(height: 10),
                                      pw.Container(
                                        child: pw.Table(children: [
                                          pw.TableRow(children: [
                                            pw.Expanded(
                                                child: pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Image(dotImage,
                                                          height: 4, width: 4),
                                                      pw.SizedBox(width: 8),
                                                      RichTextNormal(
                                                          'Deployment',
                                                          textColor:
                                                              apptextblack,
                                                          fontSize:
                                                              textSizeSmall,
                                                          fontFamily: fontBold),
                                                    ]),
                                                flex: 5),
                                            pw.Expanded(
                                              flex: 5,
                                              child: pw.Row(
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Image(dotImage,
                                                        height: 4, width: 4),
                                                    pw.SizedBox(width: 8),
                                                    RichTextNormal(
                                                        'Training & Handover',
                                                        textColor: apptextblack,
                                                        fontSize: textSizeSmall,
                                                        fontFamily: fontBold),
                                                  ]),
                                            )
                                          ])
                                        ]),
                                      ),
                                    ])))
                      ]),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Table(border: pw.TableBorder.all(), children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                            flex: 3,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                color: appblack,
                                child: pw.Column(children: [
                                  RichTextBold('04',
                                      textColor: appwhite,
                                      fontSize: textSizeXLarge32,
                                      fontFamily: fontBold),
                                  pw.SizedBox(height: 2),
                                  RichTextBold('MAINTAIN',
                                      textColor: appwhite,
                                      fontSize: textSizeXNormal,
                                      fontFamily: fontBold),
                                ]))),
                        pw.Expanded(
                            flex: 7,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(30, 6, 30, 6),
                                child: pw.Column(
                                    mainAxisSize: pw.MainAxisSize.min,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.SizedBox(height: 12),
                                      pw.Container(
                                        child: pw.Table(children: [
                                          pw.TableRow(children: [
                                            pw.Expanded(
                                                child: pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Image(dotImage,
                                                          height: 4, width: 4),
                                                      pw.SizedBox(width: 8),
                                                      RichTextNormal(
                                                          'Security Scans',
                                                          textColor:
                                                              apptextblack,
                                                          fontSize:
                                                              textSizeSmall,
                                                          fontFamily: fontBold),
                                                    ]),
                                                flex: 5),
                                            pw.Expanded(
                                              flex: 5,
                                              child: pw.Row(
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Image(dotImage,
                                                        height: 4, width: 4),
                                                    pw.SizedBox(width: 8),
                                                    RichTextNormal(
                                                        'Regular Backups',
                                                        textColor: apptextblack,
                                                        fontSize: textSizeSmall,
                                                        fontFamily: fontBold),
                                                  ]),
                                            )
                                          ])
                                        ]),
                                      ),
                                      pw.SizedBox(height: 10),
                                      pw.Container(
                                        child: pw.Table(children: [
                                          pw.TableRow(children: [
                                            pw.Expanded(
                                                child: pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      pw.Image(dotImage,
                                                          height: 4, width: 4),
                                                      pw.SizedBox(width: 8),
                                                      RichTextNormal(
                                                          'Bug-fixing',
                                                          textColor:
                                                              apptextblack,
                                                          fontSize:
                                                              textSizeSmall,
                                                          fontFamily: fontBold),
                                                    ]),
                                                flex: 5),
                                            pw.Expanded(
                                              flex: 5,
                                              child: pw.Row(
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    pw.Image(dotImage,
                                                        height: 4, width: 4),
                                                    pw.SizedBox(width: 8),
                                                    RichTextNormal(
                                                        'Software Updates',
                                                        textColor: apptextblack,
                                                        fontSize: textSizeSmall,
                                                        fontFamily: fontBold),
                                                  ]),
                                            )
                                          ])
                                        ]),
                                      ),
                                    ])))
                      ]),
                    ])
                  ],
                )),
            pw.Expanded(
                flex: 2,
                child: pw.Stack(children: [
                  pw.Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: pw.Padding(
                          padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                          child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Container(height: 1, color: appsemiblack),
                                pw.SizedBox(height: 10),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichTextBold('Business Profile',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      RichTextNormal(
                                          'hello@raincreatives.com | +91 9998250977',
                                          textColor: appblack,
                                          fontSize: textSizeSmall10,
                                          fontFamily: fontBold),
                                    ])
                              ]))

                      // Image.network("https://raincreatives.com/wp-content/uploads/2021/03/rc_logo_web_header.png")
                      )
                ]))
          ]));
    },
  );
}

pw.Page pageDoc6(
    PdfPageFormat format,
    final font1,
    final font2,
    final im1Image,
    final im2Image,
    final im3Image,
    final im4Image,
    final im5Image,
    final im6Image,
    final im7Image,
    final im8Image,
    final im9Image,
    final dotborderImage) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Container(
          color: apppageback,
          child: pw.Stack(children: [
            pw.Container(
                padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
                margin:
                    const pw.EdgeInsets.only(bottom: 110.0 * PdfPageFormat.mm),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    RichTextBoldUnderline('our clients :',
                        textColor: appblack,
                        fontSize: textSizeXNormal,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 20),
                    RichTextNormal(
                        'Please find below some of our esteemed clients.',
                        textColor: apptextblack,
                        fontSize: textSizeSmall,
                        fontFamily: fontBold),
                    pw.SizedBox(height: 10),
                    pw.Expanded(
                        child: pw.GridView(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            children: [
                          pw.Container(
                              color: appwhite,
                              padding: pw.EdgeInsets.all(12),
                              child: pw.Center(
                                child: pw.Image(im1Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              padding: pw.EdgeInsets.all(12),
                              child: pw.Center(
                                child: pw.Image(im2Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              padding: pw.EdgeInsets.all(12),
                              child: pw.Center(
                                child: pw.Image(im3Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              child: pw.Center(
                                child: pw.Image(im4Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              child: pw.Center(
                                child: pw.Image(im5Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              child: pw.Center(
                                child: pw.Image(im6Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              child: pw.Center(
                                child: pw.Image(im7Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              child: pw.Center(
                                child: pw.Image(im8Image),
                              )),
                          pw.Container(
                              color: appwhite,
                              child: pw.Center(
                                child: pw.Image(im9Image),
                              )),
                        ]))
                  ],
                )),
            pw.Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: pw.Container(
                    padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
                    color: appwhite,
                    child: pw.Column(children: [
                      pw.Row(children: [
                        pw.Expanded(
                            flex: 5,
                            child: pw.Stack(children: [
                              pw.Image(dotborderImage),
                              pw.Container(
                                  padding:
                                      pw.EdgeInsets.fromLTRB(20, 34, 20, 20),
                                  child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceAround,
                                      children: [
                                        RichTextNormal(
                                            'It has been a pleasure to work with Kartik, you can trust he will do his very best to complete your task, explain things in details and he will provide the work done in quality.',
                                            textColor: appblack,
                                            fontSize: textSizeSMedium2,
                                            fontFamily: fontBold),
                                        pw.SizedBox(height: 10),
                                        pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              RichTextBold(
                                                  'Michael T. Nielsen,',
                                                  textColor: appblack,
                                                  fontSize: textSizeSMedium,
                                                  fontFamily: fontBold),
                                              RichTextNormal(
                                                  'BI lead - Kunde & Co',
                                                  textColor: apptextblack,
                                                  fontSize: textSizeSmall,
                                                  fontFamily: fontBold),
                                            ])
                                      ]))
                            ])),
                        pw.Expanded(flex: 1, child: pw.Container()),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Stack(children: [
                              pw.Image(dotborderImage),
                              pw.Container(
                                  padding:
                                      pw.EdgeInsets.fromLTRB(20, 34, 20, 20),
                                  child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceAround,
                                      children: [
                                        RichTextNormal(
                                            '..Excellent communication skills – this goes a long way to getting things done right the first time. 100% happy ..',
                                            textColor: appblack,
                                            fontSize: textSizeSMedium2,
                                            fontFamily: fontBold),
                                        pw.SizedBox(height: 26),
                                        pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              RichTextBold('Bill Schroyer,',
                                                  textColor: appblack,
                                                  fontSize: textSizeSMedium,
                                                  fontFamily: fontBold),
                                              RichTextNormal(
                                                  'Equity Build Inc.',
                                                  textColor: apptextblack,
                                                  fontSize: textSizeSmall,
                                                  fontFamily: fontBold),
                                            ])
                                      ]))
                            ])),
                      ]),
                      pw.Padding(
                          padding: pw.EdgeInsets.fromLTRB(1, 20, 1, 20),
                          child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceEvenly,
                              children: [
                                pw.Container(height: 1, color: appsemiblack),
                                pw.SizedBox(height: 10),
                                pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichTextBold('Business Profile',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      RichTextNormal(
                                          'hello@raincreatives.com | +91 9998250977',
                                          textColor: appblack,
                                          fontSize: textSizeSmall10,
                                          fontFamily: fontBold),
                                    ])
                              ]))
                    ])))
          ]));
    },
  );
}

pw.Page pageDoc7(
    PdfPageFormat format, final font1, final font2, final mywork1Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Stack(children: [
        pw.Column(children: [
          pw.Expanded(flex: 4, child: pw.Container(color: appblack)),
          pw.Expanded(flex: 6, child: pw.Container())
        ]),
        pw.Container(
            padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: RichTextBoldUnderline('our work :',
                        textColor: appwhite,
                        fontSize: textSizeXNormal,
                        fontFamily: fontBold),
                  ),
                  pw.Expanded(
                      flex: 6,
                      child: pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: pw.Image(mywork1Image, fit: pw.BoxFit.fill))),
                  pw.SizedBox(height: 20),
                  pw.Expanded(
                      flex: 4,
                      child: pw.Row(children: [
                        pw.Expanded(
                            flex: 7,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Waxxxpress (USA,UK)',
                                          textColor: appblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 6),
                                      RichTextNormal(
                                          'Overseas brand of Australia’s largest salon wax manufacturer, delivers wax at doorsteps in US and UK for salon',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 16),
                                      RichTextBold('Service Provided',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('•Portal Development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '•On-going Incremental Development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('•Yearly Maintenance',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 20),
                                      pw.Container(
                                          padding: pw.EdgeInsets.all(12),
                                          color: apppageback,
                                          child: pw.RichText(
                                              // textAlign: pw.TextAlign.center,
                                              text: pw.TextSpan(children: [
                                            pw.TextSpan(
                                              text: 'www.waxxxpress.com',
                                              style: pw.TextStyle(
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  fontSize: textSizeSMedium,
                                                  color: appblack),
                                            ),
                                          ])))
                                    ]))),
                        pw.Container(
                            margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 18),
                            color: applighblack,
                            width: 2),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Container(
                                padding: pw.EdgeInsets.fromLTRB(12, 8, 8, 8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Features',
                                          textColor: apptextblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 8),
                                      RichTextNormal('• Online shop',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• 1st Wax free function, based on address and email verification.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Step discounts',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Salon-owner verification',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Combo Deals',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Order tracking for customers',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Customized Reports',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Fully Responsive Design',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Multi-shop, admin & currency',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ])))
                      ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Stack(children: [
                        pw.Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Container(
                                          height: 1, color: appsemiblack),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextBold('Business Profile',
                                                textColor: appblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                            RichTextNormal(
                                                'hello@raincreatives.com | +91 9998250977',
                                                textColor: appblack,
                                                fontSize: textSizeSmall10,
                                                fontFamily: fontBold),
                                          ])
                                    ])))
                      ]))
                ]))
      ]);
    },
  );
}

pw.Page pageDoc8(
    PdfPageFormat format, final font1, final font2, final mywork2Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Stack(children: [
        pw.Column(children: [
          pw.Expanded(flex: 4, child: pw.Container(color: appblack)),
          pw.Expanded(flex: 6, child: pw.Container())
        ]),
        pw.Container(
            padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                      flex: 6,
                      child: pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: pw.Image(mywork2Image, fit: pw.BoxFit.fill))),
                  pw.SizedBox(height: 20),
                  pw.Expanded(
                      flex: 4,
                      child: pw.Row(children: [
                        pw.Expanded(
                            flex: 7,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Massy United Insurance',
                                          textColor: appblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 6),
                                      RichTextNormal(
                                          'MUI is a leading brand of largest business group in Caribbean - Massy Group. It is leader in Non-life insurance',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 16),
                                      RichTextBold('Service Provided',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• Portal Development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• App Development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• Yearly Maintenance for both',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 20),
                                      pw.Container(
                                          padding: pw.EdgeInsets.all(12),
                                          color: apppageback,
                                          child: pw.RichText(
                                              // textAlign: pw.TextAlign.center,
                                              text: pw.TextSpan(children: [
                                            pw.TextSpan(
                                              text:
                                                  'www.massyunitedinsurance.com',
                                              style: pw.TextStyle(
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  fontSize: textSizeSMedium,
                                                  color: appblack),
                                            ),
                                          ])))
                                    ]))),
                        pw.Container(
                            margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 18),
                            color: applighblack,
                            width: 2),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Container(
                                padding: pw.EdgeInsets.fromLTRB(12, 8, 8, 8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Features',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 8),
                                      RichTextNormal(
                                          '• Online information portal',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• My Vault, a digital storage to store valuable documents.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Road Side Assistance feature, which alerts hospital, police and agency in case of any accident and requests help.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Online submission of insurance claims.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Agents & Office Geo-location tagging.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Fully responsive site',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Multi-site for different regions.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Online inquiry',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ])))
                      ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Stack(children: [
                        pw.Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Container(
                                          height: 1, color: appsemiblack),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextBold('Business Profile',
                                                textColor: appblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                            RichTextNormal(
                                                'hello@raincreatives.com | +91 9998250977',
                                                textColor: appblack,
                                                fontSize: textSizeSmall10,
                                                fontFamily: fontBold),
                                          ])
                                    ])))
                      ]))
                ]))
      ]);
    },
  );
}

pw.Page pageDoc9(
    PdfPageFormat format, final font1, final font2, final mywork3Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Stack(children: [
        pw.Column(children: [
          pw.Expanded(flex: 4, child: pw.Container(color: appblack)),
          pw.Expanded(flex: 6, child: pw.Container())
        ]),
        pw.Container(
            padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                      flex: 6,
                      child: pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: pw.Image(mywork3Image, fit: pw.BoxFit.fill))),
                  pw.SizedBox(height: 20),
                  pw.Expanded(
                      flex: 4,
                      child: pw.Row(children: [
                        pw.Expanded(
                            flex: 7,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('SGP - UNDP(United Nations)',
                                          textColor: appblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 6),
                                      RichTextNormal(
                                          'SGP is a flagship program of UNDP with projects in over 125 countries. We are developing their intranet which will be used by their entire staff for their day-to-day activities. It will be used to update each project status over 125 countries and thousands of projects they execute each year.',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 16),
                                      RichTextBold('Service Provided',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• Intranet Development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• On-going Incremental Development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• Website Migration',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• On-going Maintenance services.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 20),
                                    ]))),
                        pw.Container(
                            margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 18),
                            color: applighblack,
                            width: 2),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Container(
                                padding: pw.EdgeInsets.fromLTRB(12, 8, 8, 8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Features',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 8),
                                      RichTextNormal('• Single sign-on feature',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• User management',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Digital Library of publications',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Image/Video library',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Talent Finder',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Shared Files',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Individual/Shared Calender',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Multi-lingual',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• News & Announcements',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Close integration between website and Intranet',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ])))
                      ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Stack(children: [
                        pw.Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Container(
                                          height: 1, color: appsemiblack),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextBold('Business Profile',
                                                textColor: appblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                            RichTextNormal(
                                                'hello@raincreatives.com | +91 9998250977',
                                                textColor: appblack,
                                                fontSize: textSizeSmall10,
                                                fontFamily: fontBold),
                                          ])
                                    ])))
                      ]))
                ]))
      ]);
    },
  );
}

pw.Page pageDoc10(
    PdfPageFormat format, final font1, final font2, final mywork4Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Stack(children: [
        pw.Column(children: [
          pw.Expanded(flex: 4, child: pw.Container(color: appblack)),
          pw.Expanded(flex: 6, child: pw.Container())
        ]),
        pw.Container(
            padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                      flex: 6,
                      child: pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: pw.Image(mywork4Image, fit: pw.BoxFit.fill))),
                  pw.SizedBox(height: 20),
                  pw.Expanded(
                      flex: 4,
                      child: pw.Row(children: [
                        pw.Expanded(
                            flex: 7,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Real-time Dashboard',
                                          textColor: appblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 6),
                                      RichTextNormal(
                                          'This dashboard provides a real-time view of the jobs for a major skip collection services in Barbados. It provides a quick view of all jobs pending, in-progress and completed. You can filter them through by each employee or even the equipment used. Jobs Admin can also click on any of the number and see the list of individual jobs too.',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 16),
                                      RichTextBold('Service Provided',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• Real-time updates',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• Integration with Ms-sql Database',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• Google Graphs integration',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• On-going Maintenance services.',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 20),
                                    ]))),
                        pw.Container(
                            margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 18),
                            color: applighblack,
                            width: 2),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Container(
                                padding: pw.EdgeInsets.fromLTRB(12, 8, 8, 8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Features',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 8),
                                      RichTextNormal(
                                          '• Jobs management services',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Dashboard graphs via Google graphs',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Employee/Job Status/Equipment Filters',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Date/Week/Month/ Filters',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Drill-down to individual tasks',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Real-time updates',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ])))
                      ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Stack(children: [
                        pw.Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Container(
                                          height: 1, color: appsemiblack),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextBold('Business Profile',
                                                textColor: appblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                            RichTextNormal(
                                                'hello@raincreatives.com | +91 9998250977',
                                                textColor: appblack,
                                                fontSize: textSizeSmall10,
                                                fontFamily: fontBold),
                                          ])
                                    ])))
                      ]))
                ]))
      ]);
    },
  );
}

pw.Page pageDoc11(PdfPageFormat format, final font1, final font2,
    final mob1Image, final mob2Image, final mob3Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Stack(children: [
        pw.Column(children: [
          pw.Expanded(flex: 4, child: pw.Container(color: appblack)),
          pw.Expanded(flex: 6, child: pw.Container())
        ]),
        pw.Container(
            padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(flex: 1, child: pw.Container()),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Container(
                                  margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: pw.Image(mob1Image),
                                ),
                                pw.Container(
                                  margin: pw.EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: pw.Image(mob2Image),
                                ),
                                pw.Container(
                                  margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: pw.Image(mob3Image),
                                )
                              ]))),
                  pw.SizedBox(height: 20),
                  pw.Expanded(
                      flex: 4,
                      child: pw.Row(children: [
                        pw.Expanded(
                            flex: 7,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Shipment Tracking & Quote',
                                          textColor: appblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 6),
                                      RichTextNormal(
                                          'The app allows users to request a quote for their shipment items. It also allows users to see their shipments once arrived and track it till delivery. It also has module for delivery persons to get a list of deliveries to be done and mark them delivered. A lot of other features like uploading invoices, how to order, etc. in-built in this app.',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 16),
                                      RichTextBold('Service Provided',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• iOS & Android Apps',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• Flutter app development',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• Google Maps integration',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• On-going Maintenance services',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 20),
                                    ]))),
                        pw.Container(
                            margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 18),
                            color: applighblack,
                            width: 2),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Container(
                                padding: pw.EdgeInsets.fromLTRB(12, 8, 8, 8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Features',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 8),
                                      RichTextNormal('• Request Quote',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Shipments Alert',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Track Shipment',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Agent module',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Delivery Schedule',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Customer’s Signature capture on delivery',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ])))
                      ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Stack(children: [
                        pw.Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Container(
                                          height: 1, color: appsemiblack),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextBold('Business Profile',
                                                textColor: appblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                            RichTextNormal(
                                                'hello@raincreatives.com | +91 9998250977',
                                                textColor: appblack,
                                                fontSize: textSizeSmall10,
                                                fontFamily: fontBold),
                                          ])
                                    ])))
                      ]))
                ]))
      ]);
    },
  );
}

pw.Page pageDoc12(PdfPageFormat format, final font1, final font2,
    final mob4Image, final mob5Image, final mob6Image) {
  return pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: format.copyWith(
        marginBottom: 0,
        marginLeft: 0,
        marginRight: 0,
        marginTop: 0,
      ),
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
    ),
    build: (context) {
      return pw.Stack(children: [
        pw.Column(children: [
          pw.Expanded(flex: 4, child: pw.Container(color: appblack)),
          pw.Expanded(flex: 6, child: pw.Container())
        ]),
        pw.Container(
            padding: pw.EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(flex: 1, child: pw.Container()),
                  pw.Expanded(
                      flex: 5,
                      child: pw.Container(
                          padding: pw.EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Container(
                                  margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: pw.Image(mob4Image),
                                ),
                                pw.Container(
                                  margin: pw.EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: pw.Image(mob5Image),
                                ),
                                pw.Container(
                                  margin: pw.EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: pw.Image(mob6Image),
                                )
                              ]))),
                  pw.SizedBox(height: 20),
                  pw.Expanded(
                      flex: 4,
                      child: pw.Row(children: [
                        pw.Expanded(
                            flex: 7,
                            child: pw.Container(
                                padding: pw.EdgeInsets.all(8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Resort Reservation App',
                                          textColor: appblack,
                                          fontSize: textSizeMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 6),
                                      RichTextNormal(
                                          'The Arabic app allows users to book holiday resorts. Resort owners also can manage their properties through the app itself. There is facility for verified listings, special holiday pricing, blocking/unblocking dates, online payment via MADA and push-notification for important alerts. App is available in both iOS and Android.',
                                          textColor: appblack,
                                          fontSize: textSizeSmall,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 16),
                                      RichTextBold('Service Provided',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• Native iOS & Android Apps',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• PHP/Mysql Website and Back-end',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal(
                                          '• MADA payment integration',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• Push-notifications',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 2),
                                      RichTextNormal('• Calender Integration',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ]))),
                        pw.Container(
                            margin: pw.EdgeInsets.fromLTRB(0, 10, 0, 18),
                            color: applighblack,
                            width: 2),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Container(
                                padding: pw.EdgeInsets.fromLTRB(12, 8, 8, 8),
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      RichTextBold('Features',
                                          textColor: apptextblack,
                                          fontSize: textSizeSMedium,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 8),
                                      RichTextNormal('• Resort Reservations',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Resort Details & Pricing',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Resort Management by Owners',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Holiday Pricing Management',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal('• Block Dates Facility',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Calender-view to check check-in/check-out',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Google Maps based direction',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Easy Review & Rate function',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                      pw.SizedBox(height: 3),
                                      RichTextNormal(
                                          '• Booking Cancellation Management',
                                          textColor: apptextblack,
                                          fontSize: textSizeSmall11,
                                          fontFamily: fontBold),
                                    ])))
                      ])),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Stack(children: [
                        pw.Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: pw.Padding(
                                padding: pw.EdgeInsets.fromLTRB(1, 0, 1, 20),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Container(
                                          height: 1, color: appsemiblack),
                                      pw.SizedBox(height: 10),
                                      pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextBold('Business Profile',
                                                textColor: appblack,
                                                fontSize: textSizeSmall,
                                                fontFamily: fontBold),
                                            RichTextNormal(
                                                'hello@raincreatives.com | +91 9998250977',
                                                textColor: appblack,
                                                fontSize: textSizeSmall10,
                                                fontFamily: fontBold),
                                          ])
                                    ])))
                      ]))
                ]))
      ]);
    },
  );
}
