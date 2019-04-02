library flutter_responsive;

import 'package:flutter/material.dart';

double _sm = 320;
double _md = 767;

enum ScreenType {
  ///Small screens 320px and under
  small,

  ///Medium screens [321-767]px
  medium,

  ///Large screens 768px and over
  large,
}

ScreenType getScreenType(BuildContext context) {
  var width = MediaQuery.of(context).size.width;

  if (width <= _sm) {
    return ScreenType.small;
  } else if (width <= _md) {
    return ScreenType.medium;
  }
  return ScreenType.large;
}

///Defines a responsive value<T> based on screen type [sm, md, lg]
class Responsive<T> {
  T value;

  ///Screen width <= 320
  T sm;

  ///Screen screen 321 <= width <= 767
  T md;

  ///Screen width >= 768
  T lg;

  Responsive(
    this.value, {
    this.sm,
    this.md,
    this.lg,
  });

  T getValue(BuildContext context) {
    var screenType = getScreenType(context);

    if (screenType == ScreenType.small && sm != null) {
      return sm;
    } else if (screenType == ScreenType.medium && md != null) {
      return md;
    } else if (screenType == ScreenType.large && lg != null) {
      return lg;
    }

    return value;
  }
}
