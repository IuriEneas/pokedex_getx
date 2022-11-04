import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String delete = 'DELETE';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
}

class HttpManager {
  Future<Map<String, dynamic>> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: HttpMethods.get,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      return e.response?.data ?? {};
    } catch (e) {
      return {};
    }
  }
}
