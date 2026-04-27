import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/dio/dio_exception_handler.dart';
import 'package:kianja/core/utils/app_debug.dart';

Future<T> requestHandler<T>(Future<T> Function() requestBody) async {
  try {
    return await requestBody();
  } on DioException catch (e) {
    AppDebug.showPrint('Request Handler Exception - ${e.toString()}');
    throw DioExceptionHandler.handle(e);
  }
}

Map<String, dynamic> jsonSimpleDecode(dynamic data) {
  if (data is String) {
    return jsonDecode(data);
  } else {
    return data;
  }
}

Map<String, dynamic> jsonHandler(dynamic data) {
  final Map<String, dynamic> result = jsonSimpleDecode(data);
  try {
    final int status = result['status'] ?? 0;
    final int statusCode = result['statusCode'] ?? 0;
    if (status == 0 && statusCode == 200) {
      // throw const ServerException(message: 'Bad request');
    }
    if (status == 0 && statusCode == 401) {
      throw const UnauthorizedException(message: 'Unauthorized');
    }
    if (status == 0 && statusCode == 404) {
      throw const NotFoundException(message: 'Not found');
    }
    return result['data'];
  } on DioException catch (e) {
    AppDebug.showPrint('Json Handler Exception - ${e.toString()}');
    throw DioExceptionHandler.handle(e);
  }
}

Failure failureHandler(AppException e) {
  return switch (e) {
    // Client side exceptions
    UnauthorizedException() => UnauthorizedFailure(message: e.message),
    PaymentRequiredException() => PaymentRequiredFailure(message: e.message),
    ForbiddenException() => ForbiddenFailure(message: e.message),
    NotFoundException() => NotFoundFailure(message: e.message),
    MethodNotAllowedException() => MethodNotAllowedFailure(message: e.message),
    NotAcceptableException() => NotAcceptableFailure(message: e.message),
    ProxyAuthenticationRequiredException() =>
      ProxyAuthenticationRequiredFailure(message: e.message),
    RequestTimeoutException() => RequestTimeoutFailure(message: e.message),
    ConflictException() => ConflictFailure(message: e.message),
    CancelledException() => CancelledFailure(message: e.message),
    BadCertificateException() => BadCertificateFailure(message: e.message),
    // Server side exceptions
    InternalServerErrorException() => InternalServerErrorFailure(
      message: e.message,
    ),
    NotImplementedException() => NotImplementedFailure(message: e.message),
    BadGatewayException() => BadGatewayFailure(message: e.message),
    ServiceUnavailableException() => ServiceUnavailableFailure(
      message: e.message,
    ),
    ConnectionTimeoutException() => ConnectionTimeoutFailure(
      message: e.message,
    ),
    SendTimeoutException() => SendTimeoutFailure(message: e.message),
    ReceiveTimeoutException() => ReceiveTimeoutFailure(message: e.message),
    ConnectionErrorException() => ConnectionErrorFailure(message: e.message),
    HTTPVersionNotSupportedException() => HTTPVersionNotSupportedFailure(
      message: e.message,
    ),
    LoopDetectedException() => LoopDetectedFailure(message: e.message),
    // Unknown exception
    UnknownException() => UnknownFailure(message: e.message),
    _ => UnknownFailure(message: e.message),
  };
}
