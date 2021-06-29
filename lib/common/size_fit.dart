import 'dart:ui';

class SizeFit {
  static double physicalWidth = 0.0;
  static double physicalHight = 0.0;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double dpr = 0.0;
  static double px = 0.0;
  static double rpx = 0.0;

  static void initialize() {
    // 获取手机物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHight = window.physicalSize.height;

    // 获取dpr
    dpr = window.devicePixelRatio;

    // 手机真实尺寸
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHight / dpr;

    // 计算px与rpx
    rpx = screenWidth / 750;
    px = rpx * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

extension SizeFitRpxIntExtension on int {
  double get rpx {
    return SizeFit.setRpx(this.toDouble());
  }
}

extension SizeFitRpxDoubleExtension on double {
  double get rpx {
    return SizeFit.setRpx(this);
  }
}

extension SizeFitPxIntExtension on int {
  double get px {
    return SizeFit.setPx(this.toDouble());
  }
}

extension SizeFitPxDoubleExtension on double {
  double get px {
    return SizeFit.setPx(this);
  }
}
