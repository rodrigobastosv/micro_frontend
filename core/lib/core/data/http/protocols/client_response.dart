class ClientResponse {
  ClientResponse({
    required this.data,
    required this.statusCode,
  });

  final dynamic data;
  final int statusCode;
}