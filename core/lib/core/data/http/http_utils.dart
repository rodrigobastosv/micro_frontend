import 'http.dart';

bool isSuccessCode(int? code) =>
    code != null && code >= HTTP_OK && code <= HTTP_NO_CONTENT;
