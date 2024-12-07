import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<AppFailure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<AppFailure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
