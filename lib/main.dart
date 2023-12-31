
import 'package:authentication/core/auth_manager.dart';
import 'package:authentication/splash/splah_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/login.dart';

void main() => runApp(MultiProvider(
      providers: [
        Provider<AuthenticationManager>(
          create: (context) => AuthenticationManager(context: context),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashView(),
    );
  }
}