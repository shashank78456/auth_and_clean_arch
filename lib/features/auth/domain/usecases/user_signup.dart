import 'package:auth_and_clean_arch/core/error/failures.dart';
import 'package:auth_and_clean_arch/core/usecases/usecases.dart';
import 'package:auth_and_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  final AuthRepository authRepository;
  const UserSignup(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
    return await authRepository.signUp(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignupParams {
  final String name;
  final String email;
  final String password;

  UserSignupParams(
      {required this.name, required this.email, required this.password});
}
