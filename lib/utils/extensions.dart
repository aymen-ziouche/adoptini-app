extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension NumberRounding on double {
  double toPrecision(int precision) {
    return double.parse((this).toStringAsFixed(precision)).toDouble();
  }
}