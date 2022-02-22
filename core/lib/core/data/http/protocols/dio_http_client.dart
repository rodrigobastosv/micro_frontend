import 'package:dio/dio.dart';

import '../http_constants.dart';
import 'protocols.dart';

class DioHttpClient implements HttpClient {
  DioHttpClient(this._client);

  final Dio _client;

  @override
  Future<ClientResponse> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final httpMethod = method.toUpperCase();
    switch (httpMethod) {
      case HTTP_POST:
        return _post(
          url,
          body: body,
          headers: headers,
          queryParameters: queryParameters,
        );
      case HTTP_PUT:
        return _put(
          url,
          body: body,
          headers: headers,
          queryParameters: queryParameters,
        );
      case HTTP_PATCH:
        return _patch(
          url,
          body: body,
          headers: headers,
          queryParameters: queryParameters,
        );
      case HTTP_DELETE:
        return _delete(
          url,
          headers: headers,
          queryParameters: queryParameters,
        );
      default:
        return _get(
          url,
          headers: headers,
          queryParameters: queryParameters,
        );
    }
  }

  Future<ClientResponse> _post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: _getHeaders(headers),
      ),
    );
    return response.toClientResponse();
  }

  Future<ClientResponse> _get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response.toClientResponse();
  }

  Future<ClientResponse> _delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.delete(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: _getHeaders(headers),
      ),
    );
    return response.toClientResponse();
  }

  Future<ClientResponse> _put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: _getHeaders(headers),
      ),
    );
    return response.toClientResponse();
  }

  Future<ClientResponse> _patch(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client.patch(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: _getHeaders(headers),
      ),
    );
    return response.toClientResponse();
  }

  Map<String, String> _getHeaders(Map<String, String>? headers) {
    return headers != null ? headers : {};
  }
}

extension ClientResponseExt on Response {
  ClientResponse toClientResponse() {
    return ClientResponse(
      data: data,
      statusCode: statusCode!,
    );
  }
}
