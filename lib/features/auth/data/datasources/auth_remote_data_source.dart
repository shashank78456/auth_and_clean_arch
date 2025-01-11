import 'dart:convert';

import 'package:auth_and_clean_arch/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<String> login({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> login(
      {required String name, required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await http.get(Uri.parse("uri"));
      final responseData = json.decode(response.body);
      return responseData;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
