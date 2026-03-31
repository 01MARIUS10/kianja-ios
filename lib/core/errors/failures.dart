import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, this.statusCode = 0});
  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

//------------------- Client side Failures -------------------
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message, super.statusCode = 401});
}

class PaymentRequiredFailure extends Failure {
  const PaymentRequiredFailure({
    required super.message,
    super.statusCode = 402,
  });
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({required super.message, super.statusCode = 403});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message, super.statusCode = 404});
}

class MethodNotAllowedFailure extends Failure {
  const MethodNotAllowedFailure({
    required super.message,
    super.statusCode = 405,
  });
}

class NotAcceptableFailure extends Failure {
  const NotAcceptableFailure({required super.message, super.statusCode = 406});
}

class ProxyAuthenticationRequiredFailure extends Failure {
  const ProxyAuthenticationRequiredFailure({
    required super.message,
    super.statusCode = 407,
  });
}

class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure({required super.message, super.statusCode = 408});
}

class ConflictFailure extends Failure {
  const ConflictFailure({required super.message, super.statusCode = 409});
}

class CancelledFailure extends Failure {
  const CancelledFailure({required super.message});
}

class BadCertificateFailure extends Failure {
  const BadCertificateFailure({required super.message});
}

//------------------- Server side Failures -------------------
class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure({
    required super.message,
    super.statusCode = 500,
  });
}

class NotImplementedFailure extends Failure {
  const NotImplementedFailure({required super.message, super.statusCode = 501});
}

class BadGatewayFailure extends Failure {
  const BadGatewayFailure({required super.message, super.statusCode = 502});
}

class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({
    required super.message,
    super.statusCode = 503,
  });
}

class ConnectionTimeoutFailure extends Failure {
  const ConnectionTimeoutFailure({
    required super.message,
    super.statusCode = 504,
  });
}

class SendTimeoutFailure extends Failure {
  const SendTimeoutFailure({required super.message, super.statusCode = 504});
}

class ReceiveTimeoutFailure extends Failure {
  const ReceiveTimeoutFailure({required super.message, super.statusCode = 504});
}

class ConnectionErrorFailure extends Failure {
  const ConnectionErrorFailure({
    required super.message,
    super.statusCode = 504,
  });
}

class HTTPVersionNotSupportedFailure extends Failure {
  const HTTPVersionNotSupportedFailure({
    required super.message,
    super.statusCode = 505,
  });
}

class LoopDetectedFailure extends Failure {
  const LoopDetectedFailure({required super.message, super.statusCode = 508});
}

//------------------- Unknown Failure -------------------
class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}
