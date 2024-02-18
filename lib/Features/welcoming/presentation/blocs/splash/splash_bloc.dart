import 'package:e_commerce_app/Features/auth/data/datasources/user_local_data_source.dart';
import 'package:e_commerce_app/Features/welcoming/data/datasources/onboarding_local_data_source.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';

part 'splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc()
      : super(
          const SplashState(
            status: SplashStatus.initial,
            isAuth: false,
            isOnboarding: false,
            remoteMessage: RemoteMessage(),
          ),
        ) {
    on<SplashEvent>(
      (event, emit) async {
        if (event is GetCachedSplashEvent) {
          final isAuth = await UserLocalDataSourceImpl().getCachedOnboarding();

          final isOnboarding = await OnBoarding().getCachedOnboarding();

          await Future.delayed(const Duration(seconds: 1));
          final RemoteMessage? remoteMessage =
              await FirebaseMessaging.instance.getInitialMessage();
          emit(
            state.copyWith(
              status: SplashStatus.loaded,
              isAuth: isAuth,
              isOnboarding: isOnboarding,
              remoteMessage: remoteMessage,
            ),
          );
        }
      },
    );
  }
}
