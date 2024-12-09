import 'package:clean_architecture_template/core/error/app_exeption.dart';
import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/data/models/usermodel.dart';
import 'package:clean_architecture_template/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<AppFailure, UserModel>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userModel = await authRemoteDataSource.signUpWithEmailPassword(
          email: email, password: password, name: name);
      return Right(userModel);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, UserModel>> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final userModel = await authRemoteDataSource.signInWithEmailPassword(
          email: email, password: password);

      return Right(userModel);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, UserModel>> getCurrentUser() async {
    try {
      final userModel = await authRemoteDataSource.getCurrentUser();

      if (userModel == null) {
        throw const AppExeption('User is null!');
      }
      return Right(userModel);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
