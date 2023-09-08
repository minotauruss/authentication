
import 'package:authentication/home/model/user_model.dart';
import 'package:flutter/material.dart';


import 'cache_manager.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;
  
  UserModel? model;

  void removeAllData() {}


  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}