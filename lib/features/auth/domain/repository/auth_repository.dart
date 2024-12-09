import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:clean_architecture_template/core/commons/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<AppFailure, User>> getCurrentUser();
  Future<Either<AppFailure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<AppFailure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
