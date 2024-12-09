import 'package:clean_architecture_template/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_template/core/usecase/usecase.dart';
import 'package:clean_architecture_template/core/commons/entities/user.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final SignUpUsecase _signUpUsecase;
  final SignInUseCase _signInUseCase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUsecase signUpUseCase,
    required GetCurrentUserUsecase getCurrentUserUsecase,
    required AppUserCubit appUserCubit,
  })  : _signUpUsecase = signUpUseCase,
        _signInUseCase = signInUseCase,
        _getCurrentUserUsecase = getCurrentUserUsecase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    //  event
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoading());

      final res = await _signUpUsecase(SignUpUseCaseParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ));

      res.fold((l) => emit(AuthFailure(message: l.message)),
          (r) => _emitAuthSuccess(r, emit));
    });

    // event
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoading());

      final res = await _signInUseCase(SignInUseCaseParams(
        email: event.email,
        password: event.password,
      ));

      res.fold((l) => emit(AuthFailure(message: l.message)),
          (r) => _emitAuthSuccess(r, emit));
    });

// event
    on<IsUserSignedIn>((event, emit) async {
      final res = await _getCurrentUserUsecase(NoParams());

      res.fold((l) => emit(AuthFailure(message: l.message)),
          (r) => _emitAuthSuccess(r, emit));
    });
  }

// helper function for emitting AuthSuccess
  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user: user));
  }
}
