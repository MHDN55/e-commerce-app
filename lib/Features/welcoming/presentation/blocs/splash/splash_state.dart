// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

enum SplashStatus { loaded, initial, loading, error }

class SplashState extends Equatable {
  final SplashStatus status;
  final bool isAuth;
  final bool isOnboarding;
  final RemoteMessage remoteMessage;
  const SplashState({
    required this.status,
    required this.isAuth,
    required this.isOnboarding,
    required this.remoteMessage,
  });

  @override
  List<Object> get props => [
        status,
        isAuth,
        isOnboarding,
        remoteMessage,
      ];

  SplashState copyWith({
    SplashStatus? status,
    bool? isAuth,
    bool? isOnboarding,
    RemoteMessage? remoteMessage,
  }) {
    return SplashState(
      status: status ?? this.status,
      isAuth: isAuth ?? this.isAuth,
      isOnboarding: isOnboarding ?? this.isOnboarding,
      remoteMessage: remoteMessage ?? this.remoteMessage,
    );
  }
}
