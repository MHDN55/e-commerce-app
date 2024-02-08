// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_signup_bloc.dart';

class SigninSignupState extends Equatable {
  const SigninSignupState();

  @override
  List<Object> get props => [];
}

class SigninSignupInitial extends SigninSignupState {}

class SigninSignupLoading extends SigninSignupState {
  @override
  List<Object> get props => [];
}

class SigninSignupLoaded extends SigninSignupState {
  @override
  List<Object> get props => [];
}

class SigninSignupFailure extends SigninSignupState {
  final String message;

  const SigninSignupFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
