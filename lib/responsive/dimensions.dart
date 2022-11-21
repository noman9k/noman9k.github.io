const mobileWidth = 200;
const tabletWidth = 700;
const desktopWidth = 1200;

enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

ScreenSize getScreenSize(double width) {
  if (width >= desktopWidth) {
    return ScreenSize.desktop;
  } else if (width >= tabletWidth) {
    return ScreenSize.tablet;
  } else {
    return ScreenSize.mobile;
  }
}
