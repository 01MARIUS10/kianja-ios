import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  const AppException({required this.message, this.statusCode = 500});
  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

//------------------- Client side exceptions -------------------
class UnauthorizedException extends AppException {
  const UnauthorizedException({required super.message, super.statusCode = 401});
}

class PaymentRequiredException extends AppException {
  const PaymentRequiredException({
    required super.message,
    super.statusCode = 402,
  });
}

class ForbiddenException extends AppException {
  const ForbiddenException({required super.message, super.statusCode = 403});
}

class NotFoundException extends AppException {
  const NotFoundException({required super.message, super.statusCode = 404});
}

class MethodNotAllowedException extends AppException {
  const MethodNotAllowedException({
    required super.message,
    super.statusCode = 405,
  });
}

class NotAcceptableException extends AppException {
  const NotAcceptableException({
    required super.message,
    super.statusCode = 406,
  });
}

class ProxyAuthenticationRequiredException extends AppException {
  const ProxyAuthenticationRequiredException({
    required super.message,
    super.statusCode = 407,
  });
}

class RequestTimeoutException extends AppException {
  const RequestTimeoutException({
    required super.message,
    super.statusCode = 408,
  });
}

class ConflictException extends AppException {
  const ConflictException({required super.message, super.statusCode = 409});
}

class UnprocessableEntityException extends AppException {
  const UnprocessableEntityException({
    required super.message,
    super.statusCode = 422,
  });
}

class CancelledException extends AppException {
  const CancelledException({required super.message});
}

class BadCertificateException extends AppException {
  const BadCertificateException({required super.message});
}

//------------------- Server side exceptions -------------------
class InternalServerErrorException extends AppException {
  const InternalServerErrorException({
    required super.message,
    super.statusCode = 500,
  });
}

class NotImplementedException extends AppException {
  const NotImplementedException({
    required super.message,
    super.statusCode = 501,
  });
}

class BadGatewayException extends AppException {
  const BadGatewayException({required super.message, super.statusCode = 502});
}

class ServiceUnavailableException extends AppException {
  const ServiceUnavailableException({
    required super.message,
    super.statusCode = 503,
  });
}

class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({
    required super.message,
    super.statusCode = 504,
  });
}

class SendTimeoutException extends AppException {
  const SendTimeoutException({required super.message, super.statusCode = 504});
}

class ReceiveTimeoutException extends AppException {
  const ReceiveTimeoutException({
    required super.message,
    super.statusCode = 504,
  });
}

class ConnectionErrorException extends AppException {
  const ConnectionErrorException({
    required super.message,
    super.statusCode = 504,
  });
}

class HTTPVersionNotSupportedException extends AppException {
  const HTTPVersionNotSupportedException({
    required super.message,
    super.statusCode = 505,
  });
}

class LoopDetectedException extends AppException {
  const LoopDetectedException({required super.message, super.statusCode = 508});
}

//------------------- Unknown exception -------------------
class UnknownException extends AppException {
  const UnknownException({required super.message});
}
