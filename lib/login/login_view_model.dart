
import 'package:authentication/core/auth_manager.dart';
import 'package:authentication/core/cache_manager.dart';
import 'package:authentication/home/home_page.dart';
import 'package:authentication/home/model/user_model.dart';
import 'package:authentication/login/model/user_request_model.dart';
import 'package:authentication/login/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  late final LoginService loginService;

  final _baseUrl = 'https://reqres.in';

  final CacheManager  _cacheManager = CacheManager ();

  @override
  void initState() {
    super.initState();
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));

    dio.interceptors.add(PrettyDioLogger());
    
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService.fetchLogin(UserRequestModel(email: email, password: password));

    if (response != null) {
     _cacheManager.saveToken(response.token ?? '');
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
  }
}