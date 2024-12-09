import 'package:clean_architecture_template/core/error/app_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<AppFailure, SuccessType>> call(Params params);
}

class NoParams {}
