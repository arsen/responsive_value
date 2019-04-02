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

void setResponsiveBreakpoints({
  double sm = 320,
  double md = 767,
}) {
  _sm = sm;
  _md = md;
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

  ///Get the value based on screen size
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


///Hides the widget on a specific screen type [sm, md, lg]
class Hidden extends StatelessWidget {
  final Widget child;
  final bool sm;
  final bool md;
  final bool lg;

  Hidden({
    Key key,
    this.child,
    this.sm = false,
    this.md = false,
    this.lg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenType = getScreenType(context);
    var offstage = false;
    if (screenType == ScreenType.small && sm) {
      offstage = true;
    } else if (screenType == ScreenType.medium && md) {
      offstage = true;
    } else if (screenType == ScreenType.large && lg) {
      offstage = true;
    }

    return Offstage(
      child: child,
      offstage: offstage,
    );
  }
}
