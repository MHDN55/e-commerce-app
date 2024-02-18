// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/auth/data/datasources/user_local_data_source.dart';
import 'package:e_commerce_app/Features/auth/data/datasources/user_remote_data_source.dart';
import 'package:e_commerce_app/Features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/auth/domain/repositories/user_repository.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';

typedef SignInOrSignUpOrSignOut = Future<Unit> Function();

@LazySingleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserRepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> signIn(UserEntity user) async {
    UserModel userModel = UserModel(
      email: user.email,
      password: user.password,
      name: user.name,
    );
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signIn(userModel);
        await localDataSource.cachingOnboarding(true);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signOut();
        await localDataSource.cachingOnboarding(false);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    UserModel userModel = UserModel(
      email: user.email,
      password: user.password,
      name: user.name,
    );
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signUp(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
    // return await (_getStatue(() async {
    //   return await remoteDataSource.signUp(userModel);
    // }));
  }

  // Future<Either<Failure, Unit>> _getStatue(
  //     Future<Unit> Function() signInOrSignUpOrSignOut) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       signInOrSignUpOrSignOut;
  //       return const Right(unit);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(OfflineFailure());
  //   }
  // }
}
