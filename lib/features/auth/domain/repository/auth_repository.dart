import 'package:auth_and_clean_arch/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> login({
    required String name,
    required String email,
    required String password,
  });
}
