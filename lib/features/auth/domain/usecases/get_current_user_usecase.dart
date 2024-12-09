import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:clean_architecture_template/core/usecase/usecase.dart';
import 'package:clean_architecture_template/core/commons/entities/user.dart';
import 'package:clean_architecture_template/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentUserUsecase implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUserUsecase({required this.authRepository});
  @override
  Future<Either<AppFailure, User>> call(NoParams params) async {
    return await authRepository.getCurrentUser();
  }
}
