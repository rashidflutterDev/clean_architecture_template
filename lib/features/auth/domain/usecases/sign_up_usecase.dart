import 'package:clean_architecture_template/features/auth/domain/usecases/entities/repositories/auth_remote_repository.dart';
import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:clean_architecture_template/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUsecase implements UseCase<String, SignUpUseCaseParams> {
  final AuthRepository authRepository;

  SignUpUsecase({required this.authRepository});

  @override
  Future<Either<AppFailure, String>> call(SignUpUseCaseParams params) async {
    return await authRepository.signUpWithEmailPassword(
        email: params.email, password: params.password, name: params.name);
  }
}

class SignUpUseCaseParams {
  final String email;
  final String password;
  final String name;
  SignUpUseCaseParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
