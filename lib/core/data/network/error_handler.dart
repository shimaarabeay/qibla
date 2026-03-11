
import 'package:qibla/generated/locale_keys.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return Failure(LocaleKeys.DEFAULT.tr());
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(LocaleKeys.CONNECT_TIMEOUT.tr());
      case DioExceptionType.sendTimeout:
        return Failure(LocaleKeys.SEND_TIMEOUT.tr());
      case DioExceptionType.receiveTimeout:
        return Failure(LocaleKeys.RECEIVE_TIMEOUT.tr());
      case DioExceptionType.badCertificate:
        return Failure("Bad certificate from server");
      case DioExceptionType.cancel:
        return Failure(LocaleKeys.CANCEL.tr());
      case DioExceptionType.connectionError:
        return Failure(LocaleKeys.NO_INTERNET_CONNECTION.tr());
      case DioExceptionType.badResponse:
        return _handleResponse(
          error.response?.statusCode,
          error.response?.data,
        );
      case DioExceptionType.unknown:
      return Failure(LocaleKeys.DEFAULT.tr());
    }
  }

  static Failure _handleResponse(int? statusCode, dynamic data) {
    if (statusCode == null) {
      return Failure(LocaleKeys.DEFAULT.tr());
    }

    final message = _extractMessage(data).isNotEmpty
        ? _extractMessage(data)
        : LocaleKeys.DEFAULT.tr();

    switch (statusCode) {
      case 400:
      case 403:
      case 409:
        return Failure(message, code: statusCode);

      case 401:
        return Failure(LocaleKeys.UNAUTHORIZED.tr(), code: statusCode);

      case 404:
        return Failure(LocaleKeys.NOT_FOUND.tr(), code: statusCode);

      case 500:
        return Failure(
          LocaleKeys.INTERNAL_SERVER_ERROR.tr(),
          code: statusCode,
        );

      default:
        return Failure("$message ($statusCode)", code: statusCode);
    }
  }

  static String _extractMessage(dynamic data) {
    if (data is! Map) return '';

    const keys = <String>[
      'returnMsg',
      'returnMessage',
      'message',
    ];

    for (final key in keys) {
      final value = data[key];
      if (value == null) continue;

      final msg = value.toString().trim();
      if (msg.isNotEmpty) return msg;
    }

    return '';
  }

}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 200; // failure, API rejected request
  static const int FORBIDDEN = 403; // failure, API rejected request
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  static const int NOT_FOUND = 404; // failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
}