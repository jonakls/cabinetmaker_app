import 'package:cabinetmaker_app/common/model_repository.dart';
import 'package:cabinetmaker_app/common/storage/user_repository.dart';
import 'package:cabinetmaker_app/model/user_model.dart';

class AccountService {
  final ModelRepository<UserModel> _userRepository = UserRepository();
  bool _isLoggedIn = false;

  void addUser(UserModel user) {
    _userRepository.add(user);
  }

  void removeUser(UserModel user) {
    _userRepository.remove(user);
  }

  Future<UserModel?> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    UserModel? user = _userRepository.findById(email);

    if (user != null && user.password == password) {
      _isLoggedIn = true;
      return user;
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    _isLoggedIn = false;
  }

  Future<UserModel?> register(
    String name,
    String email,
    String password,
    String phone,
    String address,
    String city,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    if (_userRepository.findById(email) != null) {
      return null; // Usuario ya existe
    }

    UserModel newUser = UserModel.randomId(
      name: name,
      email: email,
      password: password,
      phone: phone,
      address: address,
      city: city,
    );
    _userRepository.add(newUser);
    return newUser;
  }

  bool isLoggedIn() {
    return _isLoggedIn;
  }

  void clear() {
    _userRepository.clear();
  }
}
