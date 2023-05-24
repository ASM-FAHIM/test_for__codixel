import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //for slider big container
  static double pageView = screenHeight / 2.5;
  static double pageViewContainer = screenHeight / 3.63;
  static double pageViewTextContainer = screenHeight / 6.66;

  //dynamic height padding and margin(top/bottom/height/width)
  static double height05 = screenHeight / 160.00;
  static double height10 = screenHeight / 84.40;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.20;
  static double height30 = screenHeight / 26.67;
  static double height35 = screenHeight / 22.85;
  static double height45 = screenHeight / 17.77;
  static double height50 = screenHeight / 16.00;
  static double height60 = screenHeight / 13.33;
  static double height70 = screenHeight / 11.42;
  static double height120 = screenHeight / 6.67;
  static double height150 = screenHeight / 5.33;
  static double height200 = screenHeight / 4.00;
  static double height220 = screenHeight / 3.63;
  static double height280 = screenHeight / 2.78;

  //dynamic width padding and margin(left/right)
  static double width05 = screenHeight / 78.54;
  static double width10 = screenHeight / 84.40;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.20;
  static double width35 = screenHeight / 22.85;
  static double width45 = screenHeight / 17.77;

  //font size
  static double fontBigS16 = screenHeight / 51.75;
  static double fontBigS18 = screenHeight / 44.44;
  static double fontBigS20 = screenHeight / 42.20;
  static double fontBigS26 = screenHeight / 30.76;

  //for icon size
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize25 = screenHeight / 32.00;
  static double iconSize30 = screenHeight / 26.67;
  static double iconSize35 = screenHeight / 22.85;
}
