// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_signup_bloc.dart';

class SigninSignupEvent extends Equatable {
  const SigninSignupEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends SigninSignupEvent {
  final UserEntity user;
  const SignInEvent({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class SignUpEvent extends SigninSignupEvent {
  final UserEntity user;
  const SignUpEvent({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class SignOutEvent extends SigninSignupEvent {
  @override
  List<Object> get props => [];
}

