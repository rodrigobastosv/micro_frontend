import 'package:core/core/data/http/protocols/protocols.dart';

abstract class HttpClient {
  Future<ClientResponse> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
