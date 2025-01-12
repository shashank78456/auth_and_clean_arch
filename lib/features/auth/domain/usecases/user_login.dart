// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth_and_clean_arch/core/error/failures.dart';
import 'package:auth_and_clean_arch/core/usecases/usecases.dart';
import 'package:auth_and_clean_arch/features/auth/domain/entities/user.dart';
import 'package:auth_and_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository); 

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    ); 
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
