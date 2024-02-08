import 'package:e_commerce_app/Features/auth/data/datasources/user_local_data_source.dart';
import 'package:e_commerce_app/Features/welcoming/data/datasources/onboarding_local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_logout_cache_helper_event.dart';
part 'login_logout_cache_helper_state.dart';

@lazySingleton
class LoginLogoutCacheHelperBloc
    extends Bloc<LoginLogoutCacheHelperEvent, LoginLogoutCacheHelperState> {
  LoginLogoutCacheHelperBloc() : super(LoginLogoutCacheHelperInitial()) {
    on<LoginLogoutCacheHelperEvent>((event, emit) async {
      if (event is LoginLogoutChachHelperSignInSignOutCaching) {
        await Future.delayed(const Duration(seconds: 2));

        final isCached =
            await UserLocalDataSourceImpl().getCachedSignInSignOut();

        final isOnboarding = await OnBoarding().getCachedOnboarding();

        emit(LoginLogoutCacheHelperCached(
            isAuth: isCached, isOnboarding: isOnboarding));
      }
    });
  }
}
