import 'dart:math';

extension RandomInRange on Random {
  double doubleInRange(num start, num end) =>
      nextDouble() * (end - start) + start;

  int intInRange(int start, int end) {
    return start + nextInt(end - start);
  }
}