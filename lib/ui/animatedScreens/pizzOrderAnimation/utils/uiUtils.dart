import 'package:flutter/widgets.dart';

class UiUtils {
  static String pizzDetailsBackgroundContainerHeroTag = "backgroundContainer";
  static double getPizzaScale(double dheight) {
    if (dheight >= 850) {
      return 1.14;
    } else if (dheight < 850 && dheight >= 750.0) {
      return 1.12;
    } else if (dheight < 750 && dheight >= 650.0) {
      return 1.07;
    }
    return 1.02;
  }

  static double getPizzaPanVerticalTranslate(double dheight) {
    if (dheight >= 850) {
      return 15.75;
    } else if (dheight < 850 && dheight >= 750.0) {
      return 14.95;
    } else if (dheight < 750 && dheight >= 650.0) {
      return 13.25;
    }
    return 12.0;
  }

  static double getPizzaHeight(double dheight) {
    if (dheight >= 850) {
      return 0.3;
    } else if (dheight < 850 && dheight >= 750.0) {
      return 0.325;
    } else if (dheight < 750 && dheight >= 650.0) {
      return 0.35;
    }
    return 0.375;
  }

  static double getPizzaTranslateVertical(double dheight) {
    if (dheight >= 850) {
      return 9.0;
    } else if (dheight < 850 && dheight >= 750.0) {
      return -2.0;
    } else if (dheight < 750 && dheight >= 650.0) {
      return -8.0;
    }
    return -14.0;
  }

  static double getPizzaPanScale(double dheight) {
    if (dheight >= 850) {
      return 0.935;
    } else if (dheight < 850 && dheight >= 750.0) {
      return 0.985;
    } else if (dheight < 750 && dheight >= 650.0) {
      return 1.035;
    }
    return 1.085;
  }

  static double getToppingsDy(double dheight) {
    if (dheight >= 850) {
      return 0.065;
    } else if (dheight < 850 && dheight >= 750.0) {
      return 0.055;
    } else if (dheight < 750 && dheight >= 650.0) {
      return 0.04;
    }
    return 0.03;
  }

  static double getToppingsScale(double dheight) {
    if (dheight >= 850) {
      return 0.945;
    } else if (dheight < 850 && dheight >= 750.0) {
      return 0.955;
    } else if (dheight < 750 && dheight >= 650.0) {
      return 1.0;
    }
    return 0.9;
  }

  static double getToppingsDx(double dheight) {
    if (dheight >= 850) {
      return -2.0;
    } else if (dheight < 850 && dheight >= 750.0) {
      return -1.5;
    } else if (dheight < 750 && dheight >= 650.0) {
      return -1.5;
    }
    return -0.5;
  }

  static Alignment getAddToCardEndAlignment(double dheight) {
    if (dheight >= 850) {
      return const Alignment(2.6, -1.65);
    } else if (dheight < 850 && dheight >= 750.0) {
      return const Alignment(2.5, -1.75);
    } else if (dheight < 750 && dheight >= 650.0) {
      return const Alignment(2.4, -1.85);
    }
    return const Alignment(2.3, -1.95);
  }

  //(2.6,-1.65),(2.5,-1.75),(2.4,-1.85) (2.3,-1.95)
}
