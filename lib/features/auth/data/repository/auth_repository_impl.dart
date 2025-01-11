import 'package:auth_and_clean_arch/core/error/exceptions.dart';
import 'package:auth_and_clean_arch/core/error/failures.dart';
import 'package:auth_and_clean_arch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth_and_clean_arch/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> login(
      {required String name, required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userID = await remoteDataSource.signUp(
          name: name, email: email, password: password);
      return right(userID);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
