import 'dart:convert';

import 'package:cadastro/userMode.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final _baseUrl = "10.0.2.2:3002";
  final header = {"Content-Type": "application/json"};

  Future<bool> post(path, {required Map<String, Object?> data}) async {
    final url = Uri.http(_baseUrl, "/api/$path");

    final response = await http.post(
      url,
      body: jsonEncode(data),
      headers: header,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<User>> getAll(String path) async {
    final url = Uri.http(_baseUrl, "/api/$path");

    final response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      final user = data.map((json) => User.fromJson(json)).toList();

      print(data);

      return user;
    }

    return [];
  }

  Future<User> getFind(String path, {required String id}) async {
    final url = Uri.http(_baseUrl, "/api/$path", {"id": id});
    final response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(data);

      return user;
    }

    return User(nome: "", idade: 0);
  }

  Future<bool> put(
    String path, {
    required Map<String, Object?> data,
    Map<String, dynamic>? parameter,
  }) async {
    final url = Uri.http(_baseUrl, "/api/$path", parameter);

    final response = await http.put(
      url,
      body: jsonEncode(data),
      headers: header,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> delete(String path, {Map<String, Object?>? parameter}) async {
    final url = Uri.http(_baseUrl, "/api/$path", parameter);

    await http.delete(
      url,
      headers: header,
    );
  }
}
