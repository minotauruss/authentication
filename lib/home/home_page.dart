
import 'package:authentication/core/auth_manager.dart';
import 'package:authentication/core/cache_manager.dart';
import 'package:authentication/home/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String token = '';

  CacheManager _cacheManager = CacheManager();

  late UserModel? userModel;


  @override
  void initState() {
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${userModel?.name}')),
      body: CircleAvatar(
        backgroundImage: NetworkImage(userModel?.imageUrl ?? ''),
      ),
    );
  }
}