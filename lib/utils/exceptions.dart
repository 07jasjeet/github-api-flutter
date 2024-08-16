class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class ForbiddenException extends AppException {
  ForbiddenException([message]) : super(message, "Forbidden: ");
}

class DoesNotExistException extends AppException {
  DoesNotExistException([message]) : super(message, "Does not exist error: ");
}

class RateLimitExceededException extends AppException {
  RateLimitExceededException([message]) : super(message, "Rate limit exceeded: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid input: ");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Server exception: ");
}