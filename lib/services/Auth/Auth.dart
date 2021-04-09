import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/services/Auth/BaseAuth.dart';
import 'package:http/http.dart' as http;

class Auth extends BaseAuth{
  final String _baseURL = "https://api.mixcloud.com/spartacus/";

  @override
  // TODO: implement currentUser
  User get currentUser => throw UnimplementedError();

  @override
  // ignore: missing_return
  Future<User> login() async {
    try{
      final http.Response response = await http.get(_baseURL);
      print(jsonDecode(response.body).toString());
      if(response.statusCode == 200){
        return User.fromJson(jsonDecode(response.body));
      }
      else{
        return User();
      }
    }
    catch (e){
      print(e);
    }
  }

}