extension StringExtensions on String {
  String getDecimalValue() {
    if (this.split('.')[1].contains('0'))
      return this.replaceAll('.0', '');
    else
      return this;
  }
}
