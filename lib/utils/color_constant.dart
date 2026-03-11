import 'package:flutter/material.dart';

abstract class CustomColors {
  static const Color lightBlueColor = Color(0xff88E3FB);
  static const Color lightPurpleColor = Color(0xffE7C6E8);
  static const Color bottomNavText = Color(0xff636363);
  static const Color purpleColor = Color(0xffEEA1F0);
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color silverColor = Color(0xff657296);
  static const Color greyColor = Color(0xffE9E9E9);
  static const Color iconColor = Color(0xffF2F2F2);
  static const Color dashboardBackgroundColor = Color(0xffF9FAFB);
  static const Color borderColor = Color(0x1010101A);

  static const Color textGreyColor = Color(0xff6B7280);
  static const Color textFeildBoaderColor = Color(0xff939393);
  static const Color blueColor = Color(0xFF74D8F2);
  static const Color navigationRailBackground = Color(0xFFDEF8FF);
  static const Color drakPurpleColor = Color(0xFF4F39F6);
  static const Color fillColor = Color(0xffF3F3F5);

  static const Color errorColor = Color(0xFFEF4444);

  static const LinearGradient purpleBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff88E3FB), Color(0xffE7C6E8)],
  );

  static LinearGradient blueWhitePurpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff88E3FB).withValues(alpha: 0.05),
      Color(0xffFFFFFF),
      Color(0xffE7C6E8),
    ],
  );
  static LinearGradient whitePurpleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffFFF0FF), Color(0xffE7C6E8)],
  );
  static const LinearGradient purpleWhiteBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffE7C6E8), Color(0xffFFFFFF), Color(0xff88E3FB)],
  );
  static LinearGradient BlueWithWhiteGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFFFFFF).withValues(alpha: 0.0), // fully transparent
      Color(0xffFFFFFF).withValues(alpha: 0.8),
      Color(0xff88E3FB).withValues(alpha: 0.3),
      Color(0xff88E3FB).withValues(alpha: 0.5),
      Color(0xff88E3FB).withValues(alpha: 0.5),
      Color(0xffFFFFFF).withValues(alpha: 0.6),
      Color(0xffFFFFFF).withValues(alpha: 1.0),
    ],
  );
}
