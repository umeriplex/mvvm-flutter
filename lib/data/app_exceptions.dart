class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return 'E X C E P T I O N{_message: $_message, _prefix: $_prefix}';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'Error During Communication.');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request.');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message]) : super(message, 'Unauthorised Request.');
}

class InvalidInoutException extends AppExceptions {
  InvalidInoutException([String? message]) : super(message, 'InvalidInout Request.');
}