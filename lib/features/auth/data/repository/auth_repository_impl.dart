import 'package:auth_and_clean_arch/core/error/exceptions.dart';
import 'package:auth_and_clean_arch/core/error/failures.dart';
import 'package:auth_and_clean_arch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_and_clean_arch/features/auth/domain/entities/user.dart';
import 'package:auth_and_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login({
    required String email, required String password
    }) async {
    try {
      final user = await remoteDataSource.login(email: email, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
      required String name,
      required String email,
      required String password
    }) async {
    try {
      final user = await remoteDataSource.signUp(
          name: name, email: email, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
