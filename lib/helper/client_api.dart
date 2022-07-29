import 'dart:convert';

import 'package:dio/dio.dart';
import 'app_setting.dart';
import 'device_info.dart';
import 'global.dart';

class ClientApi {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60000,
      receiveTimeout: 90000,
      responseType: ResponseType.plain,
    ),
  );

  ClientApi() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (Response response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          if (e.response != null) {
            final int statusCode = e.response!.statusCode!;
            if (statusCode >= 400 && statusCode <= 499) {
              if (e.response!.data!.toString().contains('invalid_grant')) {
                return handler.reject(DioError(
                  type: DioErrorType.other,
                  error: 'Unauthorized',
                  requestOptions: e.requestOptions,
                ));
              } else {
                return handler.reject(
                  DioError(
                    type: DioErrorType.other,
                    error: json.decode(e.response!.data)['message'],
                    requestOptions: e.requestOptions,
                  ),
                );
              }
            } else if (statusCode >= 500) {
              return handler.reject(
                DioError(
                  type: DioErrorType.other,
                  error: e.message,
                  requestOptions: e.requestOptions,
                ),
              );
            }
          }
          return handler.reject(e);
        },
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers["Authorization"] = 'Bearer ${appData.token}';
          return handler.next(options);
        },
      ),
    );
  }

  getDeviceName() async {
    final deviceInfo = await DeviceInfo.getDeviceDetails();
    return deviceInfo[1] != '' ? deviceInfo[1] : 'Dart (Mobile)';
  }
}
