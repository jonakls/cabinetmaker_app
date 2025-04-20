import 'model.dart';

class UserModel implements Model {
  final String _id;
  String _name;
  String _email;
  String _password;
  String _phone;
  String _address;
  String _city;

  UserModel({
    required String id,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String city,
  }) : _id = id,
       _name = name,
       _email = email,
       _password = password,
       _phone = phone,
       _address = address,
       _city = city;

  UserModel.randomId({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String city,
  }) : _id = DateTime.now().millisecondsSinceEpoch.toString(),
       _name = name,
       _email = email,
       _password = password,
       _phone = phone,
       _address = address,
       _city = city;

  @override
  String get id => _id;

  String get name => _name;

  String get email => _email;

  String get password => _password;

  String get phone => _phone;

  String get address => _address;

  String get city => _city;

  set name(String name) => _name = name;

  set email(String email) => _email = email;

  set password(String password) => _password = password;

  set phone(String phone) => _phone = phone;

  set address(String address) => _address = address;

  set city(String city) => _city = city;

  @override
  String toString() {
    return 'UserModel{id: $_id, name: $_name, email: $_email, password: $_password, phone: $_phone, address: $_address, city: $_city}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is! UserModel) return false;

    return _id == other._id &&
        _name == other._name &&
        _email == other._email &&
        _password == other._password &&
        _phone == other._phone &&
        _address == other._address &&
        _city == other._city;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _name.hashCode ^
        _email.hashCode ^
        _password.hashCode ^
        _phone.hashCode ^
        _address.hashCode ^
        _city.hashCode;
  }
}
