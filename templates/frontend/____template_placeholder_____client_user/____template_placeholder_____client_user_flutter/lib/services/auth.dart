import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:____template_placeholder_____client_user_flutter/proto/api-gateway.pbgrpc.dart';
import 'package:____template_placeholder_____client_user_flutter/proto/authentication-user.pb.dart';
import 'package:____template_placeholder_____client_user_flutter/services/grpc.dart';
import 'package:____template_placeholder_____client_user_flutter/proto/models/user.pb.dart';

class Auth {
  static final _instance = Auth._internal();
  static final _grpcChannel = Grpc().getClientChannel();
  static final _loggedInStreamController = StreamController<bool>();
  static User _user;
  static String _token;
  static bool _loggedIn;

  factory Auth() {
    return _instance;
  }

  Auth._internal() {
    _init();
  }

  Future<void> _init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final serializedUser = sharedPreferences.getString('user') ?? '';
    final token = sharedPreferences.getString('token') ?? '';
    if (serializedUser != '' && token != '') {
      _user = User();
      _user.mergeFromJson(serializedUser);
      _token = token;
      _loggedIn = true;
      print(_user.firstName);
    }
  }

  Stream<bool> authStateChanges() => _loggedInStreamController.stream;

  User getUser() {
    if (_loggedIn != null && _user != null) {
      return _user;
    }
    return null;
  }

  String getToken() {
    if (_loggedIn != null && _token != null) {
      return _token;
    }
    return null;
  }

  Future<bool> login(String email, String password) async {
    final client = ApiGatewayClient(_grpcChannel);
    final request = LoginRequest();
    request.email = email;
    request.password = password;
    final response = await client.loginUser(request);
    _user = response.user;
    _user.id = '0';
    _token = response.jwt;
    _loggedIn = true;
    final sharedPreferences = await SharedPreferences.getInstance();
    final serializedUser = _user.writeToJson();
    await sharedPreferences.setString('user', serializedUser);
    await sharedPreferences.setString('token', _token);
    _loggedInStreamController.add(true);
    print('${_user.firstName} $_token');
    return true;
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    _loggedIn = false;
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('user');
    await sharedPreferences.remove('token');
    _loggedInStreamController.add(false);
  }
}
