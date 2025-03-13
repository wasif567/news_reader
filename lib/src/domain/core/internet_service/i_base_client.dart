import 'package:http/http.dart';

abstract class IBaseClient {
  Future<Response> get(String url);

  Future<Response> post(String url, {required Map<String, dynamic> body});
}
