import 'package:dio/dio.dart';
import 'package:kianja/core/errors/exceptions.dart';

abstract interface class DioExceptionHandler {
  static AppException handle(DioException e) {
    return switch (e.type) {
      DioExceptionType.connectionTimeout => const ConnectionTimeoutException(
        message: 'Connection timeout',
      ),
      DioExceptionType.sendTimeout => const SendTimeoutException(
        message: 'Send timeout',
      ),
      DioExceptionType.receiveTimeout => const ReceiveTimeoutException(
        message: 'Receive timeout',
      ),
      DioExceptionType.badCertificate => const BadCertificateException(
        message: 'Bad certificate',
      ),
      DioExceptionType.badResponse => handleBadResponse(e),
      DioExceptionType.cancel => const CancelledException(
        message: 'Request cancelled',
      ),
      DioExceptionType.connectionError => const ConnectionErrorException(
        message: 'No internet connection',
      ),
      DioExceptionType.unknown => const UnknownException(
        message: 'Unknown error',
      ),
    };
  }

  static AppException handleBadResponse(DioException e) {
    return switch (e.response?.statusCode) {
      // Client side exceptions
      401 => const UnauthorizedException(message: 'Unauthorized'),
      402 => const PaymentRequiredException(message: 'Payment required'),
      403 => const ForbiddenException(message: 'Forbidden'),
      404 => const NotFoundException(message: 'Not found'),
      405 => const MethodNotAllowedException(message: 'Method not allowed'),
      406 => const NotAcceptableException(message: 'Not acceptable'),
      407 => const ProxyAuthenticationRequiredException(
        message: 'Proxy authentication required',
      ),
      408 => const RequestTimeoutException(message: 'Request timeout'),
      409 => const ConflictException(message: 'Conflict'),
      // Server side exceptions
      500 => const InternalServerErrorException(
        message: 'Internal server error',
      ),
      501 => const NotImplementedException(message: 'Not implemented'),
      502 => const BadGatewayException(message: 'Bad gateway'),
      503 => const ServiceUnavailableException(message: 'Service unavailable'),
      505 => const HTTPVersionNotSupportedException(
        message: 'HTTP version not supported',
      ),
      508 => const LoopDetectedException(message: 'Loop detected'),
      // Unknown exception
      _ => const UnknownException(message: 'Unknown error'),
    };
  }
}
