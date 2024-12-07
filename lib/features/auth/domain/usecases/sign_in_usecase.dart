import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:clean_architecture_template/core/usecase/usecase.dart';
import 'package:clean_architecture_template/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCase implements UseCase<String, SignInUseCaseParams> {
  final AuthRepository authRepository;
  SignInUseCase({required this.authRepository});
  @override
  Future<Either<AppFailure, String>> call(SignInUseCaseParams params) async {
    return await authRepository.signInWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class SignInUseCaseParams {
  final String email;
  final String password;
  SignInUseCaseParams({
    required this.email,
    required this.password,
  });
}
