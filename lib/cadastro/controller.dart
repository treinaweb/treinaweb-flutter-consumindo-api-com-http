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
}
