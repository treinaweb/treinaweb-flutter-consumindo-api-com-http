import 'package:cadastro/data/api.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroController {
  final ApiService _apiService = ApiService();

  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<void> addUser({required BuildContext context}) async {
    final isTrue = await _apiService.post("user",
        data: {"name": nameController.text, "idade": idadeController.text});

    if (isTrue) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final user = await _apiService.getFind("user", id: userId);

      nameController.text = user.nome;
      idadeController.text = user.idade.toString();
      return user;
    } else {
      return User(nome: "", idade: 0);
    }
  }

  Future<void> editUser(
      {required String userId, required BuildContext context}) async {
    final isTrue = await _apiService.put(
      "user",
      data: {"name": nameController.text, "idade": idadeController.text},
      parameter: {"id": userId},
    );

    if (isTrue) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }
}
