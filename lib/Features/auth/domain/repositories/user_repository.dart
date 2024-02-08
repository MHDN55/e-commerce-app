import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';


abstract class UserRepository {
  Future<Either<Failure, Unit>> signIn(UserEntity user);
  Future<Either<Failure, Unit>> signUp(UserEntity user);
  Future<Either<Failure, Unit>> signOut();
}
