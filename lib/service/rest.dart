import 'dart:convert';
import 'package:http/http.dart' as http;

class Rest {
  final _baseUrl = "10.0.2.2:3002";
  final header = {"Content-Type": "application/json"};

  Future<http.Response> post(path, {required Map<String, Object?> data}) async {
    final url = Uri.http(_baseUrl, "/api/$path");

    return await http.post(
      url,
      body: jsonEncode(data),
      headers: header,
    );
  }

  Future<http.Response> get(String path, {Map<String, dynamic>? params}) async {
    final url = Uri.http(_baseUrl, "/api/$path", params);

    return await http.get(
      url,
      headers: header,
    );
  }

  Future<http.Response> put(
    String path, {
    required Map<String, Object?> data,
    Map<String, dynamic>? parameter,
  }) async {
    final url = Uri.http(_baseUrl, "/api/$path", parameter);

    return await http.put(
      url,
      body: jsonEncode(data),
      headers: header,
    );
  }

  Future<http.Response> delete(String path,
      {Map<String, Object?>? parameter}) async {
    final url = Uri.http(_baseUrl, "/api/$path", parameter);

    return await http.delete(
      url,
      headers: header,
    );
  }
}
