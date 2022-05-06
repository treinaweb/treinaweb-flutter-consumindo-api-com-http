import 'dart:convert';

import 'package:cadastro/repository/user_repository_interface.dart';
import 'package:cadastro/service/rest.dart';
import 'package:cadastro/userMode.dart';

class UserRepository implements IUserRepository {
  final Rest _rest = Rest();

  @override
  Future<void> deleteUser({required String id}) async {
    await _rest.delete("user", parameter: {"id": id});
  }

  @override
  Future<User> getFindUser({required String id}) async {
    final response = await _rest.get("user", params: {"id": id});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final user = User.fromJson(data);

      return user;
    }

    return User(nome: "", idade: 0);
  }

  @override
  Future<bool> postUser({required Map<String, Object?> data}) async {
    final response = await _rest.post("user", data: data);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> putUser(
      {required Map<String, Object?> data, required String id}) async {
    final response = await _rest.put("user", data: data, parameter: {"id": id});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<User>> getAll() async {
    final response = await _rest.get("user");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final listUser = data.map((json) => User.fromJson(json)).toList();

      return listUser;
    } else {
      return [];
    }
  }
}
