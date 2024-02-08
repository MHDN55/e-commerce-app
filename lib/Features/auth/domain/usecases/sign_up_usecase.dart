import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/auth/domain/repositories/user_repository.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await repository.signUp(user);
  }
}
