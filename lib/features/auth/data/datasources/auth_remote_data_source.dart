import 'dart:core';

import 'package:clean_architecture_template/core/error/app_exeption.dart';
import 'package:clean_architecture_template/features/auth/data/models/usermodel.dart';
import 'package:supabase/supabase.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModel?> getCurrentUser();
  Future<UserModel> signUpWithEmailPassword(
      {required String email, required String password, required String name});
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      if (currentUserSession?.user.id != null) {
        final user = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);

        return UserModel.fromJson(user[0])
            .copyWith(email: currentUserSession!.user.email);
      }

      return null;
    } catch (e) {
      throw AppExeption(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final res = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });

      if (res.user == null) {
        throw const AppExeption('User is null!');
      }

      return UserModel.fromJson(res.user!.toJson());
    } on AuthException catch (e) {
      print('error: ${e.message}');
      throw AppExeption(e.message);
    } catch (e) {
      throw AppExeption(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final res = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);

      if (res.user == null) {
        throw const AppExeption('User is null!');
      }
      return UserModel.fromJson(res.user!.toJson());
    } on AuthException catch (e) {
      throw AppExeption(e.message);
    } catch (e) {
      throw AppExeption(e.toString());
    }
  }
}
