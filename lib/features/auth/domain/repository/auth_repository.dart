import 'package:auth_and_clean_arch/core/error/failures.dart';
import 'package:auth_and_clean_arch/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User >> login({
    required String email,
    required String password,
  });
}
