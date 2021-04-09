import 'package:flutter_app/models/User.dart';

abstract class BaseAuth{
  User get currentUser;
  Future<User> login();
}