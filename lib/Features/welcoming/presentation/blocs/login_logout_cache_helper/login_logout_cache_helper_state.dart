// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_logout_cache_helper_bloc.dart';

sealed class LoginLogoutCacheHelperState extends Equatable {
  const LoginLogoutCacheHelperState();

  @override
  List<Object> get props => [];
}

final class LoginLogoutCacheHelperInitial extends LoginLogoutCacheHelperState {}

class LoginLogoutCacheHelperCached extends LoginLogoutCacheHelperState {
  final bool isAuth;
  final bool isOnboarding;
  const LoginLogoutCacheHelperCached({
    required this.isAuth,
    required this.isOnboarding,
  });

  @override
  List<Object> get props => [isAuth, isOnboarding];
}
