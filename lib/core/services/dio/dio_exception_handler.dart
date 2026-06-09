import 'package:dio/dio.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/l10n/app_l10n.dart';

abstract interface class DioExceptionHandler {
  static AppException handle(DioException e) {
    final currentContext = AppL10n.current;
    return switch (e.type) {
      DioExceptionType.connectionTimeout => ConnectionTimeoutException(
        message: currentContext!.connection_timeout,
      ),
      DioExceptionType.sendTimeout => SendTimeoutException(
        message: currentContext!.send_timeout,
      ),
      DioExceptionType.receiveTimeout => ReceiveTimeoutException(
        message: currentContext!.receive_timeout,
      ),
      DioExceptionType.badCertificate => BadCertificateException(
        message: currentContext!.bad_certificate,
      ),
      DioExceptionType.badResponse => handleBadResponse(e),
      DioExceptionType.cancel => CancelledException(
        message: currentContext!.cancel,
      ),
      DioExceptionType.connectionError => ConnectionErrorException(
        message: currentContext!.no_internet_connection,
      ),
      DioExceptionType.unknown => UnknownException(
        message: currentContext!.unknown_error,
      ),
    };
  }

  static AppException handleBadResponse(DioException e) {
    final currentContext = AppL10n.current;
    return switch (e.response?.statusCode) {
      // Client side exceptions
      401 => UnauthorizedException(message: currentContext!.unauthorized),
      402 => PaymentRequiredException(
        message: currentContext!.payment_required,
      ),
      403 => ForbiddenException(message: currentContext!.forbidden),
      404 => NotFoundException(message: currentContext!.not_found),
      405 => MethodNotAllowedException(
        message: currentContext!.method_not_allowed,
      ),
      406 => NotAcceptableException(message: currentContext!.not_acceptable),
      407 => ProxyAuthenticationRequiredException(
        message: currentContext!.proxy_auth_required,
      ),
      408 => RequestTimeoutException(message: currentContext!.request_timeout),
      409 => ConflictException(message: currentContext!.conflict),
      422 => UnprocessableEntityException(
        message: currentContext!.unprocessable_entity,
      ),
      // Server side exceptions
      500 => InternalServerErrorException(
        message: currentContext!.internal_server_error,
      ),
      501 => NotImplementedException(message: currentContext!.not_implemented),
      502 => BadGatewayException(message: currentContext!.bad_gateway),
      503 => ServiceUnavailableException(
        message: currentContext!.service_unavailable,
      ),
      505 => HTTPVersionNotSupportedException(
        message: currentContext!.http_version_not_supported,
      ),
      508 => LoopDetectedException(message: currentContext!.loop_detected),
      // Unknown exception
      _ => UnknownException(message: currentContext!.unknown_error),
    };
  }
}
