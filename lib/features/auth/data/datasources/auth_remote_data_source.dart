import 'dart:convert';

import 'package:auth_and_clean_arch/core/error/exceptions.dart';
import 'package:auth_and_clean_arch/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login({
    required String email,
    required String password
  }) async {
    try {
      final response = await http.get(Uri.parse("uri"));
      final responseData = json.decode(response.body);

      if(responseData.user == null) {
        throw const ServerException("User is null");
      }

      return UserModel.fromJson(responseData.user);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp({
      required String name,
      required String email,
      required String password
    }) async {
    try {
      final response = await http.get(Uri.parse("uri"));
      final responseData = json.decode(response.body);
      
      if(responseData.user == null) {
        throw const ServerException("User is null");
      }

      return UserModel.fromJson(responseData.user);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
