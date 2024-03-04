import 'package:dio/dio.dart';
import 'package:shoe_app/services/handling_exceptions.dart';

import '../consts/enums.dart';

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;


  static Dio createDio() {
    var dio = Dio(BaseOptions(
      receiveTimeout: const Duration(milliseconds: 20000), // 20 seconds
      connectTimeout: const Duration(milliseconds: 20000),
      sendTimeout: const Duration(milliseconds: 20000),
    ));
    return dio;
  }

  Options options = Options(headers: header);

  Future<Response> apiCall(String url, Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body, RequestType requestType) async {
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            return await dio.get(url,
                queryParameters: queryParameters, options: options);
          }
        case RequestType.POST:
          return await dio.post(url, options: options, data: body);
        case RequestType.DELETE:
          return await dio.delete(url, options: options, data: body);
      }
    } on ApiException catch (error) {
      throw ApiException.fromDioError(DioException(
        error: error.toString(),
        requestOptions: RequestOptions(path: url),
      ));
    }
  }
}


final Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  // 'Authorization': "bearer ${KNetwork.token}"
};
