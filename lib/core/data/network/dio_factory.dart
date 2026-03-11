import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import 'package:qibla/core/app/app_prefs.dart';
import 'package:qibla/core/app/constants.dart';
import 'package:qibla/core/app/end_points/end_points.dart';

const String APPLICATION_JSON = "application/json;charset=utf-8";
const String CONTENT_TYPE = "Content-Type";
const String AUTHORIZATION = "authorization";

class DioFactory {
  final AppPreferences _appPreferences;

  Dio? _dio;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    if (_dio != null) return _dio!;

    final dio = Dio();

    final token = await _appPreferences.getUserToken();
    dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      headers: _buildHeaders(token),
      connectTimeout: Constants.apiTimeOut,
      receiveTimeout: Constants.receiveTimeout,
      sendTimeout: Constants.sendTimeout,
    );

    _addRetryInterceptor(dio);
    _addLoggerInterceptor(dio);

    _dio = dio;
    return dio;
  }

  Map<String, String> _buildHeaders(String token) {
    final headers = <String, String>{
      CONTENT_TYPE: APPLICATION_JSON,
    };

    // ✅ ما تبعتش Bearer لو فاضي
    if (token.trim().isNotEmpty) {
      headers[AUTHORIZATION] = '${Constants.bearer}$token';
    }

    return headers;
  }

  void _addRetryInterceptor(Dio dio) {
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: kDebugMode ? print : null,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 4),
        ],
        retryEvaluator: (error, attempt) {
          final req = error.requestOptions;

          // ❌ لا نعيد في حالة cancel
          if (error.type == DioExceptionType.cancel) return false;

          // ✅ نفضل نعمل retry للـ GET فقط افتراضيًا
          // (غير كده ممكن يعمل duplicate create)
          final method = req.method.toUpperCase();
          final isSafeMethod = method == 'GET' || method == 'HEAD';
          if (!isSafeMethod) return false;

          // ✅ أخطاء الشبكة والـ timeouts
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.connectionError) {
            return true;
          }

          // ✅ لو السيرفر رجّع response
          final status = error.response?.statusCode;

          // 5xx: مشاكل سيرفر
          if (status != null && status >= 500) return true;

          // 429: rate limit (ممكن يستفيد من retry)
          if (status == 429) return true;

          // ❌ 4xx غالبًا مشكلة user/auth/validation
          return false;
        },

      ),
    );
  }

  void _addLoggerInterceptor(Dio dio) {
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true, // انت ممكن تقفلها لو كبيرة
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }
}
