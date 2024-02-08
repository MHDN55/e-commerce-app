import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<Unit> cachingSignInSignOut(bool chached);
  Future<bool> getCachedSignInSignOut();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<Unit> cachingSignInSignOut(bool chached) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('repeat', chached);
    return Future.value(unit);
  }

  @override
  Future<bool> getCachedSignInSignOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? inOrNot = prefs.getBool("repeat");
    return inOrNot ?? false;
  }
}
