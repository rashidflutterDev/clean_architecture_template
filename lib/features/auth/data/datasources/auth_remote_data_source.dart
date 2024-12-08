import 'dart:core';

import 'package:clean_architecture_template/core/error/app_exeption.dart';
import 'package:supabase/supabase.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(
      {required String email, required String password, required String name});
  Future<String> signInWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final res = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });

      return res.user!.id;
    } on AuthException catch (e) {
      throw AppExeption(e.message);
    } catch (e) {
      throw AppExeption(e.toString());
    }
  }

  @override
  Future<String> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final res = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);

      return res.user!.id;
    } on AuthException catch (e) {
      throw AppExeption(e.message);
    } catch (e) {
      throw AppExeption(e.toString());
    }
  }
}
