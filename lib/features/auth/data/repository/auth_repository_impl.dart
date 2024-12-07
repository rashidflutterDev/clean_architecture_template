import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/entities/repositories/auth_remote_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<AppFailure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailPassword(
          email: email, password: password, name: name);
      return Right(userId);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, String>> signInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }
}
