import 'package:cadastro/data/api.dart';
import 'package:cadastro/userMode.dart';

class HomeController {
  final ApiService _apiService = ApiService();

  Future<List<User>> getAllUser() async {
    return await _apiService.getAll("user");
  }

  Future<void> deleteUser(String userId) async {
    await _apiService.delete("user", parameter: {"id": userId});
  }
}
