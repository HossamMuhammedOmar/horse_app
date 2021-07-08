import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static final path = 'https://alasakerhorse.com/api/';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: path,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required data,
    String? token,
    Options? options,
  }) async {
    // dio!.options.contentType = 'multipart/form-data';
    dio!.options.contentType = 'multipart/form-data';
    return dio!.put(
      url,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? ' ',
    };
    return await dio!.get(url);
  }

  static Future<Response> deleteData({
    required url,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio!.delete(url);
  }
}
