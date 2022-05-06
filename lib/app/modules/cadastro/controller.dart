import 'package:cadastro/repository/user_repository.dart';
import 'package:cadastro/repository/user_repository_interface.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroController {
  final IUserRepository _userRepository = UserRepository();

  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<bool> addUser({required BuildContext context}) async {
    return await _userRepository.postUser(
        data: {"name": nameController.text, "idade": idadeController.text});
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final user = await _userRepository.getFindUser(id: userId);

      nameController.text = user.nome;
      idadeController.text = user.idade.toString();
      return user;
    } else {
      return User(nome: "", idade: 0);
    }
  }

  Future<bool> editUser(
      {required String userId, required BuildContext context}) async {
    return await _userRepository.putUser(
      data: {"name": nameController.text, "idade": idadeController.text},
      id: userId,
    );
  }

  Future<void> saveUser(String? userId, {required BuildContext context}) async {
    var isTrue = false;

    if (userId == null) {
      isTrue = await addUser(context: context);
    } else {
      isTrue = await editUser(userId: userId, context: context);
    }

    if (isTrue) {
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    }
  }
}
