// ignore_for_file: type_literal_in_constant_pattern, avoid_print

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/Strings/failures.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:e_commerce_app/Features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:e_commerce_app/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

part 'signin_signup_event.dart';
part 'signin_signup_state.dart';

@lazySingleton
class SigninSignupBloc extends Bloc<SigninSignupEvent, SigninSignupState> {
  final SignInUseCase signIn;
  final SignUpUseCase signUp;
  final SignOutUseCase signOut;
  SigninSignupBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
  }) : super(SigninSignupInitial()) {
    on<SigninSignupEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(SigninSignupLoading());
        final failureOrDoneMessage = await signIn(event.user);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage));
      } else if (event is SignUpEvent) {
        emit(SigninSignupLoading());
        final failureOrDoneMessage = await signUp(event.user);
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage));
      } else if (event is SignOutEvent) {
        emit(SigninSignupLoading());
        final failureOrDoneMessage = await signOut();
        emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage));
      }

    });
  }

  SigninSignupState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either) {
    return either.fold(
      (failure) => SigninSignupFailure(message: _mapFailureToMessage(failure)),
      (user) => SigninSignupLoaded(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    print(
        "=========================================================${failure.runtimeType}");
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case UserNotFoundFailure:
        return USER_NOT_FOUND_MESSAGE;
      case WrongPasswordFailure:
        return WRONG_PASSWORD_MESSAGE;
      case WeakPasswordFailure:
        return WEAK_PASSWORD_MESSAGE;
      case EmailInUseFailure:
        return EMAIL_IN_USE_MESSAGE;
      default:
        return "Unexpected Error , please try again later .";
    }
  }
}
