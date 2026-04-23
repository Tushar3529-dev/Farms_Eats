import 'package:flutter/cupertino.dart';
import 'package:software_lab/utils/constants/sizes.dart';

class STSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: STAppSizes.appBarHeight,
    left: STAppSizes.defaultSpacing,
    bottom: STAppSizes.defaultSpacing,
    right: STAppSizes.defaultSpacing,
  );
}
