import 'package:flutter/foundation.dart';

enum UserType { patient, medicalStaff, vehicleManager }

class UserModel extends ChangeNotifier {
  String? _id;
  String? _name;
  UserType? _userType;

  String? get id => _id;
  String? get name => _name;
  UserType? get userType => _userType;

  void setUser(String id, String name, UserType userType) {
    _id = id;
    _name = name;
    _userType = userType;
    notifyListeners();
  }

  void logout() {
    _id = null;
    _name = null;
    _userType = null;
    notifyListeners();
  }

  bool get isLoggedIn => _id != null;
}