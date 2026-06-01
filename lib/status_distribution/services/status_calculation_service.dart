class StatusCalculationService {

  /// TOTAL VALUE
  static double calculateTotal(
      List<double> values,
      ) {

    return values.fold(
      0.0,
          (sum, value) => sum + value,
    );
  }

  /// PERCENTAGE
  static double calculatePercentage({

    required double value,

    required double total,

  }) {

    if (total == 0) {
      return 0;
    }

    return (value / total) * 100;
  }
}