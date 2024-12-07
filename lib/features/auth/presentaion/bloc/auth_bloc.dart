import 'package:clean_architecture_template/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final SignUpUsecase _signUpUsecase;
  AuthBloc(this._signUpUsecase) : super(AuthInitial()) {
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoading());

      final res = await _signUpUsecase(SignUpUseCaseParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ));

      res.fold((l) => emit(AuthFailure(message: l.message)),
          (r) => emit(AuthSuccess(userId: r)));
    });
  }
}
