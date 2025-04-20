import '../../model/user_model.dart';
import '../model_repository.dart';

class UserRepository implements ModelRepository<UserModel> {
  final Map<String, UserModel> _userMap = {};

  @override
  void add(UserModel object) {
    _userMap[object.id] = object;
  }

  @override
  void clear() {
    _userMap.clear();
  }

  @override
  void remove(UserModel object) {
    _userMap.remove(object.id);
  }

  @override
  void update(UserModel object) {
    _userMap[object.id] = object;
  }

  @override
  UserModel? findById(String id) {
    return _userMap[id];
  }
}
