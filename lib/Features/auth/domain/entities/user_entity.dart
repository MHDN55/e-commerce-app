// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  const UserEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password,name];
}
