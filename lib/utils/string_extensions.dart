extension StringExtensions on String {
  String getDecimalValue() {
    if (split('.')[1].contains('0')) {
      return replaceAll('.0', '');
    } else {
      return this;
    }
  }
}
