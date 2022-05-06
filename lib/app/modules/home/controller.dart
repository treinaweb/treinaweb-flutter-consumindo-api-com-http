import 'package:cadastro/repository/user_repository.dart';
import 'package:cadastro/repository/user_repository_interface.dart';
import 'package:cadastro/userMode.dart';

class HomeController {
  final IUserRepository _userRepository = UserRepository();

  Future<List<User>> getAllUser() async {
    return await _userRepository.getAll();
  }

  Future<void> deleteUser(String userId) async {
    await _userRepository.deleteUser(id: userId);
  }
}
