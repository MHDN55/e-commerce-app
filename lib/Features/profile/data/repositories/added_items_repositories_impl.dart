
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/Features/profile/data/models/order_list_model.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:injectable/injectable.dart';

import 'package:e_commerce_app/Features/profile/data/datasources/added_items_remote_datasource.dart';
import 'package:e_commerce_app/Features/profile/domain/repositories/added_items_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/core/network/network_info.dart';

@LazySingleton(as: AddedItemsRepository)
class AddedItemsRepositoryImpl implements AddedItemsRepository {
  final AddedItemsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AddedItemsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  // @override
  // Future<Either<Failure, List<AddedItemsModel>>> getAddedItems() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteAddedItems = await remoteDataSource.getAddedItems();
  //       return Right(remoteAddedItems);
  //     } on ServerException {
  //       Left(ServerFailure());
  //     } catch (e) {
  //       print("=========================================$e");
  //     }
  //   }
  //   return Left(ServerFailure());
  // }

  @override
  Future<Either<Failure, List<OrdersListModel>>> getAddedOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAddedOrders = await remoteDataSource.getAddedOrders();
        return Right(remoteAddedOrders);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<UserModel>>> getCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getCurrentUser();
        return Right(remoteUser);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, String>> addProfileImage(File file, String imageName) async{
     
        if (await networkInfo.isConnected) {
      try {
        final remoteImage = await remoteDataSource.addProfileImage(file,imageName);
        return Right(remoteImage);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }
}
