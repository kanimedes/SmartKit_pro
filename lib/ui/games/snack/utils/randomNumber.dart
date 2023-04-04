// ignore_for_file: file_names
import 'dart:math';

class RandomNumber {
  static double randomDouble(double min, double max) {
    Random random = Random.secure();
    double height = random.nextDouble();

    if (height <= min || height >= max) {
      height = randomDouble(min, max);
    }
    return double.parse(height.toStringAsFixed(2));
  }

  static int randomInteger(int max) {
    Random random = Random.secure();

    return random.nextInt(max);
  }
}
