// ignore_for_file: unused_local_variable, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_cart/models/auth_user_model.dart';
import 'package:open_cart/utils/exceptions.dart';
import 'package:open_cart/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  DateTime? _expiryDate;

  static final AuthorizationProvider _instance =
      AuthorizationProvider.initialise();

  AuthorizationProvider.initialise()
      : _dio = Dio()
          ..interceptors.add(
            LogInterceptor(
              request: true,
              requestBody: true,
              requestHeader: true,
              responseBody: true,
              responseHeader: true,
              error: true,
            ),
          );

  factory AuthorizationProvider() => _instance;
  final Dio _dio;

  Future<AuthUserModel?> signup(String email, String password) async {
    try {
      await _dio.post(registrationUrl, data: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }).then((value) {
        _token = value.data["idToken"];
        _userId = value.data["localId"];
        _expiryDate = DateTime.now()
            .add(Duration(seconds: int.parse(value.data["expiresIn"])));

        return AuthUserModel.fromJson(value.data);
      });
    } on DioError catch (e) {
      final errMessage = await e.response!.data["error"]["message"];
      return errMessage;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token') ||
        !prefs.containsKey('userId') ||
        !prefs.containsKey('dateTime')) {
      return false;
    }
    final userToken = prefs.getString('token');
    final userId = prefs.getString('userId');
    final userdateTime = prefs.getString('dateTime');
    notifyListeners();
    if (userToken != null) {
      prefs.setBool('isLogin', true);
      return true;
    } else {
      prefs.setBool('isLogin', false);
      return false;
    }
  }

  Future<AuthUserModel?> signin(String email, String password) async {
    try {
      await _dio.post(loginUrl, data: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }).then((value) async {
        _token = value.data["idToken"];
        _userId = value.data["localId"];
        _expiryDate = DateTime.now()
            .add(Duration(seconds: int.parse(value.data["expiresIn"])));
        notifyListeners();
        final loginData = await SharedPreferences.getInstance();
        loginData.setString('token', _token.toString());
        loginData.setString('userId', _userId.toString());
        loginData.setString('dateTime', _expiryDate!.toIso8601String());
        return AuthUserModel.fromJson(value.data);
      }).catchError((error) async {
        if (error is DioError) {
          if (error.response!.data["error"] != null) {
            final String errMessage =
                await error.response!.data["error"]["message"];
            throw APIExceptions(msg: errMessage.toString());
          }
        }
      });
      print('token is : $_token');
    } catch (error) {
      rethrow;
    }
  }
}
