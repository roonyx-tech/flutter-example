enum ValueExceptionType { EMPTY, CANT_PARSE }

extension ExValueExceptionType on ValueExceptionType {
  String get value {
    switch (this) {
      case ValueExceptionType.EMPTY:
        return 'This value can\'t be empty';
      case ValueExceptionType.CANT_PARSE:
        return 'The value is wrong';
    }
  }
}

class ValueException implements Exception {
  ValueExceptionType exceptionType;

  ValueException(this.exceptionType) : super();

  String get message => exceptionType.value;
}
