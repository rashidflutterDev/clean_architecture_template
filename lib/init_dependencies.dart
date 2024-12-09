import 'package:clean_architecture_template/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_template/core/secretes/app_secetes.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_template/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:clean_architecture_template/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:clean_architecture_template/init_dependencies.dart';

part 'init_dependencies_main.dart';
