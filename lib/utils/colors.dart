import 'package:flutter/animation.dart';

abstract class FcColors {
  //App Colors
  static const Color primary = Color(0xFF501D90);
  static const Color primaryAccent = Color(0xFF683C96);
  static const Color white = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFE69B83);
  static const Color tertiary = Color(0xFFFFF0ED);
  static const Color icons = Color(0xFFFBD6C3);

  //Progress Colors
  static const Color progressGrey = Color(0xFFEBEBEB);
  static const Color progressColor = Color(0xFF2B797E);

  //Dialog Colors
  static const Color dialogBackground = Color(0xFFFFE6D9);
  static const Color dialogBorder = secondary;
  static const Color dialogTitleColor = primary;
  static const Color dialogTextColor = Color(0xFF454545);
  static const Color dialogTextFieldColor = tertiary;
  static const Color dialogPlaceholderColor = Color(0xFFADADAD);
  static const Color dialogSelectedOutlineColor = primaryAccent;
}
