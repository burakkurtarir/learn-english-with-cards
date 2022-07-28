class MathUtil {
  static final MathUtil _instance = MathUtil._init();

  MathUtil._init();

  factory MathUtil() {
    return _instance;
  }

  /// Normalize values between 0 and 1
  /// But result can be bigger than 1 and smaller than 0
  double normalize(double val, double max, double min) {
    return (val - min) / (max - min);
  }

  /// Normalize values between 0 and 1
  /// And result be between 0 and 1
  /// Can't be bigger than 1 or smaller than 0
  double normalizeBetweenZeroAndOne(double val, double max, double min) {
    final result = (val - min) / (max - min);
    if (result > 1) return 1;
    if (result < 0) return 0;
    return result;
  }
}
