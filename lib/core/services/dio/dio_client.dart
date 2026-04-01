import 'package:dio/dio.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';

class DioClient {
  const DioClient({required this.appSharedPrefs});
  final AppSharedPrefs appSharedPrefs;

  Dio getDioInstance() {
    final Dio dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        headers: {'accept': 'application/json'},
        baseUrl: EnvConfig.baseApiUrl,
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = appSharedPrefs.get(Constants.token);
          final lang = appSharedPrefs.get(Constants.lang);
          AppDebug.showPrint('token $token');
          AppDebug.showPrint('lang $lang');
          if (lang != null) {
            options.headers['X-Language'] = lang;
          }
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
    return dio;
  }
}
