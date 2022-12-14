/*fonts*/
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nxt_verify/utils/ShColors.dart';

const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall10 = 10.0;
const textSizeSmall11 = 11.0;
const textSizeSmall = 12.0;
const textSizeSMedium2 = 13.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeXNormal = 22.0;
const textSizeLarge = 24.0;
const textSizeLarge28 = 28.0;
const textSizeXLarge = 30.0;
const textSizeXLarge32 = 32.0;
const textSizeXLarge38 = 38.0;

const Color PRIMARY_COLOR = Color(0xffFBFBFB);
const String OTP_GIF_IMAGE = "images/otp.gif";
const String myimg="images/new_home.png";
const String myimg_home="images/home.png";
const sh_new_cart="images/new_cart.png";
const sh_no_img="images/no_images.png";
const sh_my_logo="images/mylogo.png";
const sh_heart="images/heart.png";
const sh_search="images/new_search.png";
const food_ic_user1 = "images/food_ic_user1.png";
const t3_ic_pizza_dialog = "images/t3_ic_pizza_dialog.png";

const sh_setting="images/settings.png";
const sh_setting_dark="images/settings_dark.png";
const sh_account="images/account.png";
const sh_account_dark="images/account_dark.png";
const sh_upper="images/cassie_landing_bg.png";
const sh_spls_upper2="images/spls_upper2.svg";
const sh_upper2="images/spls_upper.png";
const sh_rc_logo="images/rc_logo.png";
const sh_spls3="images/spls3.svg";
const sh_toolbar="images/toolbar.png";

const sh_floating="images/floating.png";
const sh_plus="images/plus.png";

const sh_menu_filter="images/menu_filter.svg";
/* margin */

const spacing_control_half = 2.0;
const spacing_control = 4.0;
const spacing_standard = 8.0;
const spacing_middle = 10.0;
const spacing_middle4 = 12.0;
const spacing_standard_new = 16.0;
const spacing_large = 24.0;
const spacing_xlarge = 32.0;
const spacing_xxLarge = 40.0;

enum ConfirmAction { CANCEL, ACCEPT }

const defaultDuration = Duration(milliseconds: 250);

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: 10),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: sh_textColorSecondary),
  );
}

final kApiUrl = defaultTargetPlatform == TargetPlatform.android
    ? 'http://192.168.1.189:4242'
    : 'http://192.168.1.1:4242';