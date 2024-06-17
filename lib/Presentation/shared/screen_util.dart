import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Config {
  Config._();

  static final Config _singleton = Config._();

  factory Config() => _singleton;

  static bool get isSmallScreen => 1.sh <= 690.0;

  static double get bottomSpace => isSmallScreen ? 16 : 32;

  static double get multiplier => isSmallScreen ? 0.8 : 1;

  static const figmaDesignSize = Size(393, 804);
}