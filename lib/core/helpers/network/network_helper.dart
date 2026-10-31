import 'package:dio/dio.dart';
import 'package:e_commerce/core/helpers/network/api_const.dart';

class NetworkHelper {
  static late Dio _dio;

  // Initialize Dio with the base URL and default headers for API requests.
  static void intitalDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        headers: {"Content-Type": "application/json", "Accept-Language": "en"},
      ),
    );
  }

  // HTTP methods : Get - post - patch - delete - put
  // GET: Fetch data from the server.
  // POST: Send new data to the server.
  // PUT: Replace existing data completely.
  // PATCH: Update specific fields of existing data.
  // DELETE: Delete data from the server.

  // Sends a GET request to the API and returns the server response
  static Future<Response> getData({required String path}) async {
    final response = await _dio.get(path);
    return response;
  }

  // Sends a POST request with optional body data and returns the server response
  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.post(path, data: body);
    return response;
  }

  // PUT: Replace existing data completely.
  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.put(path, data: body);
    return response;
  }

  // PATCH: Update specific fields of existing data.
  static Future<Response> patchData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.patch(path, data: body);
    return response;
  }

  // DELETE: Delete data from the server.
  static Future<Response> deleteData({required String path}) async {
    final response = await _dio.delete(path);
    return response;
  }
}
